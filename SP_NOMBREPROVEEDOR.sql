CREATE OR REPLACE PROCEDURE sp_List_ProveedorNombre AS
BEGIN
    FOR ProveedorRow IN (
        SELECT 
            nit_cedula AS "Nit o Cédula", 
            nombre_razonsocial AS "Nombre o Razon Social", 
            apellido AS Apellido, 
            telefono AS Telefono, 
            email AS "Correo electronico" 
        FROM Proveedor PRO 
        INNER JOIN Persona PER ON PRO.idpersona = PER.id
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('Nit o Cédula: ' || ProveedorRow."Nit o Cédula");
        DBMS_OUTPUT.PUT_LINE('Nombre o Razon Social: ' || ProveedorRow."Nombre o Razon Social");
        DBMS_OUTPUT.PUT_LINE('Apellido: ' || ProveedorRow.Apellido);
        DBMS_OUTPUT.PUT_LINE('Telefono: ' || ProveedorRow.Telefono);
        DBMS_OUTPUT.PUT_LINE('Correo electronico: ' || ProveedorRow."Correo electronico");
        DBMS_OUTPUT.PUT_LINE('-----------------------');
    END LOOP;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se encontraron proveedores.');
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END sp_List_ProveedorNombre;
/

