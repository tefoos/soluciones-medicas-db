-- ============================================
-- TABLA CLIENTE
-- Archivo: 02_create_cliente.sql
-- ============================================

CREATE TABLE Cliente (
    ID_Cliente INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    NIT VARCHAR(20) UNIQUE NOT NULL,
    Calle VARCHAR(100) NOT NULL,
    Ciudad VARCHAR(50) NOT NULL,
    Codigo_Postal VARCHAR(10) NOT NULL,
    Correo_Electronico VARCHAR(100),
    Estado_Mora BOOLEAN DEFAULT FALSE
);

CREATE INDEX idx_cliente_nit ON Cliente(NIT);
CREATE INDEX idx_cliente_ciudad ON Cliente(Ciudad);
