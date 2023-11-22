Alter VIEW Empresa.Info_Depto
AS
	SELECT
		nomeDepto Departamento, 
		COUNT (*) '#Empregados',
		SUM (Salario) [Salário Total]
	FROM
		Empresa.Departamento D JOIN Empresa.Empregado E
			ON D.numDepto = E.NumDepto
	GROUP BY
		nomeDepto;