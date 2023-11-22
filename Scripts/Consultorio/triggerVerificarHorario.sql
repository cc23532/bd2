create trigger ConsN.trVerificarHorario
on ConsN.Consulta
for Insert, Update
as
begin
	SET NOCOUNT ON;
	DECLARE @ultimoId int = @@Identity -- obt�m idConsulta rec�m inserido
	print '�ltimo id: '+cast(@ultimoId as varchar)
	-- vari�veis para receber os campos do registro de
	-- consulta rec�m inserido ou atualizado:
	declare @idConsulta int, @idMedico int, @idPaciente int, 
		    @dataConsulta date, @horaInicio time, 
			@horaFim time

	-- buscamos no BD o registro de consulta rec�m inserido:
	select  @idConsulta = idConsulta, @idMedico = idMedico,
			@idPaciente = idPaciente, 
			@dataConsulta = dataConsulta,
			@horaInicio = horaInicio, @horaFim = horaFim
	from Inserted  -- tabela especial com os registro rec�m inseridos
	-- from ConsN.consulta where idConsulta = @ultimoId

	print 'Consulta rec�m-inserida:'
	print 'Id Cons '+cast(@idConsulta as varchar)
	print 'Medico '+cast(@idMedico as varchar)
	print 'Pac. '+cast(@idPaciente as varchar)
	print 'data '+Cast(@dataConsulta as varchar)
	print 'inicio '+Cast(@horaINicio as Varchar)
	print 'fim '+Cast(@horaFim as Varchar)

	-- vari�veis para receber os campos de um registro de
	-- consulta inserido anteriormente para buscar colis�o
	-- de hor�rio:
	declare @idPaciente2 int, @idMedico2 int, 
			@idConsulta2 int,  @dataconsulta2 date, 
			@horaInicio2 time, @horaFim2 time

	SELECT top 1 
	      @idConsulta2 = isnull(idConsulta,0), 
		  @idMedico2 = idMedico,
		  @idPaciente2 = idPaciente, 
		  @dataconsulta2 = dataConsulta,
		  @horaInicio2 = horaInicio, @horaFim2 = horaFim
	FROM consN.Consulta
	WHERE (idMedico = @idMedico) AND (idConsulta <> @ultimoId) and
		--(idPaciente <> @idPaciente) and
		(dataConsulta = @dataConsulta) AND
		( (@horaInicio >= horaInicio and 
		   @horaInicio <= horaFim) OR
		(@horaFim >= horaInicio AND @horaFim <= horaFim)
		)
	order by idMedico, dataConsulta, horaInicio, horaFim

	if @idConsulta2 <> 0 -- achou consulta com horario conflitante
	begin
	  print 'Consulta anterior em conflito de hor�rio com a rec�m-inserida:';
	  print 'Consulta '+cast(@idConsulta2 as varchar)
	  print 'Medico2 '+cast(@idMedico2 as varchar)
		print 'Pac2. '+cast(@idPaciente2 as varchar)
		print 'data2 '+Cast(@dataConsulta2 as varchar)
		print 'inicio2 '+Cast(@horaINicio2 as Varchar)
		print 'fim 2 '+Cast(@horaFim2 as Varchar)
	  Delete from consN.consulta 
			where idConsulta = @idConsulta
      RAISERROR('Conflito de hor�rio', 15, 1);
	end
	else
		print 'Consulta registrada (sem conflito de hor�rio).'
end