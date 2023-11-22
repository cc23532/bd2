CREATE or ALTER PROCEDURE Empresa.spInserirEmpregadoComDepartamento
@prenome varchar(15), @inicialMeio char(1), @sobrenome varchar(15),
@numSegSocial char(9),@dataNascimento date, @endereco varchar(30),
@sexo char(1), @salario decimal, @super_numSegsocial int,
@nomeDepto varchar(15)
AS
BEGIN
	declare @numDepto int = 0
	select @numdepto = numdepto from empresa.DEPARTAMENTO
	where nomeDepto = @nomeDepto
	if @numDepto <> 0
	begin
		insert into empresa.EMPREGADO values
		(@prenome, @inicialMeio, @sobrenome, @numSegSocial,
		@dataNascimento, @endereco, @sexo, @salario, @super_numSegSocial,
		@numDepto)
		if @@error <> 0 -- inserção não realizada
		begin
			declare @Mensagem nvarchar(2000)
			Select @Mensagem = Error_Message()
			Raiserror('Erro na inclusão desse empregado: %s', @Mensagem, 16, 1)
		end
	end
	else
		Raiserror('Nome de departamento inexistente. Corrija.', 16, 2)
END