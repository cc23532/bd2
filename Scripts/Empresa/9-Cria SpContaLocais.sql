create or alter procedure Empresa.spContaLocais
	@numDepto int, -- par�metro por valor, de entrada
	@quantos int output -- par�metro por refer�ncia, de sa�da
as 
begin
	Select @quantos = count(*) from Empresa.Depto_Locais
	where numDepto = @numDepto
end