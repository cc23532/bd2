insert into bib.multa 
    (multaDiaria)
VALUES
    (2.00)

insert into bib.livro
    (codigoLivro, tituloLivro, autorLivro)
values
    ('HIST01','Notícias do Brasil, 1555', 'Padre José Anchieta'),
    ('FIC01', 'Fausto', 'Johann Wolfgang von Goethe'),
    ('INFANTIL01', 'Jacaré, não!', 'Antonio Prata'),
    ('MIST01', 'A Noite das Bruxas', 'Agatha Christie'),
    ('FICPOLI01', 'Um Cavalheiro em Moscou', 'Amor Towles'),
    ('LITBR01', 'Capitaes de Areia', 'Jorge Amado'),
    ('LITBR02', 'Tenda Dos Milagres', 'Jorge Amado'),
    ('BIO01', 'Diário do Hospício & O Cemitério dos Vivos', 'Lima Barreto'),
    ('POLI01' ,'Imperialismo, Fase Superior do Capitalismo', 'Vladimir Lenin'),
    ('FIC02', 'A Paixão do Jovem Werther', 'Johann Wolfgang von Goethe'),
    ('FIC03', 'Robinson Crusoé', 'Daniel Defoe'),
    ('INFJUV01', 'O Silêncio do Cavaleiro', 'Heloisa Karin')

INSERT INTO bib.Leitor
    (nomeLeitor, enderecoLeitor, suspenso)
VALUES
    ('nome 1', 'aaa', 's'),
    ('nome 2', 'bbb', 'n'),
    ('nome 3', 'yyy', 'n'),
    ('nome 4', 'ccc', 'n'),
    ('nome 5', 'ddd', 's'),
    ('777', '777', 's')  

--para efeito de teste
    update bib.leitor set suspenso='n'
    where nomeLeitor='777'
    
    update bib.leitor set suspenso='s'
    where nomeLeitor='nome 5'  

insert into bib.Emprestimo
    (idLivro, idLeitor, dataEmprestimo, dataDevolucaoPrevista, dataDevolucaoReal, multa)
VALUES
    (9, 1, CONVERT(date, '15-09-2023', 103), CONVERT(date, '30-09-2023', 103), '', 52.00),
    (6, 5, CONVERT(date, '10-09-2023', 103), CONVERT(date, '25-09-2023', 103), '', 62.00),
    (2, 4, CONVERT(date, '05-12-2022', 103), CONVERT(date, '25-12-2022', 103), CONVERT(date, '25-12-2022', 103), 0.00),
    (11, 3, CONVERT(date, '20-10-2023', 103), CONVERT(date, '04-11-2023', 103), '', 0.00),
    (4, 6, CONVERT(date, '02-07-2023', 103), CONVERT(date, '17-07-2023', 103), '', 202.00),
    (10, 2, CONVERT(date, '15-10-2023', 103), CONVERT(date, '30-10-2023', 103), CONVERT(date, '30-10-2023', 103), 0.00)

    update bib.Emprestimo
    set dataDevolucaoReal= NULL
    WHERE dataDevolucaoReal= ''

    update bib.Emprestimo
    set multa= NULL
    WHERE multa= 0.00

select * from bib.Emprestimo where datadevolucaoReal is NULL
select idLeitor, nomeLeitor, suspenso from bib.leitor
select * from bib.livro order by codigoLivro




