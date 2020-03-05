------------------------------------------------------------------------------------------------------------------------------------------------------
--                                     Capitulo 06 - Laborat�rio - Sql Expert - Recuperando dados com Subquery                                      --
--                                               Treinamento para certifica��o Fundamentals SQL Oracle                                              --
--                                           Pedro F. Carvalho - DBA / Analista de Sistemas / Desenvolvedor                                         --
--                                         Site : www.pedrofcarvalho.com.br   E-mail : contato@pedrofcarvalho.com.br                                --
------------------------------------------------------------------------------------------------------------------------------------------------------

/* Exerc�cio 01
Escreva uma consulta que mostre o �ltimo nome, numero do departamento, salario de algum empregado por numero de departamento
e salario onde possua comiss�o. Use subquery*/

SELECT LAST_NAME, DEPARTMENT_ID, SALARY 
FROM EMPLOYEES
WHERE (SALARY, DEPARTMENT_ID) IN ( SELECT SALARY, DEPARTMENT_ID FROM EMPLOYEE WHERE COMMISSION_PCT IS NOT NULL )


/* Exerc�cio 02
exibir o sobrenome, o nome do departamento e o sal�rio de qualquer funcion�rio cujo o salario e a comiss�o combina com o sal�rio e a comiss�o de qualquer empregado localizado
em localiza��o ID 1700*/


select e.last_name, d.department_name, e.salary
from employees e, departments d
where e.department_id = d.department_id
and (salary, nvl(commission_pct, 0) in (select salary, nvl(commission_pct, 0) 
		from employees e, departments d,
  		where e.department_id = d.department_id 
		and d.location_id = 1700);

/* Exerc�cio 03
crie uma consulta para exibir o sobrenome, data de contrata��o e salario para todos os funcion�rios
que tem o mesmo sal�rio e comiss�o de Kochhar, n�o exiba o Kochhar no resultado*/

select last_name, hire_date, salary from employees
where (salary, nvl(commision_pct)) in select salary, nvl(commision_pct, 0) from employees where last_name = 'Kochhar')
and last_name != 'Kochhar'



/* Exerc�cio 04
Crie uma consulta para exibir os funcion�rios que ganham* um sal�rio superior ao
salario de todos os gerentes de vendas (JOB_ID = 'SA_MAN'). Classifique os resultados em
sal�rio do mais alto para o mais baixo.*/


select last_name, job_id, salary from employees  
where salary > ALL (select salary from employees where job_id = 'SA_MAN') order by salary desc




/* Exerc�cio 05
Exibir detalhes como o ID do funcion�rio, o sobrenome e o ID do departamento desses
funcion�rios que vivem em cidades cujos nomes come�am com T.
*/

select employee_id, last_name, department_id 
from employee 
where department_id in 
(select deparment_id from department where location_id in  
(select location_id from locations where city like 'T%') )


/* Exerc�cio 06
Escreva uma consulta para encontrar todos os funcion�rios que ganham mais do que o sal�rio m�dio em seus
departamentos. Exibir sobrenome, sal�rio, identifica��o do departamento e sal�rio m�dio para
o departamento. Classifique por sal�rio m�dio. Use alias para nomeclaturas de coluna.
*/

select e.last_name, e.salary salary, e.department_id dept_no  from employees e, employees a
where e.department_id = a.department_id 
and e.salary > (select avg(salary) from employees where department_id = e.department_id)
group by e.last_name, e.salary, e.department_id
order by avg(a.salary)




/* Exerc�cio 07
Encontre todos os funcion�rios que n�o s�o supervisores.
uma. Primeiro, fa�a isso usando o operador NOT EXISTS, e depois com o NOT IN
*/
select outer.last_name 
from employees outer
where not exist (  select 'X' from employees inner where inner.manager_id = outer.employee_id );


select outer.last_name from employees outer where outer.employee_id not in (select inner.manager_id from employees inner) 

/*
A subconsulta deve trabalhar com valores NULL ent�o deve justamente utilizar o NOT EXIST, o NOT IN nesse caso deve ser descartado.
*/

/* Exerc�cio 08
Escreva uma consulta para exibir os sobrenomes dos funcion�rios que ganham menos do que o
sal�rio m�dio em seus departamentos.*/

SELECT last_name FROM employees OUTER 
WHERE outer.salary < ( SELECT AVG (INNER.SALARY) FROM EMPLOYEES INNER WHERE INNER.DEPARTMENT_ID = OUTER.DEPARTMENT_ID )




/* Exerc�cio 09
Escreva uma consulta para exibir os sobrenomes dos funcion�rios que t�m um ou mais
Colegas de trabalho em seus departamentos QUE FORAM OS �LTIMOS A SEREM CONTRATADOS, mas sal�rios mais altos.*/

SELECT LAST_NAME FROM EMPLOYEES OUTER WHERE EXISTS 
(SELECT 'X' FROM EMPLOYEE INNER WHERE INNER.DEPARTMENT_ID = OUTER. DEPARTMENT_ID
AND INNER.HIRE_DATE > OUTER.HIRE_DATE AND INNER.SALARY > OUTER.SALARY)



/* Exerc�cio 10
Escreva uma consulta para exibir a ID do empregado, os sobrenomes e os nomes dos departamentos de
todos os empregados.
Nota: use uma subconsulta escalar para recuperar o nome do departamento no SELECT
declara��o.*/


SELECT EMPLOYEE_ID, LAST_NAME, (SELECT DEPARTMENT_NAME FROM DEPARTMENT D WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID)
DEPARTMENT FROM EMPLOYEE E ORDER BY DEPARTMENT;



/* Exerc�cio 11
Escreva uma consulta para exibir os nomes de departamento dos departamentos cujo total
O custo salarial � superior a um oitavo (1/8) do custo salarial total do conjunto
Empresa. Use a cl�usula WITH para escrever essa consulta. Nomeie a consulta RESUMO.*/


WITH 
SUMMARY AS (
		SELECT D.DEPARTMENT_NAME, SUM(E.SALARY) AS DEPT_TOTAL
		FROM EMPLOYEES E, DEPARTMENT D,
   		WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
		GROUP BY  D.DEPARTMENT_NAME)
SELECT DEPARTMENT_NAME, DEPT_TOTAL
FROM SUMMARY
WHERE DEPT_TOTAL > (SELECT SUM(DEPT_TOTAL) * 1/8
 		FROM SUMMARY)
ORDER BY DEPT_TOTAL DESC;






























