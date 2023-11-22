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
                @dataDevReal date,
                @idLeitor int

        set @resultado= 'NAO'
        set @diaAtual= getdate()
        set @multaDiaria= (select multaDiaria from bib.multa)

        begin transaction
        
        if exists ( select * from bib.Emprestimo where idLivro= @idLivro and dataDevolucaoReal is null)
        begin
            select @dataDevPrevista= dataDevolucaoPrevista, @idLeitor= idLeitor
            from bib.Emprestimo
            where idLivro= @idLivro and dataDevolucaoReal is null
            
            if datediff(day, @dataDevPrevista, @diaAtual)>0
            begin   
                set @multiplicadorMulta= datediff(day, @dataDevPrevista, @diaAtual)
                set @multa= @multiplicadorMulta * @multaDiaria
                    
                update bib.Emprestimo
                set multa= @multa
                where idLeitor= @idLeitor

                if datediff(day, @dataDevPrevista, @diaAtual)>15
                begin
                    update bib.leitor
                    set suspenso= 's'
                    where idLeitor= @idLeitor
                end
            end

            set @dataDevReal= GETDATE()

            update bib.Emprestimo
            set dataDevolucaoReal= @dataDevReal
            where idLivro= @idLivro and dataDevolucaoReal is null

            set @resultado= 'SIM'
        end
        else
        BEGIN
            RAISERROR('O LIVRO NAO ESTÁ EMPRESTADO', 16, 1)
            ROLLBACK TRANSACTION
        end
    end




--devolvendo um livro atrasado, 
exec bib.Devolucao 6, OUTPUT
exec bib.devolucao 4,OUTPUT
exec bib.devolucao 9,OUTPUT


--devolvendo um livro no prazo, 
exec bib.Devolucao 11, OUTPUT
exec bib.Devolucao 5, OUTPUT
exec bib.Devolucao 12, OUTPUT
exec bib.Devolucao 8, OUTPUT
exec bib.Devolucao 7, OUTPUT

--tentando devolver um livro que não estava emprestado
exec bib.Devolucao 3, OUTPUT