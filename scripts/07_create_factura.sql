-- ============================================
-- TABLA FACTURA
-- Archivo: 07_create_factura.sql
-- ============================================

CREATE TABLE Factura (
    ID_Factura INT PRIMARY KEY AUTO_INCREMENT,
    ID_Pedido INT UNIQUE NOT NULL,
    Fecha_Emision DATE NOT NULL DEFAULT (CURRENT_DATE),
    Total DECIMAL(12,2) NOT NULL DEFAULT 0,
    Forma_Pago VARCHAR(20) NOT NULL
        CHECK(Forma_Pago IN ('Efectivo', 'Transferencia', 'Cheque', 'Credito')),
    Estado VARCHAR(20) NOT NULL DEFAULT 'Emitida'
        CHECK(Estado IN ('Emitida', 'Pagada', 'Vencida', 'Anulada')),
    Fecha_Vencimiento DATE NOT NULL,
    FOREIGN KEY (ID_Pedido) REFERENCES Pedido(ID_Pedido)
);

CREATE INDEX idx_factura_estado ON Factura(Estado);
CREATE INDEX idx_factura_vencimiento ON Factura(Fecha_Vencimiento);
CREATE INDEX idx_factura_emision ON Factura(Fecha_Emision);
CREATE INDEX idx_factura_pedido ON Factura(ID_Pedido);
