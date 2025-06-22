-- ============================================
-- DATOS DE EMPLEADOS
-- Archivo: 17_seeder_empleados.sql
-- ============================================

INSERT INTO Empleado (Nombre, Cargo, Area, Correo_Institucional) VALUES
('Carlos Mendoza', 'Tecnico Senior', 'Mantenimiento', 'carlos.mendoza@solucionesmedicas.com'),
('Ana Maria Lopez', 'Tecnico Junior', 'Mantenimiento', 'ana.lopez@solucionesmedicas.com'),
('Roberto Garcia', 'Coordinador Tecnico', 'Mantenimiento', 'roberto.garcia@solucionesmedicas.com'),
('Lucia Fernandez', 'Tecnico Especialista', 'Mantenimiento', 'lucia.fernandez@solucionesmedicas.com'),
('Diego Ramirez', 'Tecnico Senior', 'Mantenimiento', 'diego.ramirez@solucionesmedicas.com'),
('Patricia Morales', 'Jefe de Logistica', 'Logistica', 'patricia.morales@solucionesmedicas.com'),
('Miguel Torres', 'Coordinador de Ventas', 'Comercial', 'miguel.torres@solucionesmedicas.com');

INSERT INTO Empleado_Certificacion (ID_Empleado, Certificacion, Tipo_Certificacion, Fecha_Vencimiento, Estado) VALUES
(1, 'Certificacion Equipos Medicos Basicos', 'Equipos', '2026-03-15', 'Vigente'),
(1, 'Certificacion Mantenimiento Preventivo', 'Equipos', '2025-12-20', 'Vigente'),
(2, 'Certificacion Equipos Medicos Basicos', 'Equipos', '2025-08-10', 'Por Vencer'),
(2, 'Certificacion Reactivos de Laboratorio', 'Reactivos', '2026-01-25', 'Vigente'),
(3, 'Certificacion Equipos Avanzados', 'Equipos', '2026-06-30', 'Vigente'),
(3, 'Certificacion Supervision Tecnica', 'Equipos', '2025-11-15', 'Vigente'),
(4, 'Certificacion Equipos Medicos Basicos', 'Equipos', '2026-02-28', 'Vigente'),
(4, 'Certificacion Equipos Avanzados', 'Equipos', '2025-09-12', 'Vigente'),
(5, 'Certificacion Equipos Medicos Basicos', 'Equipos', '2026-04-18', 'Vigente'),
(5, 'Certificacion Mantenimiento Correctivo', 'Equipos', '2025-10-05', 'Vigente');
