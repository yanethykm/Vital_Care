CREATE OR REPLACE PROCEDURE sp_List_DetalleVenta_DDL
IS
BEGIN
    FOR rec IN (
        SELECT 
            Dv.CantidadVendida as "Cantidad Vendida",
            Pr.Producto as "Producto",
            Pr.Descripcion as "Descripción",
            Pr.PrecioVenta as "Precio de Venta",
            V.Fecha as "Fecha de Venta",
            PCliente.Nit_Cedula as "Identificacion Cliente",
            PCliente.Nombre_RazonSocial as "Nombre Cliente",
            PCliente.Telefono as "Telefono Cliente",
            PVendedor.Nombre_RazonSocial as "Nombre Vendedor"
        FROM DetalleVenta Dv
        INNER JOIN Producto Pr ON Dv.IdProducto = Pr.Id
        INNER JOIN Venta V ON Dv.IdVenta = V.Id
        INNER JOIN Cliente C ON V.IdCliente = C.Id
        INNER JOIN Vendedor Vd ON V.IdVendedor = Vd.ID
        INNER JOIN Persona PCliente ON C.IdPersona = PCliente.ID
        INNER JOIN Persona PVendedor ON Vd.IdPersona = PVendedor.ID
    )
    LOOP
        DBMS_OUTPUT.PUT_LINE('Cantidad Vendida: ' || rec."Cantidad Vendida");
        DBMS_OUTPUT.PUT_LINE('Producto: ' || rec."Producto");
        DBMS_OUTPUT.PUT_LINE('Descripción: ' || rec."Descripción");
        DBMS_OUTPUT.PUT_LINE('Precio de Venta: ' || rec."Precio de Venta");
        DBMS_OUTPUT.PUT_LINE('Fecha de Venta: ' || TO_CHAR(rec."Fecha de Venta", 'DD-MON-YYYY HH24:MI:SS'));
        DBMS_OUTPUT.PUT_LINE('Identificacion Cliente: ' || rec."Identificacion Cliente");
        DBMS_OUTPUT.PUT_LINE('Nombre Cliente: ' || rec."Nombre Cliente");
        DBMS_OUTPUT.PUT_LINE('Telefono Cliente: ' || rec."Telefono Cliente");
        DBMS_OUTPUT.PUT_LINE('Nombre Vendedor: ' || rec."Nombre Vendedor");
        DBMS_OUTPUT.PUT_LINE('------------------------');
    END LOOP;
END sp_List_DetalleVenta_DDL;
/
