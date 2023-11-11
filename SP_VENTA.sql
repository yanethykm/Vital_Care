--------------------------------------------------------
----------- PROCEDIMIENTO ALMACENADO INSERT ------------
--------------------------------------------------------
CREATE OR REPLACE PROCEDURE sp_Insert_Venta (
    p_IdCliente IN INT,
    p_IdVendedor IN INT
) AS
BEGIN
    INSERT INTO Venta (Fecha, IdCliente, IdVendedor)
    VALUES (SYSDATE, p_IdCliente, p_IdVendedor);
    
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END sp_Insert_Venta;
/
--------------------------------------------------------
----------- PROCEDIMIENTO ALMACENADO DELETE ------------
--------------------------------------------------------
CREATE OR REPLACE PROCEDURE sp_Delete_Venta (
    p_IDVenta IN INT
) AS
BEGIN
    DELETE FROM Venta
    WHERE ID = p_IDVenta;
    
    COMMIT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se encontró una venta con el ID ' || p_IDVenta);
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END sp_Delete_Venta;
/

-------------------------------------------------------------------------------
--------------- PROCEDIMIENTO ALMACENADO UPDATE -------------------------------
-------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE sp_Update_Venta (
    p_IDVenta IN INT,
    p_Fecha IN DATE,
    p_IdCliente IN INT,
    p_IdVendedor IN INT
) AS
BEGIN
    UPDATE Venta
    SET Fecha = p_Fecha,
        IdCliente = p_IdCliente,
        IdVendedor = p_IdVendedor
    WHERE ID = p_IDVenta;

    COMMIT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se encontró una venta con el ID ' || p_IDVenta);
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END sp_Update_Venta;
/

-------------------------------------------------------------------------------
---------------PROCEDIMIENTO ALMACENADO LIST ---------------------------------
-------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE sp_List_Venta AS
BEGIN
    FOR VentaRow IN (SELECT ID, Fecha, IdCliente, IdVendedor FROM Venta) LOOP
        DBMS_OUTPUT.PUT_LINE('ID de la Venta: ' || VentaRow.ID);
        DBMS_OUTPUT.PUT_LINE('Fecha: ' || TO_CHAR(VentaRow.Fecha, 'YYYY-MM-DD'));
        DBMS_OUTPUT.PUT_LINE('Cliente: ' || VentaRow.IdCliente);
        DBMS_OUTPUT.PUT_LINE('Vendedor: ' || VentaRow.IdVendedor);
        DBMS_OUTPUT.PUT_LINE('-----------------------');
    END LOOP;
END sp_List_Venta;
/
