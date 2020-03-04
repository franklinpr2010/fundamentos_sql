------------------------------------------------------------------------------------------------------------------------------------------------------
--                                     Capitulo 06 - Laboratório - Sql Expert - Recuperando dados com Subquery                                      --
--                                               Treinamento para certificação Fundamentals SQL Oracle                                              --
--                                           Pedro F. Carvalho - DBA / Analista de Sistemas / Desenvolvedor                                         --
--                                         Site : www.pedrofcarvalho.com.br   E-mail : contato@pedrofcarvalho.com.br                                --
------------------------------------------------------------------------------------------------------------------------------------------------------

/* Exercício 01
Escreva uma consulta que mostre o último nome, numero do departamento, salario de algum empregado por numero de departamento
e salario onde possua comissão. Use subquery*/

SELECT LAST_NAME, DEPARTMENT_ID, SALARY 
FROM EMPLOYEES
WHERE (SALARY, DEPARTMENT_ID) IN ( SELECT SALARY, DEPARTMENT_ID FROM EMPLOYEE WHERE COMMISSION_PCT IS NOT NULL )


/* Exercício 02
exibir o sobrenome, o nome do departamento e o salário de qualquer funcionário cujo o salario e a comissão combina com o salário e a comissão de qualquer empregado localizado
em localização ID 1700*/


select e.last_name, d.department_name, e.salary
from employees e, departments d
where e.department_id = d.department_id
and (salary, nvl(commission_pct, 0) in (select salary, nvl(commission_pct, 0) 
		from employees e, departments d,
  		where e.department_id = d.department_id 
		and d.location_id = 1700);

/* Exercício 03
crie uma consulta para exibir o sobrenome, data de contratação e salario para todos os funcionários
que tem o mesmo salário e comissão de Kochhar, não exiba o Kochhar no resultado*/

select last_name, hire_date, salary from employees
where (salary, nvl(commision_pct)) in select salary, nvl(commision_pct, 0) from employees where last_name = 'Kochhar')
and last_name != 'Kochhar'



/* Exercício 04
Crie uma consulta para exibir os funcionários que ganham* um salário superior ao
salario de todos os gerentes de vendas (JOB_ID = 'SA_MAN'). Classifique os resultados em
salário do mais alto para o mais baixo.*/








/* Exercício 05
Exibir detalhes como o ID do funcionário, o sobrenome e o ID do departamento desses
funcionários que vivem em cidades cujos nomes começam com T.
*/

/* Exercício 06
Escreva uma consulta para encontrar todos os funcionários que ganham mais do que o salário médio em seus
departamentos. Exibir sobrenome, salário, identificação do departamento e salário médio para
o departamento. Classifique por salário médio. Use aliases para as colunas recuperadas por
A consulta como mostrado na saída da amostra.
*/

/* Exercício 07
Encontre todos os funcionários que não são supervisores.
uma. Primeiro, faça isso usando o operador NOT EXISTS, e depois com o NOT IN
*/

/* Exercício 08
Escreva uma consulta para exibir os sobrenomes dos funcionários que ganham menos do que o
salário médio em seus departamentos.*/

/* Exercício 09
Escreva uma consulta para exibir os sobrenomes dos funcionários que têm um ou mais
Colegas de trabalho em seus departamentos com datas mais atrasadas, mas salários mais altos.*/

/* Exercício 10
Escreva uma consulta para exibir a ID do empregado, os sobrenomes e os nomes dos departamentos de
todos os empregados.
Nota: use uma subconsulta escalar para recuperar o nome do departamento no SELECT
declaração.*/

/* Exercício 11
Escreva uma consulta para exibir os nomes de departamento dos departamentos cujo total
O custo salarial é superior a um oitavo (1/8) do custo salarial total do conjunto
Empresa. Use a cláusula WITH para escrever essa consulta. Nomeie a consulta RESUMO.*/

































