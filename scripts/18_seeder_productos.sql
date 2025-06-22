-- ============================================
-- DATOS DE PRODUCTOS
-- Archivo: 18_seeder_productos.sql
-- ============================================

INSERT INTO Producto (ID_Proveedor, Nombre, Categoria, Descripcion, Precio, Fecha_Vencimiento, Stock_Minimo, Stock_Actual) VALUES
(1, 'Guantes de Nitrilo Talla M', 'Insumos', 'Caja x100 unidades, libres de latex', 45000, '2025-07-15', 50, 200),
(1, 'Mascarillas Quirurgicas', 'Insumos', 'Caja x50 unidades, 3 capas', 25000, '2025-07-30', 100, 350),
(3, 'Jeringas 10ml Esteriles', 'Insumos', 'Caja x100 unidades, descartables', 35000, '2025-08-20', 75, 180),
(3, 'Gasas Esteriles 10x10', 'Insumos', 'Paquete x25 unidades', 18000, '2025-07-25', 40, 120),
(1, 'Alcohol Antiseptico 70%', 'Insumos', 'Botella x1000ml', 15000, '2025-08-10', 30, 85),
(5, 'Cateteres Intravenosos', 'Insumos', 'Caja x20 unidades', 55000, '2026-01-15', 50, 8),
(3, 'Vendas Elasticas', 'Insumos', 'Rollo 10cm x 4.5m', 12000, '2025-12-30', 25, 5),
(2, 'Monitor de Signos Vitales MX-450', 'Equipos', 'Monitor multiparametro con pantalla LCD', 8500000, NULL, 2, 5),
(4, 'Electrocardiografo ECG-12', 'Equipos', 'ECG de 12 derivaciones con impresora', 6200000, NULL, 1, 3),
(2, 'Desfibrilador Automatico DEA-300', 'Equipos', 'Desfibrilador externo automatico', 12000000, NULL, 1, 2),
(4, 'Bomba de Infusion IV-200', 'Equipos', 'Bomba de infusion volumetrica', 4500000, NULL, 3, 8),
(2, 'Ventilador Mecanico VM-800', 'Equipos', 'Ventilador para cuidados intensivos', 25000000, NULL, 1, 2),
(5, 'Reactivos Quimica Sanguinea', 'Reactivos', 'Kit para 500 determinaciones', 180000, '2025-09-15', 10, 25),
(5, 'Tiras Reactivas Glucosa', 'Reactivos', 'Caja x100 tiras', 95000, '2025-11-30', 20, 45),
(3, 'Medio de Contraste Iodado', 'Reactivos', 'Vial x100ml', 75000, '2026-01-20', 15, 30);
