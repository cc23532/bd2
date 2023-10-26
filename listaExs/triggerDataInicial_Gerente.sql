create trigger trDataInicial_Gerente
on emp.Departamento
for insert, update
AS
begin
	DECLARE @dataInicial date,
			@dataAtual DATE
	select @dataInicial= gerente_dataInicial,
			@dataAtual = CAST(GETDATE() AS DATE)
	from inserted 

	if @dataAtual<@dataInicial
	BEGIN
		RAISERROR('A DATA INICIAL DEVE SER COMPATÍVEL COM A REALIDADE', 16, 1)
		ROLLBACK TRANSACTION
	END
end
	
    select numdepto, gerente_dataInicial from emp.Departamento

UPDATE emp.Departamento
set gerente_dataInicial=convert(date, '25-10-2023', 103)
where numDepto = 1