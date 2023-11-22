create schema ConsN
create table ConsN.Medico
(
	idMedico int identity primary key not null,
	nomeMedico varchar(20),
	sobrenomeMed varchar(30),
	crm varchar(10)
)

create table ConsN.Paciente
(
	idPaciente int identity primary key not null,
	nomePaciente varchar(20),
	sobrenomePac varchar(30),
	telefone varchar(20),
	nascimento date
)

create table ConsN.Consulta
(
	idConsulta int identity primary key not null,
	idMedico int not null,--foreign key references consN.Medico(idMedico),
	idPaciente int not null,--foreign key references consN.Paciente(idPaciente),
	dataConsulta datetime,
	horaInicio datetime,
	horaFim datetime,
	observacoes ntext,
	ativo bit
)
