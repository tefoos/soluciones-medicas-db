-- ============================================
-- TABLA EMPLEADO
-- Archivo: 03_create_empleado.sql
-- ============================================

CREATE TABLE Empleado (
    ID_Empleado INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    Cargo VARCHAR(50) NOT NULL,
    Area VARCHAR(50) NOT NULL,
    Correo_Institucional VARCHAR(100) UNIQUE
);

CREATE INDEX idx_empleado_area ON Empleado(Area);
CREATE INDEX idx_empleado_cargo ON Empleado(Cargo);
