create or replace PROCEDURE sp_List_ClienteNombre_DDL AS
BEGIN
    FOR ClienteRow IN (
        SELECT 
            nit_cedula as "Identificacion", 
            nombre_razonsocial as "Nombre/Razon Social", 
            apellido as "Apellido", 
            telefono as "Telefono", 
            email as "Correo electronico"
    FROM Cliente C
    INNER JOIN Persona P on C.idpersona = P.id
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('Identificacion: ' || ClienteRow."Identificacion");
        DBMS_OUTPUT.PUT_LINE('Nombre/Razon Social: ' || ClienteRow."Nombre/Razon Social");
        DBMS_OUTPUT.PUT_LINE('Apellido: ' || ClienteRow."Apellido");
        DBMS_OUTPUT.PUT_LINE('Telefono: ' || ClienteRow."Telefono");
        DBMS_OUTPUT.PUT_LINE('Correo electronico: ' || ClienteRow."Correo electronico");
        DBMS_OUTPUT.PUT_LINE('-----------------------');
    END LOOP;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se encontraron Clientes.');
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END sp_List_ClienteNombre_DDL;