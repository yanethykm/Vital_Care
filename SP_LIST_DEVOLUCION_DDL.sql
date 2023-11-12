CREATE OR REPLACE PROCEDURE sp_List_Devolucion_DDL AS
BEGIN
    FOR devolucion_record IN (
        SELECT 
            D.FechaDevolucion as "Fecha de Devolucion",
            D.CantidadDevuelta as "Cantidad Devuelta",
            D.RazonDevolucion as "Razon de Devolucion",
            V.Fecha as "Fecha de Venta",
            PCliente.Nombre_RazonSocial as "Nombre Cliente",
            PVendedor.Nombre_RazonSocial as "Nombre Vendedor",
            DV.CantidadVendida as "Cantidad Vendida",
            P.Producto as "Producto",
            P.Descripcion as "Descripcion",
            P.PrecioCompra as "Precio de Compra",
            P.PrecioVenta as "Precio de Venta"
        FROM Devolucion D
        INNER JOIN Venta V ON D.IdVenta = V.ID
        INNER JOIN Cliente C ON V.IdCliente = C.ID
        INNER JOIN Persona PCliente ON C.IdPersona = PCliente.ID
        INNER JOIN Vendedor Vd ON V.IdVendedor = Vd.ID
        INNER JOIN Persona PVendedor ON Vd.IdPersona = PVendedor.ID
        INNER JOIN DetalleVenta DV ON D.IdVenta = DV.IdVenta
        INNER JOIN Producto P ON DV.IdProducto = P.ID
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('Fecha de Devolucion: ' || devolucion_record."Fecha de Devolucion");
        DBMS_OUTPUT.PUT_LINE('Cantidad Devuelta: ' || devolucion_record."Cantidad Devuelta");
        DBMS_OUTPUT.PUT_LINE('Razon de Devolucion: ' || devolucion_record."Razon de Devolucion");
        DBMS_OUTPUT.PUT_LINE('Fecha de Venta: ' || devolucion_record."Fecha de Venta");
        DBMS_OUTPUT.PUT_LINE('Nombre Cliente: ' || devolucion_record."Nombre Cliente");
        DBMS_OUTPUT.PUT_LINE('Nombre Vendedor: ' || devolucion_record."Nombre Vendedor");
        DBMS_OUTPUT.PUT_LINE('Cantidad Vendida: ' || devolucion_record."Cantidad Vendida");
        DBMS_OUTPUT.PUT_LINE('Producto: ' || devolucion_record."Producto");
        DBMS_OUTPUT.PUT_LINE('Descripcion: ' || devolucion_record."Descripcion");
        DBMS_OUTPUT.PUT_LINE('Precio de Compra: ' || devolucion_record."Precio de Compra");
        DBMS_OUTPUT.PUT_LINE('Precio de Venta: ' || devolucion_record."Precio de Venta");
        DBMS_OUTPUT.PUT_LINE('------------------------');
    END LOOP;
END sp_List_Devolucion_DDL;
/

