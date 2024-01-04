CREATE OR REPLACE PROCEDURE sp_Insert_Devolucion(
    p_FechaDevolucion IN DATE,
    p_CantidadDevuelta IN INT,
    p_RazonDevolucion IN VARCHAR,
    p_IdVenta IN INT
)
AS
    v_ProductoId INT;
    v_CantidadOriginal INT;
BEGIN
    -- Obtener el Id del Producto y la cantidad original desde DetalleVenta
    SELECT dv.idproducto, dv.cantidadvendida
    INTO v_ProductoId, v_CantidadOriginal
    FROM DetalleVenta dv
    WHERE dv.idventa = p_IdVenta;

    -- Insertar la devolución
    INSERT INTO Devolucion (
        FechaDevolucion,
        CantidadDevuelta,
        RazonDevolucion,
        IdVenta
    ) VALUES (
        p_FechaDevolucion,
        p_CantidadDevuelta,
        p_RazonDevolucion,
        p_IdVenta
    );

    -- Actualizar la cantidad del producto en la tabla Producto
    UPDATE Producto
    SET Cantidad = Cantidad + p_CantidadDevuelta
    WHERE Id = v_ProductoId;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        -- Manejo de errores, puedes personalizar según tus necesidades
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END sp_Insert_Devolucion;
