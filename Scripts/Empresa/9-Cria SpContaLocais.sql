create or alter procedure Empresa.spContaLocais
	@numDepto int, -- parâmetro por valor, de entrada
	@quantos int output -- parâmetro por referência, de saída
as 
begin
	Select @quantos = count(*) from Empresa.Depto_Locais
	where numDepto = @numDepto
end