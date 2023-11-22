--create schema empresa
create table Empresa.Departamento
(
	nomeDepto varchar(15) not null,  -- UNIQUE,
	numDepto int Primary Key,
	gerente_numSegSocial char(9) not null,
	gerente_dataInicial date not null,
	UNIQUE(nomeDepto),
	-- foreign key (gerente_numSegSocial) references Empresa.Empregado(numSegSocial)
)

create table Empresa.Empregado
(
	prenome varchar(15) not null,
	inicialMeio char(1) not null,
	sobrenome varchar(15) not null,
	numSegSocial char(9) not null, --primary key,
	dataNascimento date null,
	endereco varchar(30),
	sexo char(1),
	salario decimal(10,2),
	super_numSegSocial char(9) not null,
	numDepto int not null,
	PRIMARY KEY (numSegSocial),
	foreign key (Super_numSegSocial)
			REFERENCES EMPRESA.EMPREGADO(NumSegSocial),
	FOREIGN KEY (NumDepto) REFERENCES EMPRESA.DEPARTAMENTO(NumDepto)
)

ALTER TABLE Empresa.DEPARTAMENTO
	ALTER COLUMN
		Gerente_numSegSocial char(9) Null;

ALTER TABLE Empresa.Departamento  -- adicionar FK que faltou na criação
	ADD FOREIGN KEY (gerente_numSegSocial) 
		REFERENCES Empresa.Empregado(numSegSocial)

ALTER TABLE Empresa.Departamento	-- remover campo nomeDepto para
	DROP COLUMN nomeDepto			-- redefiní-lo como Unique

ALTER TABLE Empresa.Departamento	-- inclui nomeDepto como Unique
	ADD nomeDepto varchar(15) not null Unique

CREATE TABLE Empresa.DEPTO_LOCAIS
(
	NumDepto INT NOT NULL,
	LocalDepto VARCHAR(15) NOT NULL,
	PRIMARY KEY (NumDepto, LocalDepto),
	FOREIGN KEY (NumDepto) REFERENCES Empresa.DEPARTAMENTO(NumDepto)
);

CREATE TABLE Empresa.PROJETO
(
	NomeProjeto VARCHAR(15) NOT NULL,
	NumProjeto INT NOT NULL,
	LocalProjeto VARCHAR(15),
	NumDepto INT NOT NULL,
	PRIMARY KEY (NumProjeto),
	UNIQUE (NomeProjeto),
	FOREIGN KEY (NumDepto) REFERENCES Empresa.DEPARTAMENTO(NumDepto)
);

CREATE TABLE Empresa.TRABALHA_EM
(
	numSegSocial CHAR(9) NOT NULL,
	NumProjeto INT NOT NULL,
	Horas DECIMAL(3,1) NOT NULL,
	PRIMARY KEY (numSegSocial, NumProjeto),
	FOREIGN KEY (numSegSocial) REFERENCES Empresa.EMPREGADO(NumSegSocial),
	FOREIGN KEY (NumProjeto) REFERENCES Empresa.PROJETO(NumProjeto)
);

CREATE TABLE Empresa.DEPENDENTE
(
	NumSegSocial CHAR(9) NOT NULL,
	NomeDependente VARCHAR(15) NOT NULL,
	Sexo CHAR,
	DataNascimento DATE,
	Relacionamento VARCHAR(8),
	PRIMARY KEY (NumSegSocial , NomeDependente),
	FOREIGN KEY (NumSegSocial) REFERENCES Empresa.EMPREGADO(NumSegSocial)
);