-- ============================================
-- TABLA EQUIPO
-- Archivo: 06_create_equipo.sql
-- ============================================

CREATE TABLE Equipo (
    ID_Equipo INT PRIMARY KEY AUTO_INCREMENT,
    ID_Cliente INT NOT NULL,
    ID_Producto INT NOT NULL,
    Numero_Serie VARCHAR(50) UNIQUE NOT NULL,
    Modelo VARCHAR(100) NOT NULL,
    Fecha_Instalacion DATE NOT NULL,
    Estado VARCHAR(20) NOT NULL DEFAULT 'Activo'
        CHECK(Estado IN ('Activo', 'En Mantenimiento', 'Inactivo', 'Retirado')),
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente),
    FOREIGN KEY (ID_Producto) REFERENCES Producto(ID_Producto)
);

CREATE INDEX idx_equipo_estado ON Equipo(Estado);
CREATE INDEX idx_equipo_cliente ON Equipo(ID_Cliente);
CREATE INDEX idx_equipo_producto ON Equipo(ID_Producto);
CREATE INDEX idx_equipo_serie ON Equipo(Numero_Serie);
