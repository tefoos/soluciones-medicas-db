-- ============================================
-- TRIGGERS
-- Archivo: 13_triggers.sql
-- ============================================

DELIMITER //

-- ============================================
-- TRIGGER: Validar máximo 5 pedidos pendientes por cliente
-- ============================================
CREATE TRIGGER trg_validar_pedidos_pendientes
BEFORE INSERT ON Pedido
FOR EACH ROW
BEGIN
    DECLARE pedidos_pendientes INT;

    SELECT COUNT(*) INTO pedidos_pendientes
    FROM Pedido
    WHERE ID_Cliente = NEW.ID_Cliente
    AND Estado IN ('Solicitado', 'En Preparacion', 'Listo para Despacho');

    IF pedidos_pendientes >= 5 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El cliente no puede tener más de 5 pedidos pendientes';
    END IF;
END//

-- ============================================
-- TRIGGER: Validar cliente sin mora mayor a 60 días
-- ============================================
CREATE TRIGGER trg_validar_mora_cliente
BEFORE INSERT ON Pedido
FOR EACH ROW
BEGIN
    DECLARE facturas_vencidas INT;

    SELECT COUNT(*) INTO facturas_vencidas
    FROM Factura f
    INNER JOIN Pedido p ON f.ID_Pedido = p.ID_Pedido
    WHERE p.ID_Cliente = NEW.ID_Cliente
    AND f.Estado IN ('Emitida', 'Vencida')
    AND DATEDIFF(CURRENT_DATE, f.Fecha_Vencimiento) > 60;

    IF facturas_vencidas > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El cliente tiene facturas vencidas por más de 60 días';
    END IF;
END//

-- ============================================
-- TRIGGER: Validar stock disponible al crear pedido
-- ============================================
CREATE TRIGGER trg_validar_stock_pedido
BEFORE INSERT ON Pedido_Producto
FOR EACH ROW
BEGIN
    DECLARE stock_disponible INT;

    SELECT Stock_Actual INTO stock_disponible
    FROM Producto
    WHERE ID_Producto = NEW.ID_Producto;

    IF NEW.Cantidad > stock_disponible THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cantidad solicitada excede el stock disponible';
    END IF;
END//

-- ============================================
-- TRIGGER: Validar productos perecederos según reglas de negocio
-- ============================================
CREATE TRIGGER trg_validar_productos_perecederos
BEFORE INSERT ON Pedido_Producto
FOR EACH ROW
BEGIN
    DECLARE fecha_vencimiento DATE;
    DECLARE dias_restantes INT;
    DECLARE fecha_pedido DATE;

    SELECT p.Fecha_Solicitud INTO fecha_pedido
    FROM Pedido p WHERE p.ID_Pedido = NEW.ID_Pedido;

    SELECT Fecha_Vencimiento INTO fecha_vencimiento
    FROM Producto WHERE ID_Producto = NEW.ID_Producto;

    IF fecha_vencimiento IS NOT NULL THEN
        SET dias_restantes = DATEDIFF(fecha_vencimiento, fecha_pedido);

        IF dias_restantes <= 0 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'No se pueden incluir productos vencidos en pedidos';
        END IF;

        IF dias_restantes < 30 THEN
            IF NEW.Autorizacion_Cliente = FALSE OR NEW.Autorizacion_Gerencial = FALSE THEN
                SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'Productos con menos de 30 días requieren autorización del cliente y gerencial';
            END IF;
        END IF;

        IF dias_restantes >= 30 AND dias_restantes < 60 THEN
            IF NEW.Autorizacion_Cliente = FALSE THEN
                SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'Productos con menos de 60 días requieren autorización del cliente';
            END IF;
        END IF;
    END IF;
END//

-- ============================================
-- TRIGGER: Actualizar total de factura
-- ============================================
CREATE TRIGGER trg_actualizar_total_factura
AFTER INSERT ON Pedido_Producto
FOR EACH ROW
BEGIN
    DECLARE total_pedido DECIMAL(12,2);

    SELECT IFNULL(SUM(Cantidad * Precio_Unitario), 0) INTO total_pedido
    FROM Pedido_Producto
    WHERE ID_Pedido = NEW.ID_Pedido;

    UPDATE Factura
    SET Total = total_pedido
    WHERE ID_Pedido = NEW.ID_Pedido;
END//

-- ============================================
-- TRIGGER: Validar certificaciones vigentes para mantenimiento
-- ============================================
CREATE TRIGGER trg_validar_certificacion_mantenimiento
BEFORE INSERT ON Mantenimiento
FOR EACH ROW
BEGIN
    DECLARE certificaciones_vigentes INT;
    DECLARE categoria_equipo VARCHAR(50);

    SELECT pr.Categoria INTO categoria_equipo
    FROM Equipo e
    INNER JOIN Producto pr ON e.ID_Producto = pr.ID_Producto
    WHERE e.ID_Equipo = NEW.ID_Equipo;

    SELECT COUNT(*) INTO certificaciones_vigentes
    FROM Empleado_Certificacion ec
    WHERE ec.ID_Empleado = NEW.ID_Empleado
    AND ec.Tipo_Certificacion = categoria_equipo
    AND ec.Fecha_Vencimiento > NEW.Fecha_Programada
    AND ec.Estado = 'Vigente';

    IF certificaciones_vigentes = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El empleado no tiene certificaciones vigentes para este tipo de equipo';
    END IF;
END//

DELIMITER ;
