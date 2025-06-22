-- ============================================
-- TABLA EMPLEADO_CERTIFICACION - ATRIBUTO MULTIVALUADO
-- Archivo: 12_create_empleado_certificacion.sql
-- ============================================

CREATE TABLE Empleado_Certificacion (
    ID_Empleado INT NOT NULL,
    Certificacion VARCHAR(100) NOT NULL,
    Tipo_Certificacion VARCHAR(50) NOT NULL,
    Fecha_Vencimiento DATE NOT NULL,
    Estado VARCHAR(20) NOT NULL DEFAULT 'Vigente'
        CHECK(Estado IN ('Vigente', 'Por Vencer', 'Vencida', 'Suspendida')),
    PRIMARY KEY (ID_Empleado, Certificacion),
    FOREIGN KEY (ID_Empleado) REFERENCES Empleado(ID_Empleado)
);

CREATE INDEX idx_empleado_cert_empleado ON Empleado_Certificacion(ID_Empleado);
CREATE INDEX idx_empleado_cert_tipo ON Empleado_Certificacion(Tipo_Certificacion);
CREATE INDEX idx_empleado_cert_vencimiento ON Empleado_Certificacion(Fecha_Vencimiento);
CREATE INDEX idx_empleado_cert_estado ON Empleado_Certificacion(Estado);
