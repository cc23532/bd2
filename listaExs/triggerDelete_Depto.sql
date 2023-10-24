CREATE TRIGGER delete_Depto
ON Emp.Departamento
INSTEAD OF DELETE
AS
BEGIN
    DECLARE @DepartamentoNaoRemovivel INT = 1;

    INSERT INTO Emp.Empregado (numDepto)
    SELECT @DepartamentoNaoRemovivel
    FROM deleted;

    DELETE FROM Emp.Departamento
    WHERE numDepto IN (SELECT numDepto FROM deleted);

    COMMIT;
END;
