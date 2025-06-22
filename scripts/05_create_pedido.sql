-- ============================================
-- TABLA PEDIDO
-- Archivo: 05_create_pedido.sql
-- ============================================

CREATE TABLE Pedido (
    ID_Pedido INT PRIMARY KEY AUTO_INCREMENT,
    ID_Cliente INT NOT NULL,
    Fecha_Solicitud DATE NOT NULL DEFAULT (CURRENT_DATE),
    Estado VARCHAR(20) NOT NULL DEFAULT 'Solicitado'
        CHECK(Estado IN ('Solicitado', 'En Preparacion', 'Listo para Despacho', 'Despachado', 'Entregado', 'Cancelado')),
    Observaciones TEXT,
    Fecha_Estado_Cambio TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente)
);

CREATE INDEX idx_pedido_estado ON Pedido(Estado);
CREATE INDEX idx_pedido_fecha ON Pedido(Fecha_Solicitud);
CREATE INDEX idx_pedido_cliente ON Pedido(ID_Cliente);
