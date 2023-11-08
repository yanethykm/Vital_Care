--------------------------------------------------------
----------- PROCEDIMIENTO ALMACENADO INSERT ------------
--------------------------------------------------------
CREATE OR REPLACE PROCEDURE sp_Insert_Devolucion (
    p_FechaDevolucion IN DATE,
    p_CantidadDevuelta IN INT,
    p_RazonDevolucion IN VARCHAR,
    p_IdVenta IN INT
) AS
BEGIN
    INSERT INTO Devolucion (FechaDevolucion, CantidadDevuelta, RazonDevolucion, IdVenta)
    VALUES (p_FechaDevolucion, p_CantidadDevuelta, p_RazonDevolucion, p_IdVenta);
    
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END sp_Insert_Devolucion;
/


--------------------------------------------------------
----------- PROCEDIMIENTO ALMACENADO DELETE ------------
--------------------------------------------------------
CREATE OR REPLACE PROCEDURE sp_Delete_Devolucion (
    p_IDDevolucion IN NUMBER
) AS
BEGIN
    DELETE FROM Devolucion
    WHERE ID = p_IDDevolucion;
    
    COMMIT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se encontró una devolución con el ID ' || p_IDDevolucion);
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END sp_Delete_Devolucion;
/

-------------------------------------------------------------------------------
--------------- PROCEDIMIENTO ALMACENADO UPDATE -------------------------------
-------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE sp_Update_Devolucion (
    p_IDDevolucion IN INT,
    p_FechaDevolucion IN DATE,
    p_CantidadDevuelta IN INT,
    p_RazonDevolucion IN VARCHAR,
    p_IdVenta IN INT
) AS
BEGIN
    UPDATE Devolucion
    SET FechaDevolucion = p_FechaDevolucion,
        CantidadDevuelta = p_CantidadDevuelta,
        RazonDevolucion = p_RazonDevolucion,
        IdVenta = p_IdVenta
    WHERE ID = p_IDDevolucion;

    COMMIT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se encontró una devolución con el ID ' || p_IDDevolucion);
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END sp_Update_Devolucion;
/


-------------------------------------------------------------------------------
--------------- PROCEDIMIENTO ALMACENADO LIST ---------------------------------
-------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE sp_List_Devolucion AS
BEGIN
    FOR DevolucionRow IN (SELECT FechaDevolucion, CantidadDevuelta, RazonDevolucion, IdVenta FROM Devolucion) LOOP
        DBMS_OUTPUT.PUT_LINE('Fecha de Devolución: ' || TO_CHAR(DevolucionRow.FechaDevolucion, 'YYYY-MM-DD'));
        DBMS_OUTPUT.PUT_LINE('Cantidad Devuelta: ' || DevolucionRow.CantidadDevuelta);
        DBMS_OUTPUT.PUT_LINE('Razón de Devolución: ' || DevolucionRow.RazonDevolucion);
        DBMS_OUTPUT.PUT_LINE('ID de Venta: ' || DevolucionRow.IdVenta);
        DBMS_OUTPUT.PUT_LINE('-----------------------');
    END LOOP;
END sp_List_Devolucion;
/
