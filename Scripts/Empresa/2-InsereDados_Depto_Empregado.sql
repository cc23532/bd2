alter table Empresa.departamento
	alter column gerente_numSegSocial char(9) null

delete from Empresa.departamento  -- apague todos os registros da tabela

Insert
into Empresa.DEPARTAMENTO 
 (nomeDepto, numDepto, gerente_numSegSocial, gerente_dataInicial)
Values 
 ('Pesquisa', 5, null, Convert(date,'22/05/1988', 103)),
 ('Administração', 4, null, Convert(date,'01/01/1995', 103) ),
 ('Sede', 1, null, Convert(date,'19/06/1981', 103) ),
 ('Tecn Informação', 6, null, Convert(date,'29/04/2020', 103) );

select * from empresa.departamento order by nomeDepto

alter table empresa.empregado
	alter column super_numsegsocial char(9) null

INSERT INTO Emp.EMPREGADO
(PreNome, InicialMeio, Sobrenome, NumSegSocial, DataNascimento,
Endereco, Sexo, Salario, NumDepto)
VALUES
 ('John', 'B', 'Smith', '123456789', Convert(date,'09/01/1965',103),
 '731 Fondren, Houston, TX', 'M', 30000, 5),
 ('Franklin', 'T', 'Wong', '333445555', Convert(date,'08/12/1955',103),
 '638 Voss, Houston, TX', 'M', 40000, 5),
 ('Alicia','J','Zelaya', '999887777', Convert(date,'19/01/1968',103),
 '3321 Castle, Spring, TX', 'F', 25000, 4),
 ('Jennifer','S','Wallace','987654321', Convert(date,'20/06/1941',103),
 '291 Berry, Bellaire, TX', 'F', 43000, 4),
 ('Ramesh','K','Narayan', '666884444', Convert(date,'15/09/1962',103),
 '975 Fire Oak, Humble, TX', 'M', 38000, 5),
 ('Joyce','A','English', '453453453', Convert(date,'31/07/1972',103),
 '5631 Rice, Houston, TX', 'F', 25000, 5),
 ('Ahmad','V','Jabbar','987987987', Convert(date,'29/03/1969',103),
 '980 Dallas, Houston, TX', 'M', 25000, 4),
 ('James', 'E', 'Borg', '888665555', Convert(date,'10/11/1937',103),
 '450 Stone, Houston, TX', 'M', 55000, 1),
 ('Luis', 'F', 'Assis','512851285', Convert(date,'21/06/1994',103),
 '37 Reg Feijó, Campinas, SP', 'M', 20000, 6),
 ('Igor','N','Camargo','494549454', Convert(date,'26/10/1985',103),
 '53 Dona Libânia,Campinas,SP', 'M', 30000, 6);

 select numSegSocial as CPF, prenome as Nome, sobrenome as Sobrenome,
 cast(day(dataNascimento) as varchar)+'/'+
 cast(month(dataNascimento) as varchar)+'/'+
 cast(year(dataNascimento) as varchar)
     as Nascimento
 from empresa.empregado order by datanascimento