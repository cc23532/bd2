select * from emp.Empregado

create trigger emp.rVerififca_Idade
	on emp.empregado
	for insert, update as
begin 
	set nocount on;
	declare @prenome varchar(20), @inicialMeio char(1), @sobrenome varchar(20),
			@NumSeg_Social int, @dataNascimento date, @endereco varchar(50),
			@salario decimal(10,2), @numDepto int

			if

	select	@prenome= prenome, @inicialMeio= inicialMeio, @sobrenome= sobrenome,
			@NumSeg_Social= NumSeg_Social, @dataNascimento= dataNascimento, @endereco= endereco,
			@salario= salario

	
