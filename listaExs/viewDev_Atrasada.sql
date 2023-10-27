create view bib.DevolucaoAtrasada
as 
    select
        e.idLivro, e.idLeitor, le.nomeLeitor, li.tituloLivro, e.dataDevolucaoPrevista,
        DATEDIFF(day, e.dataDevolucaoPrevista, GETDATE()) as diasAtraso,
        DATEDIFF(day, e.dataDevolucaoPrevista, GETDATE()) * m.multaDiaria as valorMulta
    FROM
        bib.emprestimo  e 
            inner join bib.leitor le on e.idLeitor=le.idLeitor
            inner join bib.livro li on e.idLivro=li.idLivro
            cross join bib.multa m
    WHERE
            GETDATE() > e.dataDevolucaoPrevista
