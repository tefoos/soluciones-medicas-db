-- ============================================
-- TABLA CLIENTE_TELEFONO - ATRIBUTO MULTIVALUADO
-- Archivo: 10_create_cliente_telefono.sql
-- ============================================

CREATE TABLE Cliente_Telefono (
    ID_Cliente INT NOT NULL,
    Telefono VARCHAR(15) NOT NULL,
    Tipo_Telefono VARCHAR(20) DEFAULT 'Principal'
        CHECK(Tipo_Telefono IN ('Principal', 'Secundario', 'Fax', 'Celular')),
    PRIMARY KEY (ID_Cliente, Telefono),
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente)
);

CREATE INDEX idx_cliente_telefono_cliente ON Cliente_Telefono(ID_Cliente);
CREATE INDEX idx_cliente_telefono_tipo ON Cliente_Telefono(Tipo_Telefono);
