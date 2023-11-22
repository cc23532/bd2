alter VIEW Empresa.V_Onde_Trabalha
AS
	SELECT
		E.prenome, E.sobrenome, P.NomeProjeto, T.Horas,
		E.Salario, E.Super_numSegSocial
	FROM
		(Empresa.Empregado E JOIN Empresa.TRABALHA_EM T
			ON E.numSegSocial = T.numSegSocial)
				JOIN Empresa.PROJETO P 
					ON T.NumProjeto = P.NumProjeto;