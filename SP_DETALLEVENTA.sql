-------------------------------------------------------------------------------
------------------- PROCEDIMIENTO ALMACENADO INSERT ---------------------------
-------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE sp_Insert_DetalleVenta (
    p_CantidadVendida IN INT,
    p_IdProducto IN INT,
    p_IdVenta IN INT
) AS
BEGIN
    INSERT INTO DetalleVenta (CantidadVendida, IdProducto, IdVenta)
    VALUES (p_CantidadVendida, p_IdProducto, p_IdVenta);
    
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END sp_Insert_DetalleVenta;
/

--------------------------------------------------------------------------------
----------------------- PROCEDIMIENTO ALMACENADO UPDATE ------------------------
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE sp_Update_DetalleVenta (
    p_IdDetalleVenta IN INT,
    p_CantidadVendida IN INT,
    p_IdProducto IN INT,
    p_IdVenta IN INT
) AS
BEGIN
    UPDATE DetalleVenta
    SET CantidadVendida = p_CantidadVendida,
        IdProducto = p_IdProducto,
        IdVenta = p_IdVenta
    WHERE ID = p_IdDetalleVenta;

    COMMIT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se encontró un detalle de venta con el ID ' || p_IdDetalleVenta);
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END sp_Update_DetalleVenta;
/

-------------------------------------------------------------------------------
------------------ PROCEDIMIENTO ALMACENADO LISTAR ----------------------------
-------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE sp_List_DetalleVenta AS
BEGIN
    FOR DetalleVentaRow IN (SELECT CantidadVendida, IdProducto, IdVenta FROM DetalleVenta) LOOP
        DBMS_OUTPUT.PUT_LINE('Cantidad Vendida: ' || DetalleVentaRow.CantidadVendida);
        DBMS_OUTPUT.PUT_LINE('ID de Producto: ' || DetalleVentaRow.IdProducto);
        DBMS_OUTPUT.PUT_LINE('ID de Venta: ' || DetalleVentaRow.IdVenta);
        DBMS_OUTPUT.PUT_LINE('-----------------------');
    END LOOP;
END sp_List_DetalleVenta;
/

-------------------------------------------------------------------------------
------------------ PROCEDIMIENTO ALMACENADO DELETE ----------------------------
-------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE sp_Delete_DetalleVenta (
    p_IdDetalleVenta IN NUMBER
) AS
BEGIN
    DELETE FROM DetalleVenta
    WHERE ID = p_IdDetalleVenta;

    COMMIT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se encontró un detalle de venta con el ID ' || p_IdDetalleVenta);
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END sp_Delete_DetalleVenta;
/
