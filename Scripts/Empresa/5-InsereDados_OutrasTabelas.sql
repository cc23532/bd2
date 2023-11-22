insert
into Emp.DEPENDENTE
 (NumSegSocial , NomeDependente, Sexo, DataNascimento, Relacionamento)
values
('333445555','Alice', 'F', Convert(date,'05/04/1986', 103), 'Filha'),
('333445555','Franklin', 'M', Convert(date,'25/10/1983', 103), 'Filho'),
('333445555','Joy', 'F', Convert(date,'03/05/1958', 103), 'Esposa'),
('987654321','Abner', 'M', Convert(date,'28/02/1942', 103), 'Esposo'),
('123456789','John', 'M', Convert(date,'04/01/1988', 103), 'Filho'),
('123456789','Alice', 'F', Convert(date,'30/12/1988', 103), 'Filha'),
('123456789','Elizabeth','F', Convert(date,'05/05/1967', 103), 'Esposa')
insert
into Emp.DEPTO_LOCAIS (NumDepto, LocalDepto)
values (1, 'Houston'),
(4, 'Stafford'),
(5, 'Belaire'),
(5, 'Sugarland'),
(5, 'Houston')
insert
into Emp.PROJETO (NomeProjeto, NumProjeto, LocalProjeto, NumDepto)
values
('ProdutoX', 1, 'Bellaire', 5),
('ProdutoY', 2, 'Sugarland', 5),
('ProdutoZ', 3, 'Houston', 5),
('Informatização', 10, 'Stafford', 4),
('Reorganização', 20, 'Houston', 1),
('Novos Benefíc', 30, 'Stafford', 4)
insert
into Emp.TRABALHA_EM (NumSegSocial , NumProjeto, Horas)
values
('123456789', 1, 32.5),
('123456789', 2, 7.5),
('666884444', 3, 40.0),
('453453453', 1, 20.0),
('453453453', 2, 20.0),
('333445555', 2, 10.0),
('333445555', 3, 10.0),
('333445555', 10, 10.0),
('333445555', 20, 10.0),
('999887777', 30, 30.0),
('999887777', 10, 10.0),
('987987987', 10, 35.0),
('987987987', 30, 5.0),
('987654321', 30, 20.0),
('987654321', 20, 15.0),
('888665555', 20, 40.0) -- era originalmente null. Veja figura 4.7

select * from empresa.DEPENDENTE

select * from empresa.DEPTO_LOCAIS

select * from empresa.PROJETO

select * from empresa.TRABALHA_EM

select * from empresa.Departamento

select * from empresa.Empregado