create procedure bib.Devolucao
    @idLivro int,
    @resultado char(3) output
as
begin
    declare @diaAtual date,
            @dataDevPrevista date,
            @multaDiaria money,
            @multa money,
            @multiplicadorMulta int,
            @suspenso char(1),
            @dataDevReal date

    set @resultado= 'NAO'
    set @diaAtual= getdate()
    select @multaDiaria= multaDiaria from bib.multa

begin try
    if exists ( select * from bib.Emprestimo where idLivro= @idLivro and dataDevolucaoReal is null)
    begin
        if datediff(day, dataDevolucaoPrevista, @diaAtual)>0
        begin   
            set @multiplicadorMulta= datediff(day, dataDevolucaoPrevista, @diaAtual)
            set @multa= @multiplicadorMulta * @multaDiaria
            update bib.leitor
            set multa= @multa
            where idLeitor= @idLeitor
            if datediff(day, dataDevolucaoPrevista, @diaAtual)>15
            begin
                update bib.leitor
                set suspenso= 's'
                where idLeitor= @idLeitor
            end
        end
    end
end try

begin catch
end catch