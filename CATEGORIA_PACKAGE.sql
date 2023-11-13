CREATE OR REPLACE PACKAGE Categoria_Package AS
    PROCEDURE sp_Insert_Categoria ( p_Categoria IN VARCHAR );
    PROCEDURE sp_List_Categoria;
    PROCEDURE sp_Update_Categoria ( p_IDCategoria IN INT, p_Categoria IN VARCHAR );
    PROCEDURE sp_Delete_Categoria ( p_IDCategoria IN INT );
END Categoria_Package;
/
CREATE OR REPLACE PACKAGE BODY Categoria_Package AS
-- Implementaci�n del procedimiento para insertar una nueva categor�a
    PROCEDURE sp_Insert_Categoria ( p_Categoria IN VARCHAR ) AS
    BEGIN
        INSERT INTO Categoria (Categoria)
        VALUES (p_Categoria);
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Categor�a ingresada correctamente.');
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
    END sp_Insert_Categoria;

-- Implementaci�n del procedimiento para listar todas las categor�as
    PROCEDURE sp_List_Categoria AS
    BEGIN
        FOR CategoriaRow IN (SELECT Categoria FROM Categoria) LOOP
            DBMS_OUTPUT.PUT_LINE('Categoria: ' || CategoriaRow.Categoria);
            DBMS_OUTPUT.PUT_LINE('-----------------------');
        END LOOP;
    END sp_List_Categoria;

-- Implementaci�n del procedimiento para actualizar una categor�a existente
    PROCEDURE sp_Update_Categoria (
        p_IDCategoria IN INT,
        p_Categoria IN VARCHAR
    ) AS
    BEGIN
        UPDATE Categoria
        SET Categoria = p_Categoria
        WHERE ID = p_IDCategoria;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Categor�a actualizada correctamente.');
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('No se encontr� una categor�a con el ID ' || p_IDCategoria);
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
    END sp_Update_Categoria;

-- Implementaci�n del procedimiento para eliminar una categor�a
    PROCEDURE sp_Delete_Categoria ( p_IDCategoria IN INT ) AS
    BEGIN
        DELETE FROM Categoria
        WHERE ID = p_IDCategoria;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Categor�a eliminada correctamente.');
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('No se encontr� una categor�a con el ID ' || p_IDCategoria);
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
    END sp_Delete_Categoria;
END Categoria_Package;
/