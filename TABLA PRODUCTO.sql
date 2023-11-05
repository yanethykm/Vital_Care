---------------------------------/
--- TABLA PRODUCTO --------------/
---------------------------------/
CREATE TABLE Producto (
    ID INT PRIMARY KEY,
    Producto VARCHAR(100) NOT NULL,
    Descripcion VARCHAR(255) NOT NULL,
    PrecioCompra INT,
    PrecioVenta INT,
    CantidadMinima INT,
    IdCategoria INT,
    FOREIGN KEY (IdCategoria) REFERENCES Categoria(ID),
    IdProveedor INT,
    FOREIGN KEY (IdProveedor) REFERENCES Proveedor(ID)
);
----- SECUENCIA PARA EL AUTOINCREMENTABLE ID ---/
CREATE SEQUENCE Producto_ID_Seq
  START WITH 1
  INCREMENT BY 1
  NOCACHE;
-------- DISPARADOR PARA EL AUTOINCREMENTABLE -----/
CREATE OR REPLACE TRIGGER Producto_BI_TRG
BEFORE INSERT ON Producto
FOR EACH ROW
BEGIN
  SELECT Producto_ID_Seq.NEXTVAL
  INTO :NEW.ID
  FROM dual;
END;
/
------------------------------------------/
----------############################----/
------------------------------------------/


