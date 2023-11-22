alter view consN.v_Consultas_Ativas_Medicos
as
	select 
		M.nomeMedico+' '+M.sobrenomeMed as Médico,
		P.nomePaciente+' '+P.sobrenomePac as Paciente,
		C.dataConsulta, C.horaInicio
	from
		(ConsN.Consulta C Join ConsN.Medico M On C.idMedico = M.idMedico)
		Join ConsN.Paciente P On C.idPaciente = P.idPaciente
	where
		C.ativo = 1	-- 1 significa true para campo de tipo bit(1)