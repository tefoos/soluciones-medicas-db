-- ============================================
-- TABLA PRODUCTO
-- Archivo: 04_create_producto.sql
-- ============================================

CREATE TABLE Producto (
    ID_Producto INT PRIMARY KEY AUTO_INCREMENT,
    ID_Proveedor INT NOT NULL,
    Nombre VARCHAR(100) NOT NULL,
    Categoria VARCHAR(50) NOT NULL,
    Descripcion TEXT,
    Precio DECIMAL(10,2) NOT NULL CHECK(Precio >= 1000),
    Fecha_Vencimiento DATE,
    Stock_Minimo INT DEFAULT 10,
    Stock_Actual INT DEFAULT 0,
    FOREIGN KEY (ID_Proveedor) REFERENCES Proveedor(ID_Proveedor)
);

CREATE INDEX idx_producto_categoria ON Producto(Categoria);
CREATE INDEX idx_producto_fecha_vencimiento ON Producto(Fecha_Vencimiento);
CREATE INDEX idx_producto_proveedor ON Producto(ID_Proveedor);
