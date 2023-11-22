--update <nomeDaTabela>
--set <campo> = <novoValor>

select * from empresa.departamento
select * from empresa.empregado

update empresa.Empregado
set Super_numSegSocial = '333445555'

update empresa.Empregado
set Super_numSegSocial = null

update 
   empresa.Empregado
set 
   super_numSegSocial = '333445555'
where 
  numSegSocial = '123456789' or
  numSegSocial = '453453453' or
  numSegSocial = '666884444'

update 
   empresa.Empregado
set 
   super_numSegSocial = '888665555'
where 
  numSegSocial in ('333445555', '494549454', '512851285','987654321')

update 
   empresa.Empregado
set 
   super_numSegSocial = '987654321'
where 
  numSegSocial in ('987987987', '999887777')

select * from empresa.empregado
order by super_numSegSocial