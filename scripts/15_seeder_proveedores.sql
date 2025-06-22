-- ============================================
-- DATOS DE PROVEEDORES
-- Archivo: 15_seeder_proveedores.sql
-- ============================================

INSERT INTO Proveedor (Nombre, NIT, Direccion) VALUES
('Distribuidora Medica Nacional', '900123456-1', 'Calle 50 #25-30, Bogota'),
('Equipos Hospitalarios S.A.', '800654321-2', 'Carrera 15 #40-20, Medellin'),
('Insumos Medicos del Valle', '700987654-3', 'Avenida 6N #28-15, Cali'),
('Tecnologia Medica Avanzada', '600111222-4', 'Calle 72 #11-35, Bogota'),
('Suministros Clinicos Ltda', '500333444-5', 'Carrera 45 #76-12, Barranquilla');

INSERT INTO Proveedor_Contacto (ID_Proveedor, Contacto, Tipo_Contacto) VALUES
(1, 'ventas@distmedica.com', 'Email'),
(1, '601-2345678', 'Telefono'),
(1, 'Juan Perez', 'Representante'),
(2, 'comercial@equiphospital.com', 'Email'),
(2, '604-3456789', 'Telefono'),
(2, '315-1234567', 'WhatsApp'),
(3, 'pedidos@insumosvalle.com', 'Email'),
(3, '602-4567890', 'Telefono'),
(4, 'info@tecmedavanzada.com', 'Email'),
(4, '601-5678901', 'Telefono'),
(5, 'suministros@clinicosltda.com', 'Email'),
(5, '605-6789012', 'Telefono');
