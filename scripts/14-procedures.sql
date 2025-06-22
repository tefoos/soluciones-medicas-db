-- ============================================
-- PROCEDURES
-- Archivo: 14_procedures.sql
-- ============================================

DELIMITER //

-- ============================================
-- PROCEDIMIENTO: Crear factura automáticamente
-- ============================================
CREATE PROCEDURE sp_crear_factura_automatica(
    IN p_id_pedido INT,
    IN p_forma_pago VARCHAR(20),
    IN p_dias_credito INT
)
BEGIN
    DECLARE v_total DECIMAL(12,2);
    DECLARE v_fecha_vencimiento DATE;

    SELECT SUM(Cantidad * Precio_Unitario) INTO v_total
    FROM Pedido_Producto
    WHERE ID_Pedido = p_id_pedido;

    SET v_fecha_vencimiento = DATE_ADD(CURRENT_DATE, INTERVAL p_dias_credito DAY);

    INSERT INTO Factura (ID_Pedido, Total, Forma_Pago, Fecha_Vencimiento)
    VALUES (p_id_pedido, v_total, p_forma_pago, v_fecha_vencimiento);

    UPDATE Pedido
    SET Estado = 'Entregado'
    WHERE ID_Pedido = p_id_pedido;
END//

-- ============================================
-- PROCEDIMIENTO: Actualizar stock después del despacho
-- ============================================
CREATE PROCEDURE sp_actualizar_stock_despacho(
    IN p_id_pedido INT
)
BEGIN
    UPDATE Producto p
    INNER JOIN Pedido_Producto pp ON p.ID_Producto = pp.ID_Producto
    SET p.Stock_Actual = p.Stock_Actual - pp.Cantidad
    WHERE pp.ID_Pedido = p_id_pedido;

    UPDATE Pedido
    SET Estado = 'Despachado'
    WHERE ID_Pedido = p_id_pedido;
END//

-- ============================================
-- PROCEDIMIENTO: Actualizar estado de mora de clientes
-- ============================================
CREATE PROCEDURE sp_actualizar_estados_mora()
BEGIN
    UPDATE Cliente c
    SET Estado_Mora = (
        SELECT COUNT(*) > 0
        FROM Factura f
        INNER JOIN Pedido p ON f.ID_Pedido = p.ID_Pedido
        WHERE p.ID_Cliente = c.ID_Cliente
        AND f.Estado IN ('Emitida', 'Vencida')
        AND DATEDIFF(CURRENT_DATE, f.Fecha_Vencimiento) > 60
    );
END//

-- ============================================
-- PROCEDIMIENTO: Programar mantenimiento automático
-- ============================================
CREATE PROCEDURE sp_programar_mantenimiento_automatico(
    IN p_id_equipo INT,
    IN p_meses_adelante INT
)
BEGIN
    DECLARE v_fecha_programada DATE;
    DECLARE v_tecnico_disponible INT;
    DECLARE v_categoria_equipo VARCHAR(50);

    SET v_fecha_programada = DATE_ADD(CURRENT_DATE, INTERVAL p_meses_adelante MONTH);

    SELECT pr.Categoria INTO v_categoria_equipo
    FROM Equipo e
    INNER JOIN Producto pr ON e.ID_Producto = pr.ID_Producto
    WHERE e.ID_Equipo = p_id_equipo;

    SELECT ec.ID_Empleado INTO v_tecnico_disponible
    FROM Empleado_Certificacion ec
    WHERE ec.Tipo_Certificacion = v_categoria_equipo
    AND ec.Fecha_Vencimiento > v_fecha_programada
    AND ec.Estado = 'Vigente'
    LIMIT 1;

    IF v_tecnico_disponible IS NOT NULL THEN
        INSERT INTO Mantenimiento (ID_Equipo, ID_Empleado, Fecha_Programada, Tipo_Mantenimiento)
        VALUES (p_id_equipo, v_tecnico_disponible, v_fecha_programada, 'Preventivo');
    END IF;
END//

DELIMITER ;
