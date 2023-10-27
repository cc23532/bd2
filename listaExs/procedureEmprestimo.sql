create procedure bib.efetuarEmprestimo
    @idLivro int,
    @idLeitor INT,
    @qtdDiasEmprestado int,
    @resultado varchar(3) OUTPUT
as
begin
    declare @dataEmprestimo date,
            @dataDevPrevista date,
            @qtdLivrosEmprestados int,
            @suspenso char(1)

    set @resultado = 'NÃO'

    if not exists (select 1 from bib.Leitor where idLeitor = @idLeitor)
    begin
        raiserror('O USUÁRIO NÃO EXISTE.', 16, 1)
        return;
    end

    select @suspenso = suspenso from bib.Leitor where idLeitor = @idLeitor
    if @suspenso = 'S'
    begin
        raiserror('O USUÁRIO ESTÁ SUSPENSO.', 16, 1)
        return;
    end

    select @qtdLivrosEmprestados = count(*) from bib.Emprestimo where idLeitor = @idLeitor and dataDevolucaoReal is null

    if @qtdLivrosEmprestados >= 5
    begin
        raiserror('O USUÁRIO JÁ TEM 5 OU MAIS LIVROS EMPRESTADOS.', 16, 1)
        return;
    end

    if exists (select 1 from bib.Emprestimo where idLivro = @idLivro and dataDevolucaoReal is null)
    begin
        raiserror('O LIVRO JÁ ESTÁ EMPRESTADO PARA OUTRO USUÁRIO.', 16, 1)
        return;
    end

    set @dataEmprestimo = GETDATE()
    set @dataDevPrevista = DATEADD(day, @qtdDiasEmprestado, @dataEmprestimo)

    insert into bib.Emprestimo (idLivro, idLeitor, dataEmprestimo, dataDevolucaoPrevista)
    values (@idLivro, @idLeitor, @dataEmprestimo, @dataDevPrevista)

    set @resultado = 'SIM'
end



--TESTE QTD. DE LIVROS
--Considerando que o idLeitor= 4, já possui 1 empréstimo em aberto
  exec bib.efetuarEmprestimo 12, 3, 15, OUTPUT
  exec bib.efetuarEmprestimo 8, 3, 15, OUTPUT
  exec bib.efetuarEmprestimo 7, 3, 15, OUTPUT
  exec bib.efetuarEmprestimo 5, 3, 15, OUTPUT
--6º livro
  exec bib.efetuarEmprestimo 13, 3, 15, OUTPUT

--TESTE USUARIO SUSPENSO
--idLeitor= 6 SUSPENSO
      exec bib.efetuarEmprestimo 3, 6, 15, OUTPUT

--TESTE LIVRO EMPRESTADO
      exec bib.efetuarEmprestimo 5, 2, 15, OUTPUT

--TESTE USUÁRIO NÃO EXISTENTE
      exec bib.efetuarEmprestimo 10, 10, 15, OUTPUT