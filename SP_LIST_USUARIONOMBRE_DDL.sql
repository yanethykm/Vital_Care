create or replace PROCEDURE sp_List_UsuarioNombre_DDL AS
BEGIN
    FOR UsuarioRow IN (
        SELECT 
            nit_cedula as "Identificacion", 
            nombre_razonsocial as "Nombre/Razon Social", 
            apellido as "Apellido", 
            telefono as "Telefono", 
            email as "Correo electronico"
    FROM Usuario U
    INNER JOIN Persona P on U.idpersona = P.id
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('Identificacion: ' || UsuarioRow."Identificacion");
        DBMS_OUTPUT.PUT_LINE('Nombre/Razon Social: ' || UsuarioRow."Nombre/Razon Social");
        DBMS_OUTPUT.PUT_LINE('Apellido: ' || UsuarioRow."Apellido");
        DBMS_OUTPUT.PUT_LINE('Telefono: ' || UsuarioRow."Telefono");
        DBMS_OUTPUT.PUT_LINE('Correo electronico: ' || UsuarioRow."Correo electronico");
        DBMS_OUTPUT.PUT_LINE('-----------------------');
    END LOOP;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se encontraron Usuarios.');
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END sp_List_UsuarioNombre_DDL;