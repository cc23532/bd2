-- comando abaixo colocará o mesmo gerente (333445555) em todos
-- os departamentos e isso é errado (faltou where)
update 
  empresa.departamento
set
  gerente_numSegSocial = '333445555'

select * from Empresa.departamento

-- o comando abaixo colocará null em todos os
-- gerentes para desfazer o erro acima
update
  Empresa.departamento
set
  gerente_numSegSocial = null

select * from Empresa.departamento

update 
  Empresa.departamento
set
  gerente_numSegSocial = '333445555'
where 
  numDepto = 5  -- nomeDepto = 'Pesquisa'

update 
  Empresa.departamento
set
  gerente_numSegSocial = '888665555'
where 
  numDepto = 1

update 
  Empresa.departamento
set
  gerente_numSegSocial = '987654321'
where 
  numDepto = 4

update 
  Empresa.departamento
set
  gerente_numSegSocial = '512851285'
where 
  numDepto = 6

select
  nomeDepto as 'Departamento', numDepto as 'Num. Depto', 
  gerente_numSegSocial as '# Gerente',
  Convert(varchar, gerente_dataInicial, 103) as 'Início do Gerente'
from
  Empresa.Departamento
order by 
	gerente_dataInicial