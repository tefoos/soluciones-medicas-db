-- ============================================
-- TABLA MANTENIMIENTO
-- Archivo: 08_create_mantenimiento.sql
-- ============================================

CREATE TABLE Mantenimiento (
    ID_Mantenimiento INT PRIMARY KEY AUTO_INCREMENT,
    ID_Equipo INT NOT NULL,
    ID_Empleado INT NOT NULL,
    Fecha_Programada DATE NOT NULL,
    Fecha_Ejecutada DATE,
    Tipo_Mantenimiento VARCHAR(30) NOT NULL
        CHECK(Tipo_Mantenimiento IN ('Preventivo', 'Correctivo', 'Calibracion')),
    Estado VARCHAR(20) NOT NULL DEFAULT 'Programado'
        CHECK(Estado IN ('Programado', 'En Proceso', 'Completado', 'Cancelado')),
    Observaciones TEXT,
    FOREIGN KEY (ID_Equipo) REFERENCES Equipo(ID_Equipo),
    FOREIGN KEY (ID_Empleado) REFERENCES Empleado(ID_Empleado)
);

CREATE INDEX idx_mantenimiento_fecha ON Mantenimiento(Fecha_Programada);
CREATE INDEX idx_mantenimiento_estado ON Mantenimiento(Estado);
CREATE INDEX idx_mantenimiento_equipo ON Mantenimiento(ID_Equipo);
CREATE INDEX idx_mantenimiento_empleado ON Mantenimiento(ID_Empleado);
