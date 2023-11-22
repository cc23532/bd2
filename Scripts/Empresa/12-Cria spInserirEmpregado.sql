CREATE or ALTER PROCEDURE Empresa.spInserirEmpregado
	@prenome varchar(15), @inicialMeio char(1), 
	@sobrenome varchar(15), @numSegSocial char(9),
	@dataNascimento date, @endereco varchar(30),
	@sexo char(1), @salario decimal, @super_numSegsocial int,
	@numDepto int
AS
BEGIN
	if exists(select numdepto from empresa.DEPARTAMENTO
			  where numDepto = @numDepto)
	begin
		insert into empresa.EMPREGADO values
		(@prenome, @inicialMeio, @sobrenome, @numSegSocial, 
		 @dataNascimento, @endereco, @sexo, @salario, 
		 @super_numSegSocial, @numDepto)
		if @@error <> 0 -- inserção não realizada
		begin
			declare @Mensagem nvarchar
			Select @Mensagem = Error_Message()
			Raiserror('Erro na inclusão desse empregado: %s', @Mensagem, 16, 1)
		end
	end
	else
		Raiserror('Corrija o número de departamento.', 16, 2)
end