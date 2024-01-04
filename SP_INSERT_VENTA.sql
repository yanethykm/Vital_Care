CREATE OR REPLACE PROCEDURE sp_Insert_Venta(
    p_Fecha IN DATE,
    p_IdCliente IN INT,
    p_IdVendedor IN INT,
    p_IdProducto IN INT,
    p_CantidadVendida IN INT
)
AS
BEGIN
    DECLARE
        v_IdVenta INT;
    BEGIN
        -- Insertar la venta
        INSERT INTO Venta (
            Fecha,
            IdCliente,
            IdVendedor
        ) VALUES (
            p_Fecha,
            p_IdCliente,
            p_IdVendedor
        ) RETURNING ID INTO v_IdVenta;

        -- Insertar el detalle de la venta
        INSERT INTO DetalleVenta (
            CantidadVendida,
            IdProducto,
            IdVenta
        ) VALUES (
            p_CantidadVendida,
            p_IdProducto,
            v_IdVenta
        );

        -- Actualizar la cantidad del producto en la tabla Producto
        UPDATE Producto
        SET Cantidad = Cantidad - p_CantidadVendida
        WHERE Id = p_IdProducto;

        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            -- Manejo de errores, puedes personalizar según tus necesidades
            ROLLBACK;
            DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
    END;
END sp_Insert_Venta;
