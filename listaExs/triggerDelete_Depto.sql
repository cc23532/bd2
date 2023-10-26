CREATE TRIGGER delete_Depto
ON Emp.Departamento
INSTEAD OF DELETE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM deleted WHERE numDepto = 1)
    BEGIN
        RAISERROR('O Departamento 1 não pode ser removido.', 16, 1);
        ROLLBACK;
    END
    ELSE
    BEGIN
        UPDATE Emp.Empregado
        SET numDepto = 1
        FROM deleted
        WHERE Emp.Empregado.numDepto = deleted.numDepto;

    UPDATE Emp.DEPTO_LOCAIS
        SET numDepto = 1
        FROM deleted
        WHERE Emp.DEPTO_LOCAIS.numDepto = deleted.numDepto;

        DELETE FROM Emp.Departamento
        WHERE numDepto IN (SELECT numDepto FROM deleted);

        COMMIT;
    END
END;