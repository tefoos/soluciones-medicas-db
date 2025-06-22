-- ============================================
-- TABLA PEDIDO_PRODUCTO - RELACIÓN M:N
-- Archivo: 09_create_pedido_producto.sql
-- ============================================

CREATE TABLE Pedido_Producto (
    ID_Pedido INT NOT NULL,
    ID_Producto INT NOT NULL,
    Cantidad INT NOT NULL CHECK(Cantidad > 0),
    Precio_Unitario DECIMAL(10,2) NOT NULL,
    Autorizacion_Cliente BOOLEAN DEFAULT FALSE,
    Autorizacion_Gerencial BOOLEAN DEFAULT FALSE,
    PRIMARY KEY (ID_Pedido, ID_Producto),
    FOREIGN KEY (ID_Pedido) REFERENCES Pedido(ID_Pedido),
    FOREIGN KEY (ID_Producto) REFERENCES Producto(ID_Producto)
);

CREATE INDEX idx_pedido_producto_pedido ON Pedido_Producto(ID_Pedido);
CREATE INDEX idx_pedido_producto_producto ON Pedido_Producto(ID_Producto);
