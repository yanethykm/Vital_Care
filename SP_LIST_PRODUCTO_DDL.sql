CREATE OR REPLACE PROCEDURE sp_List_Producto_DDL
AS
BEGIN
    FOR producto IN (
        SELECT
            p.ID AS "Codigo Producto",
            p.Producto AS "Producto",
            p.Descripcion AS "Descripcion",
            p.PrecioVenta AS "Precio de Venta",
            p.CantidadMinima AS "Cantidad Minima",
            p.Cantidad AS "Cantidad Existente",
            c.Categoria AS "Categoria",
            PVendedor.nombre_razonsocial AS "Nombre del Proveedor",
            PVendedor.apellido AS "Apellido del Proveedor"
        FROM Producto p
        INNER JOIN Categoria c ON p.id = c.id
        INNER JOIN Proveedor pr ON p.id = pr.id
        INNER JOIN Persona PVendedor ON pr.idpersona = PVendedor.id
    ) LOOP
        -- Imprimir o procesar cada fila según sea necesario
        DBMS_OUTPUT.PUT_LINE(
            'Codigo Producto: ' || producto."Codigo Producto" ||
            ', Producto: ' || producto."Producto" ||
            ', Descripcion: ' || producto."Descripcion" ||
            ', Precio de Venta: ' || producto."Precio de Venta" ||
            ', Cantidad Minima: ' || producto."Cantidad Minima" ||
            ', Cantidad Existente: ' || producto."Cantidad Existente" ||
            ', Categoria: ' || producto."Categoria" ||
            ', Nombre del Proveedor: ' || producto."Nombre del Proveedor" ||
            ', Apellido del Proveedor: ' || producto."Apellido del Proveedor"
        );
    END LOOP;
END sp_List_Producto_DDL;
