-- ============================================
-- TABLA PROVEEDOR_CONTACTO - ATRIBUTO MULTIVALUADO
-- Archivo: 11_create_proveedor_contacto.sql
-- ============================================

CREATE TABLE Proveedor_Contacto (
    ID_Proveedor INT NOT NULL,
    Contacto VARCHAR(100) NOT NULL,
    Tipo_Contacto VARCHAR(20) NOT NULL
        CHECK(Tipo_Contacto IN ('Email', 'Telefono', 'WhatsApp', 'Representante')),
    PRIMARY KEY (ID_Proveedor, Contacto),
    FOREIGN KEY (ID_Proveedor) REFERENCES Proveedor(ID_Proveedor)
);

CREATE INDEX idx_proveedor_contacto_proveedor ON Proveedor_Contacto(ID_Proveedor);
CREATE INDEX idx_proveedor_contacto_tipo ON Proveedor_Contacto(Tipo_Contacto);
