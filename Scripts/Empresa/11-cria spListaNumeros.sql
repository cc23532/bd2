create or alter procedure empresa.spListaNumeros 
	@inicio int, @fim int
as
begin
	declare @iContador int
	set @iContador = @inicio -- ou: select @iContador = @inicio
	while @iContador <= @fim
	begin
		print @iContador
		set @iContador = @iContador + 1
	end
end