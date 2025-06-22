-- ============================================
-- DATOS DE PEDIDOS Y FACTURAS
-- Archivo: 19_seeder_pedidos_facturas.sql
-- ============================================

INSERT INTO Pedido (ID_Cliente, Fecha_Solicitud, Estado, Observaciones) VALUES
(1, '2025-06-01', 'Entregado', 'Pedido urgente para cirugias programadas'),
(2, '2025-06-05', 'Entregado', 'Pedido mensual de insumos'),
(3, '2025-06-10', 'Entregado', 'Compra de equipo nuevo para UCI'),
(4, '2025-06-12', 'Entregado', 'Reposicion de reactivos'),
(1, '2025-06-15', 'Entregado', 'Segundo pedido del mes'),
(5, '2025-06-18', 'Entregado', 'Pedido de emergencia'),
(2, '2025-06-19', 'Solicitado', 'Verificar disponibilidad de productos'),
(3, '2025-06-20', 'En Preparacion', 'Pedido en preparacion'),
(4, '2025-06-20', 'Listo para Despacho', 'Listo para envio'),
(6, '2025-06-21', 'Solicitado', 'Pedido nuevo'),
(7, '2025-06-21', 'Solicitado', 'Urgente para UCI'),
(8, '2025-05-15', 'Entregado', 'Pedido mayo'),
(1, '2025-05-20', 'Entregado', 'Pedido mayo'),
(2, '2025-05-25', 'Entregado', 'Pedido mayo');

INSERT INTO Pedido_Producto (ID_Pedido, ID_Producto, Cantidad, Precio_Unitario, Autorizacion_Cliente, Autorizacion_Gerencial) VALUES
(1, 1, 5, 45000, FALSE, FALSE),
(1, 2, 10, 25000, FALSE, FALSE),
(1, 3, 3, 35000, FALSE, FALSE),
(2, 4, 20, 18000, FALSE, FALSE),
(2, 5, 8, 15000, FALSE, FALSE),
(3, 8, 1, 8500000, FALSE, FALSE),
(3, 11, 2, 4500000, FALSE, FALSE),
(4, 13, 5, 180000, FALSE, FALSE),
(4, 14, 10, 95000, FALSE, FALSE),
(5, 1, 3, 45000, FALSE, FALSE),
(5, 2, 15, 25000, FALSE, FALSE),
(6, 2, 15, 25000, FALSE, FALSE),
(6, 3, 10, 35000, FALSE, FALSE),
(7, 1, 2, 45000, FALSE, FALSE),
(8, 2, 5, 25000, FALSE, FALSE),
(10, 8, 1, 8500000, FALSE, FALSE),
(12, 1, 8, 45000, FALSE, FALSE),
(13, 2, 12, 25000, FALSE, FALSE),
(14, 3, 6, 35000, FALSE, FALSE);

INSERT INTO Factura (ID_Pedido, Fecha_Emision, Total, Forma_Pago, Estado, Fecha_Vencimiento) VALUES
(1, '2025-06-01', 430000, 'Credito', 'Emitida', '2025-07-01'),
(2, '2025-06-05', 480000, 'Transferencia', 'Pagada', '2025-06-20'),
(3, '2025-06-10', 17500000, 'Credito', 'Emitida', '2025-07-10'),
(4, '2025-06-12', 1850000, 'Credito', 'Emitida', '2025-07-12'),
(5, '2025-06-15', 960000, 'Transferencia', 'Pagada', '2025-06-30'),
(6, '2025-06-18', 495000, 'Credito', 'Emitida', '2025-07-18'),
(12, '2025-05-15', 360000, 'Credito', 'Vencida', '2025-04-15'),
(13, '2025-05-20', 300000, 'Credito', 'Pagada', '2025-06-20'),
(14, '2025-05-25', 210000, 'Credito', 'Emitida', '2025-06-25');

INSERT INTO Equipo (ID_Cliente, ID_Producto, Numero_Serie, Modelo, Fecha_Instalacion, Estado) VALUES
(1, 8, 'MX450-001', 'MX-450A', '2025-06-02', 'Activo'),
(3, 8, 'MX450-002', 'MX-450A', '2025-06-11', 'Activo'),
(3, 11, 'IV200-001', 'IV-200B', '2025-06-11', 'Activo'),
(3, 11, 'IV200-002', 'IV-200B', '2025-06-11', 'Activo'),
(1, 9, 'ECG12-001', 'ECG-12A', '2024-03-20', 'Activo'),
(2, 10, 'DEA300-001', 'DEA-300C', '2024-01-10', 'Activo');

INSERT INTO Mantenimiento (ID_Equipo, ID_Empleado, Fecha_Programada, Fecha_Ejecutada, Tipo_Mantenimiento, Estado, Observaciones) VALUES
(1, 1, '2025-06-25', NULL, 'Preventivo', 'Programado', 'Mantenimiento trimestral'),
(2, 1, '2025-06-28', NULL, 'Preventivo', 'Programado', 'Revision post-instalacion'),
(5, 1, '2025-06-30', NULL, 'Preventivo', 'Programado', 'Mantenimiento anual ECG'),
(6, 1, '2025-07-05', NULL, 'Calibracion', 'Programado', 'Calibracion semestral'),
(3, 1, '2025-06-15', '2025-06-15', 'Preventivo', 'Completado', 'Mantenimiento post-instalacion OK'),
(4, 1, '2025-06-15', '2025-06-15', 'Preventivo', 'Completado', 'Mantenimiento post-instalacion OK');
