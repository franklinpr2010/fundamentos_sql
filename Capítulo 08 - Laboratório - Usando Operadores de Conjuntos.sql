------------------------------------------------------------------------------------------------------------------------------------------------------
--                                           Cap�tulo 08 Laborat�rio - Usando Operadores de Conjunto                                                --
--                                               Treinamento para certifica��o Fundamentals SQL Oracle                                              --
--                                           Pedro F. Carvalho - DBA / Analista de Sistemas / Desenvolvedor                                         --
--                                         Site : www.pedrofcarvalho.com.br   E-mail : contato@pedrofcarvalho.com.br                                --
------------------------------------------------------------------------------------------------------------------------------------------------------

/* Exerc�cio 01
O departamento de RH precisa de uma lista de IDs de departamento para departamentos que n�o contenham
O ID do trabalho ST_CLERK. Use os operadores set para criar este relat�rio.
*/

select department_id
from departments
minus
select department_id
from employees
where job_id = 'ST_CLERK';


/* Exerc�cio 02
O departamento de RH precisa de uma lista de pa�ses que n�o possuem departamentos
eles. Exibe o ID do pa�s e o nome dos pa�ses. Use os operadores set para
Criar este relat�rio.
*/

SELECT country_id,country_name
FROM countries
MINUS
SELECT l.country_id,c.country_name
FROM locations l JOIN countries c ON (l.country_id = c.country_id)
                 JOIN departments d ON d.location_id=l.location_id;
                 
                 
/* Exerc�cio 03
Produzir uma lista de postos de trabalho para os departamentos 10, 50 e 20, nessa ordem. Exibir ID do trabalho e
ID de departamento usando os operadores de set.
*/

select distinct job_id, department_id
from employees
where department_id = 10
union all
select distinct job_id, department_id
from employees
where department_id = 50
union all
select distinct job_id, department_id
from employees
where department_id = 20;



/* Exerc�cio 04
Crie um relat�rio que lista os IDs de empregados e os IDs de trabalho dos empregados
e atualmente t�m um t�tulo de trabalho que � o mesmo que seu t�tulo de trabalho quando eles estavam inicialmente
contratados pela empresa (ou seja, eles mudaram de emprego, mas agora voltaram a fazer seu trabalho original).
*/

select employee_id, job_id
from employees
intersect
select employee_id, job_id
from job_history;


/* Exerc�cio 05
O departamento de RH precisa de um relat�rio com as seguintes especifica��es:
� Apelido e ID do departamento de todos os funcion�rios da tabela EMPLOYEES,
Independentemente de pertencer ou n�o a um departamento
� ID do departamento e nome do departamento de todos os departamentos
DEPARTAMENTOS, independentemente de ter ou n�o funcion�rios com
neles
Escreva uma consulta composta para realizar isso.
*/

select last_name, department_id, to_char(null)
from employees
union
select to_char(null), department_id, department_name
from departments;

-- Passos de estudos
-- 1 - Assistir a video aula somente observando 1x
-- 2 - Assistir a video aula agora fazendo os scritps 1x
-- 3 - Assistir a video aula de laborat�rio 1x
-- 4 - Assistir a video aula de laborat�rio fazendo os scritps 1x
-- 5 - Realizar o simulado online
       
-- Abra�os e bons estudos !
       






