create schema Bib

create TABLE Bib.livro(
    idLivro int IDENTITY(1,1) not null,
    codigoLivro varchar (10) not NULL,
    tituloLivro varchar (50) not NULL,
    autorLivro varchar(50) not null,
    PRIMARY key (idLivro)
)

create TABLE Bib.Leitor(
    idLeitor int IDENTITY(1,1) not NULL,
    nomeLeitor varchar(50) not NULL,
    telefoneLeitor varchar(20) null,
    emailLeitor varchar(50) null,
    enderecoLeitor varchar(100) null,
    suspenso char(1) null,
    PRIMARY key (idLeitor)
)


create TABLE Bib.Emprestimo(
    idEmprestimo int IDENTITY(1,1) not null,
    idLivro int not NULL,
    idLeitor int not NULL,
    dataEmprestimo date not NULL,
    dataDevolucaoPrevista date not null,
    dataDevolucaoReal date null,
    multa money null,
    PRIMARY key (idEmprestimo),
    foreign key (idLivro) references bib.livro(idLivro),
    foreign key (idLeitor) references bib.Leitor(idLeitor)
)

create table bib.multa(
    multaDiaria money not null
)