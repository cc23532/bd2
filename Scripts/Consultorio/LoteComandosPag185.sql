BEGIN
	DECLARE @quantosRegistros int = 1, @categoria int,
			@nome nvarchar(200) = 'Maria';
	set @categoria = 2
	set @nome = @nome + N' tinha um carneirinho' -- N indica Unicode
	declare @idMedico int,
			@dataConsulta date,
			@horaInicio time,
			@horaFim time

	select
		@idMedico = idMedico, @dataConsulta = dataConsulta,
		@horaInicio = horaInicio, @horaFim = horaFim
	from
		consN.Consulta
	Where
		idConsulta = 1

	print 'Médico : '+cast(@idMedico as varchar)
	print 'Data   : '+Cast(DatePart(DAY,   @dataConsulta) as varchar)+'/'+ 
	                  Cast(DatePart(Month, @dataConsulta) as varchar)+'/'+
					  Cast(DatePart(year,  @dataConsulta) as varchar)
	print 'Inicio : '+Cast(DatePart(Hour, @horaInicio) as Varchar)+'h'+
	                  Cast(DatePart(Minute, @horaInicio) as varchar)+'min'
	print 'Fim    : '+Cast(DatePart(Hour, @horaFim) as Varchar)+'h'+
	                  Cast(DatePart(Minute, @horaFim) as varchar)+'min'
	print @nome

	if @dataConsulta > GetDate()  -- getDate() retorna data de hoje
		Print 'A consulta ainda vai acontecer'
	else
		print 'A consulta já foi ou é hoje.'
END