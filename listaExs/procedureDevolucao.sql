create procedure bib.Devolucao
    @idLivro int,
    @resultado char(3) output
as
begin
    declare @diaAtual date,
            @dataDevPrevista date,
            @multa money,
            @suspenso char(1),
            @dataDevReal date
    
    set @resultado= 'NAO'
    set @diaAtual= getdate()
    select bib.multa m

begin try
    if exists ( select * from bib.Emprestimo where idLivro= @idLivro and dataDevolucaoReal is null)
    begin
        if datediff(day, dataDevolucaoPrevista, @diaAtual)>15
        begin
        set @multa= m.multadiaria * datediff(day, dataDevolucaoPrevista, @diaAtual)
        end
    end
end try

begin catch
end catch