CREATE OR REPLACE PROCEDURE sp_Insert_Compra(
    p_NumeroFactura IN VARCHAR,
    p_FechaCompra IN DATE,
    p_CantidadComprada IN INT,
    p_IdProducto IN INT,
    p_MontoTotal IN DECIMAL,
    p_IdProveedor IN INT
)
AS
BEGIN
    DECLARE
        v_IdCompra INT;
    BEGIN
        -- Insertar la compra
        INSERT INTO Compra (
            NumeroFactura,
            FechaCompra,
            MontoTotal,
            IdProveedor
        ) VALUES (
            p_NumeroFactura,
            p_FechaCompra,
            p_MontoTotal,
            p_IdProveedor
        ) RETURNING ID INTO v_IdCompra;

        -- Insertar el detalle de la compra
        INSERT INTO DetalleCompra (
            CantidadComprada,
            IdProducto,
            IdCompra
        ) VALUES (
            p_CantidadComprada,
            p_IdProducto,
            v_IdCompra
        );

        -- Actualizar la cantidad del producto en la tabla Producto
        UPDATE Producto
        SET Cantidad = Cantidad + p_CantidadComprada
        WHERE Id = p_IdProducto;

        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            -- Manejo de errores, puedes personalizar según tus necesidades
            ROLLBACK;
            DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
    END;
END sp_Insert_Compra;