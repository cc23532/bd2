DECLARE @idMedico AS INT = 1, 
		@sNome AS NVARCHAR(20);
WHILE @idMedico <= 100
BEGIN
	if exists(
		SELECT sobrenomeMed
			FROM ConsN.Medico
			WHERE idMedico = @idMedico)
	begin
		SELECT @sNome = sobrenomeMed
			FROM ConsN.Medico
			WHERE idMedico = @idMedico
		PRINT cast(@idMedico as varchar)+' '+@sNome;
	end

	SET @idMedico += 1;
END;