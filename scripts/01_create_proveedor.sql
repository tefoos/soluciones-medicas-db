-- ============================================
-- TABLA PROVEEDOR
-- Archivo: 01_create_proveedor.sql
-- ============================================

CREATE TABLE Proveedor (
    ID_Proveedor INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    NIT VARCHAR(20) UNIQUE NOT NULL,
    Direccion VARCHAR(200) NOT NULL
);

CREATE INDEX idx_proveedor_nit ON Proveedor(NIT);
