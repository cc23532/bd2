create trigger emp.rVerififca_Idade
	on emp.empregado
for insert, update 
AS
begin
	DECLARE @dataNascimento date,
			@dataAtual DATE
	select @dataNascimento= dataNascimento,
			@dataAtual = CAST(GETDATE() AS DATE)
	from inserted 

	declare @idade INT
	set @idade =DATEDIFF(year, @dataNascimento,  @dataAtual) 

	if @idade<18
	BEGIN
		RAISERROR('O EMPREGADO DEVE POSSUIR NO MÍNIMO 18 ANOS', 16, 1)
		ROLLBACK TRANSACTION
	END
end
	

insert into emp.Empregado
	(prenome, inicialMeio, sobrenome, numSegSocial, dataNascimento, endereco, sexo, salario, numDepto)
values
	('nome', 'd', 'teste', '132645555', convert(date, '01-01-2000', 103), 'rua do teste', 'M', 2.0, 5)