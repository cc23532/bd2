create trigger ConsN.trVerificarHorario
on ConsN.Consulta
for Insert, Update
as
begin
	SET NOCOUNT ON;
	DECLARE @ultimoId int = @@Identity -- obtém idConsulta recém inserido
	print 'Último id: '+cast(@ultimoId as varchar)
	-- variáveis para receber os campos do registro de
	-- consulta recém inserido ou atualizado:
	declare @idConsulta int, @idMedico int, @idPaciente int, 
		    @dataConsulta date, @horaInicio time, 
			@horaFim time

	-- buscamos no BD o registro de consulta recém inserido:
	select  @idConsulta = idConsulta, @idMedico = idMedico,
			@idPaciente = idPaciente, 
			@dataConsulta = dataConsulta,
			@horaInicio = horaInicio, @horaFim = horaFim
	from Inserted  -- tabela especial com os registro recém inseridos
	-- from ConsN.consulta where idConsulta = @ultimoId

	print 'Consulta recém-inserida:'
	print 'Id Cons '+cast(@idConsulta as varchar)
	print 'Medico '+cast(@idMedico as varchar)
	print 'Pac. '+cast(@idPaciente as varchar)
	print 'data '+Cast(@dataConsulta as varchar)
	print 'inicio '+Cast(@horaINicio as Varchar)
	print 'fim '+Cast(@horaFim as Varchar)

	-- variáveis para receber os campos de um registro de
	-- consulta inserido anteriormente para buscar colisão
	-- de horário:
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
	  print 'Consulta anterior em conflito de horário com a recém-inserida:';
	  print 'Consulta '+cast(@idConsulta2 as varchar)
	  print 'Medico2 '+cast(@idMedico2 as varchar)
		print 'Pac2. '+cast(@idPaciente2 as varchar)
		print 'data2 '+Cast(@dataConsulta2 as varchar)
		print 'inicio2 '+Cast(@horaINicio2 as Varchar)
		print 'fim 2 '+Cast(@horaFim2 as Varchar)
	  Delete from consN.consulta 
			where idConsulta = @idConsulta
      RAISERROR('Conflito de horário', 15, 1);
	end
	else
		print 'Consulta registrada (sem conflito de horário).'
end