--página 98 - prática de insert com e sem erros
insert into empresa.empregado
values
('Cecilia', 'F', 'Kolonsky', NULL, Convert(date, '04-05-1960',103),
'6357 Windy Lane, Katy, TX', 'F', 28000, NULL, 4)
insert into empresa.empregado
values
(
'Alicia', 'J','Zelaya','999887777', Convert(date, '04-05-1960',103),
'6357 Windy Lane, Katy, TX', 'F', 28000, '987654321', 4
)
insert into empresa.empregado
values
(
'Cecilia','F','Kolonsky','677678989', Convert(date, '04-05-1960',103),
'6357 Windswept, Katy, TX', 'F', 28000, '987654321', 7
)
insert into empresa.empregado
values
(
'Cecilia','F','Kolonsky','677678989', Convert(date, '04-05-1960',103),
'6357 Windy Lane, Katy, TX', 'F', 28000, NULL, 4
)
select * from empresa.empregado