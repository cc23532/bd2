declare @cont int = 0, 
        @depto int = 1
while @depto <= 10
begin
	exec empresa.spContaLocais @depto, 
							   @cont output
	print 'Depto '+cast(@depto as varchar)+
		  ' ocorre em '+
		  cast(@cont as varchar)+' cidades'
	set @depto = @depto + 1
end