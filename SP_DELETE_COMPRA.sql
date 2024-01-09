CREATE OR REPLACE PROCEDURE sp_Delete_Compra(
    p_IdCompra IN INT
)
AS
BEGIN
    DECLARE
        v_CantidadComprada INT;
        v_IdProducto INT;
    BEGIN
        -- Obtener la cantidad comprada y el IdProducto de la compra
        SELECT dc.CantidadComprada, dc.IdProducto
        INTO v_CantidadComprada, v_IdProducto
        FROM DetalleCompra dc
        WHERE dc.IdCompra = p_IdCompra;

        -- Actualizar la cantidad del producto en la tabla Producto
        UPDATE Producto
        SET Cantidad = Cantidad - v_CantidadComprada
        WHERE Id = v_IdProducto;

        -- Eliminar el detalle de la compra
        DELETE FROM DetalleCompra
        WHERE IdCompra = p_IdCompra;

        -- Eliminar la compra
        DELETE FROM Compra
        WHERE Id = p_IdCompra;

        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            DBMS_OUTPUT.PUT_LINE('Error al eliminar' || SQLERRM);
    END;
END sp_Delete_Compra;
