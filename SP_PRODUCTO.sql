-------------------------------------------------------------------------------
------------------- PROCEDIMIENTO ALMACENADO INSERT ---------------------------
-------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE sp_Insert_Producto (
    p_IdProducto IN INT,
    p_Producto IN VARCHAR,
    p_Descripcion IN VARCHAR,
    p_PrecioCompra IN INT,
    p_PrecioVenta IN INT,
    p_CantidadMinima IN INT,
    p_IdCategoria IN INT,
    p_IdProveedor IN INT,
    p_Cantidad IN INT
) AS
BEGIN
    INSERT INTO Producto (ID, Producto, Descripcion, PrecioCompra, PrecioVenta, CantidadMinima, IdCategoria, IdProveedor, Cantidad)
    VALUES (p_IdProducto, p_Producto, p_Descripcion, p_PrecioCompra, p_PrecioVenta, p_CantidadMinima, p_IdCategoria, p_IdProveedor, p_Cantidad);
    
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END sp_Insert_Producto;
/

--------------------------------------------------------------------------------
----------------------- PROCEDIMIENTO ALMACENADO UPDATE ------------------------
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE sp_Update_Producto (
    p_IdProducto IN INT,
    p_Producto IN VARCHAR,
    p_Descripcion IN VARCHAR,
    p_PrecioCompra IN INT,
    p_PrecioVenta IN INT,
    p_CantidadMinima IN INT,
    p_IdCategoria IN INT,
    p_IdProveedor IN INT,
    p_Cantidad IN INT
) AS
BEGIN
    UPDATE Producto
    SET Producto = p_Producto,
        Descripcion = p_Descripcion,
        PrecioCompra = p_PrecioCompra,
        PrecioVenta = p_PrecioVenta,
        CantidadMinima = p_CantidadMinima,
        IdCategoria = p_IdCategoria,
        IdProveedor = p_IdProveedor,
        Cantidad = p_Cantidad
    WHERE ID = p_IdProducto;

    COMMIT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se encontró un producto con el ID ' || p_IdProducto);
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END sp_Update_Producto;
/

-------------------------------------------------------------------------------
------------------ PROCEDIMIENTO ALMACENADO LISTAR ----------------------------
-------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE sp_List_Producto AS
BEGIN
    FOR ProductoRow IN (SELECT ID, Producto, Descripcion, PrecioCompra, PrecioVenta, CantidadMinima, IdCategoria, IdProveedor, Cantidad FROM Producto) LOOP
        DBMS_OUTPUT.PUT_LINE('Código: ' || ProductoRow.ID);
        DBMS_OUTPUT.PUT_LINE('Nombre del Producto: ' || ProductoRow.Producto);
        DBMS_OUTPUT.PUT_LINE('Descripción del Producto: ' || ProductoRow.Descripcion);
        DBMS_OUTPUT.PUT_LINE('Precio de Compra: ' || ProductoRow.PrecioCompra);
        DBMS_OUTPUT.PUT_LINE('Precio de Venta: ' || ProductoRow.PrecioVenta);
        DBMS_OUTPUT.PUT_LINE('Cantidad Mínima: ' || ProductoRow.CantidadMinima);
        DBMS_OUTPUT.PUT_LINE('ID de Categoría: ' || ProductoRow.IdCategoria);
        DBMS_OUTPUT.PUT_LINE('ID de Proveedor: ' || ProductoRow.IdProveedor);
        DBMS_OUTPUT.PUT_LINE('Cantidad: ' || ProductoRow.Cantidad);
        DBMS_OUTPUT.PUT_LINE('-----------------------');
    END LOOP;
END sp_List_Producto;
/

-------------------------------------------------------------------------------
------------------ PROCEDIMIENTO ALMACENADO DELETE ----------------------------
-------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE sp_Delete_Producto (
    p_IdProducto IN INT
) AS
BEGIN
    DELETE FROM Producto
    WHERE ID = p_IdProducto;

    COMMIT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se encontró un producto con el ID ' || p_IdProducto);
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END sp_Delete_Producto;
/
