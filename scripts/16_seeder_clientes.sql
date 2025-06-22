-- ============================================
-- DATOS DE CLIENTES
-- Archivo: 16_seeder_clientes.sql
-- ============================================

INSERT INTO Cliente (Nombre, NIT, Calle, Ciudad, Codigo_Postal, Correo_Electronico) VALUES
('Hospital San Juan de Dios', '890123456-1', 'Carrera 10 #15-25', 'Bogota', '110111', 'compras@hsanjuan.gov.co'),
('Clinica Los Andes', '890234567-2', 'Calle 134 #7-83', 'Bogota', '110221', 'administracion@clinicalosandes.com'),
('Hospital Pablo Tobon Uribe', '890345678-3', 'Calle 78B #69-240', 'Medellin', '050034', 'suministros@hptu.org.co'),
('Clinica Valle del Lili', '890456789-4', 'Carrera 98 #18-49', 'Cali', '760032', 'logistica@valledellili.org'),
('Hospital Universitario del Caribe', '890567890-5', 'Calle 29 #50-50', 'Cartagena', '130001', 'compras@hucaribe.gov.co'),
('Centro Medico Imbanaco', '890678901-6', 'Carrera 38A #5A-100', 'Cali', '760043', 'administracion@imbanaco.com'),
('Clinica Cardiovascular Santa Maria', '890789012-7', 'Calle 47 #32-15', 'Medellin', '050021', 'suministros@cardiovascular.com'),
('Hospital El Tunal', '890890123-8', 'Carrera 20 #47B-35 Sur', 'Bogota', '110731', 'almacen@hospitaleltunal.gov.co');

INSERT INTO Cliente_Telefono (ID_Cliente, Telefono, Tipo_Telefono) VALUES
(1, '601-3456789', 'Principal'),
(1, '601-3456790', 'Fax'),
(2, '601-2345678', 'Principal'),
(2, '310-1234567', 'Celular'),
(3, '604-4567890', 'Principal'),
(3, '604-4567891', 'Secundario'),
(4, '602-5678901', 'Principal'),
(4, '602-5678902', 'Fax'),
(5, '605-6789012', 'Principal'),
(6, '602-7890123', 'Principal'),
(7, '604-8901234', 'Principal'),
(8, '601-9012345', 'Principal');
