-- ============================================
-- VISTAS PRINCIPALES DEL NEGOCIO
-- Archivo: 20_create_views.sql
-- ============================================

CREATE VIEW v_productos_proximos_vencer AS
SELECT
    p.ID_Producto,
    p.Nombre,
    p.Categoria,
    p.Fecha_Vencimiento,
    p.Stock_Actual,
    DATEDIFF(p.Fecha_Vencimiento, CURRENT_DATE) AS Dias_Para_Vencer,
    CASE
        WHEN DATEDIFF(p.Fecha_Vencimiento, CURRENT_DATE) <= 30 THEN 'CRITICO - Requiere autorizacion especial'
        WHEN DATEDIFF(p.Fecha_Vencimiento, CURRENT_DATE) <= 60 THEN 'ALERTA - Requiere autorizacion cliente'
        ELSE 'NORMAL'
    END AS Estado_Vencimiento,
    pr.Nombre AS Proveedor
FROM Producto p
INNER JOIN Proveedor pr ON p.ID_Proveedor = pr.ID_Proveedor
WHERE p.Fecha_Vencimiento IS NOT NULL
    AND p.Fecha_Vencimiento <= DATE_ADD(CURRENT_DATE, INTERVAL 60 DAY)
    AND p.Stock_Actual > 0
ORDER BY p.Fecha_Vencimiento ASC, p.Stock_Actual DESC;

CREATE VIEW v_top_clientes_mes AS
SELECT
    c.ID_Cliente,
    c.Nombre AS Cliente,
    c.Ciudad,
    COUNT(DISTINCT p.ID_Pedido) AS Total_Pedidos,
    COUNT(DISTINCT pp.ID_Producto) AS Productos_Diferentes,
    SUM(pp.Cantidad * pp.Precio_Unitario) AS Valor_Total_Mes,
    AVG(pp.Cantidad * pp.Precio_Unitario) AS Valor_Promedio_Pedido
FROM Cliente c
INNER JOIN Pedido p ON c.ID_Cliente = p.ID_Cliente
INNER JOIN Pedido_Producto pp ON p.ID_Pedido = pp.ID_Pedido
WHERE p.Estado = 'Entregado'
    AND YEAR(p.Fecha_Solicitud) = YEAR(CURRENT_DATE)
    AND MONTH(p.Fecha_Solicitud) = MONTH(CURRENT_DATE)
GROUP BY c.ID_Cliente, c.Nombre, c.Ciudad
ORDER BY Valor_Total_Mes DESC, Total_Pedidos DESC;

CREATE VIEW v_pedidos_pendientes AS
SELECT
    p.ID_Pedido,
    c.Nombre AS Cliente,
    c.Ciudad,
    p.Fecha_Solicitud,
    p.Estado,
    DATEDIFF(CURRENT_DATE, p.Fecha_Solicitud) AS Dias_Pendiente,
    COUNT(pp.ID_Producto) AS Productos_en_Pedido,
    SUM(pp.Cantidad * pp.Precio_Unitario) AS Valor_Pedido,
    p.Observaciones,
    CASE
        WHEN DATEDIFF(CURRENT_DATE, p.Fecha_Solicitud) > 7 THEN 'URGENTE'
        WHEN DATEDIFF(CURRENT_DATE, p.Fecha_Solicitud) > 3 THEN 'PRIORITARIO'
        ELSE 'NORMAL'
    END AS Prioridad
FROM Pedido p
INNER JOIN Cliente c ON p.ID_Cliente = c.ID_Cliente
INNER JOIN Pedido_Producto pp ON p.ID_Pedido = pp.ID_Pedido
WHERE p.Estado IN ('Solicitado', 'En Preparacion', 'Listo para Despacho')
GROUP BY p.ID_Pedido, c.Nombre, c.Ciudad, p.Fecha_Solicitud, p.Estado, p.Observaciones
ORDER BY Dias_Pendiente DESC, Valor_Pedido DESC;

CREATE VIEW v_mantenimientos_proximos AS
SELECT
    m.ID_Mantenimiento,
    c.Nombre AS Cliente,
    c.Ciudad,
    e.Numero_Serie,
    p.Nombre AS Equipo,
    p.Categoria,
    m.Fecha_Programada,
    DATEDIFF(m.Fecha_Programada, CURRENT_DATE) AS Dias_Para_Mantenimiento,
    m.Tipo_Mantenimiento,
    emp.Nombre AS Tecnico_Asignado,
    emp.Area,
    CASE
        WHEN DATEDIFF(m.Fecha_Programada, CURRENT_DATE) < 0 THEN 'VENCIDO'
        WHEN DATEDIFF(m.Fecha_Programada, CURRENT_DATE) <= 7 THEN 'URGENTE'
        WHEN DATEDIFF(m.Fecha_Programada, CURRENT_DATE) <= 15 THEN 'PROXIMO'
        ELSE 'PROGRAMADO'
    END AS Prioridad
FROM Mantenimiento m
INNER JOIN Equipo e ON m.ID_Equipo = e.ID_Equipo
INNER JOIN Cliente c ON e.ID_Cliente = c.ID_Cliente
INNER JOIN Producto p ON e.ID_Producto = p.ID_Producto
INNER JOIN Empleado emp ON m.ID_Empleado = emp.ID_Empleado
WHERE m.Estado IN ('Programado', 'En Proceso')
    AND m.Fecha_Programada <= DATE_ADD(CURRENT_DATE, INTERVAL 30 DAY)
ORDER BY m.Fecha_Programada ASC, c.Nombre;

CREATE VIEW v_productos_stock_bajo AS
SELECT
    p.Nombre AS Producto,
    p.Categoria,
    p.Stock_Actual,
    p.Stock_Minimo,
    (p.Stock_Minimo - p.Stock_Actual) AS Deficit_Stock,
    pr.Nombre AS Proveedor
FROM Producto p
INNER JOIN Proveedor pr ON p.ID_Proveedor = pr.ID_Proveedor
WHERE p.Stock_Actual <= p.Stock_Minimo
ORDER BY (p.Stock_Minimo - p.Stock_Actual) DESC, p.Categoria;

CREATE VIEW v_facturacion_periodo AS
SELECT
    YEAR(f.Fecha_Emision) AS Anio,
    MONTH(f.Fecha_Emision) AS Mes,
    COUNT(*) AS Total_Facturas,
    SUM(f.Total) AS Valor_Facturado,
    SUM(CASE WHEN f.Estado = 'Pagada' THEN f.Total ELSE 0 END) AS Valor_Cobrado,
    SUM(CASE WHEN f.Estado = 'Vencida' THEN f.Total ELSE 0 END) AS Valor_Vencido,
    ROUND((SUM(CASE WHEN f.Estado = 'Pagada' THEN f.Total ELSE 0 END) / SUM(f.Total)) * 100, 2) AS Porcentaje_Cobrado
FROM Factura f
WHERE f.Fecha_Emision >= DATE_SUB(CURRENT_DATE, INTERVAL 6 MONTH)
GROUP BY YEAR(f.Fecha_Emision), MONTH(f.Fecha_Emision)
ORDER BY Anio DESC, Mes DESC;
