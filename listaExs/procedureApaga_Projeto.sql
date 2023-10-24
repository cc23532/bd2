CREATE OR ALTER PROCEDURE Emp.spRemoveProjeto
    @NumProjeto INT
AS
BEGIN
    IF EXISTS (SELECT * FROM Emp.PROJETO WHERE NumProjeto = @NumProjeto)
    BEGIN
        DELETE FROM Emp.TRABALHA_EM WHERE NumProjeto = @NumProjeto;

        DELETE FROM Emp.PROJETO WHERE NumProjeto = @NumProjeto;
    END
    ELSE
    BEGIN
        PRINT 'Projeto não encontrado.';
    END
END

exec emp.spRemoveProjeto 20