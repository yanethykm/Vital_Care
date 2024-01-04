CREATE OR REPLACE PROCEDURE sp_Delete_Venta(
    p_IdVenta IN INT
)
AS
BEGIN
    DECLARE
        v_IdProducto INT;
        v_CantidadVendida INT;
    BEGIN
        -- Obtener el Id del Producto y la CantidadVendida desde DetalleVenta
        SELECT dv.IdProducto, dv.CantidadVendida
        INTO v_IdProducto, v_CantidadVendida
        FROM DetalleVenta dv
        WHERE dv.IdVenta = p_IdVenta;

        -- Eliminar la venta y su detalle
        DELETE FROM DetalleVenta
        WHERE IdVenta = p_IdVenta;

        DELETE FROM Venta
        WHERE Id = p_IdVenta;

        -- Actualizar la cantidad del producto en la tabla Producto
        UPDATE Producto
        SET Cantidad = Cantidad + v_CantidadVendida
        WHERE Id = v_IdProducto;

        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            -- Manejo de errores, puedes personalizar según tus necesidades
            ROLLBACK;
            DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
    END;
END sp_Delete_Venta;
