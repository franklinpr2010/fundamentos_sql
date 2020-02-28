------------------------------------------------------------------------------------------------------------------------------------------------------
--                                           Capítulo 06 Laboratório - Reportando dados de multiplas tabelas                                        --
--                                               Treinamento para certificação Fundamentals SQL Oracle                                              --
--                                           Pedro F. Carvalho - DBA / Analista de Sistemas / Desenvolvedor                                         --
--                                         Site : www.pedrofcarvalho.com.br   E-mail : contato@pedrofcarvalho.com.br                                --
------------------------------------------------------------------------------------------------------------------------------------------------------

/* Exercício 01 
Escreva uma consulta para o departamento de RH para produzir os endereços de todos os departamentos.
Use as tabelas LOCATIONS e COUNTRIES. Mostrar o ID da localização, endereço,
Cidade, estado ou província, e país na saída. Use um NATURAL JOIN para produzir
os resultados.
*/

select location_id, street_address, city, state_province, country_name
from locations
natural join countries; -- mesmo tipo de dado e mesmo nome da coluna


/* Exercício 02 
O departamento de RH precisa de um relatório de todos os funcionários. Escreva uma consulta para exibir o último
Nome, número de departamento e nome do departamento para todos os funcionários.
*/
select last_name, department_id, department_name
from employees
join departments 
using (department_id);



/* Exercício 03 
O departamento de RH precisa de um relatório de funcionários em Toronto. Exibir o sobrenome,
Número do departamento e nome do departamento para todos os funcionários que
Toronto.
*/

-- toronto não tem nenhum cadastrado
-- seattle

select e.last_name, e.job_id, e.department_id, d.department_name
from employees e join departments d on (e.department_id = d.department_id)
                 join locations l on (d.location_id = l.location_id) and LOWER(l.city) = 'seattle';
--where LOWER(l.city) = 'seattle';


/* Exercício 04 
Crie um relatório para exibir os sobrenomes dos funcionários e o número de id
os sobrenomes de seus gerentes e o número do gerente. Rotular as colunas Empregado,
Emp #, Manager, e Mgr #, respectivamente. 
*/

select w.last_name "Employee", w.employee_id "ID Emp", m.last_name "Manager", m.employee_id "ID MGR"
from employees w join employees m
on (w.manager_id = m.employee_id);


/* Exercício 05 
Modifique a consulta acima para exibir todos os funcionários, incluindo King, que não tem
Gerente. Ordene os resultados pelo número do empregado. 
*/

select w.last_name "Employee", w.employee_id "ID Emp", m.last_name "Manager", m.employee_id "ID MGR"
from employees w left outer join employees m on (w.manager_id = m.employee_id) and w.manager_id is null 
order by 2;


/* Exercício 06 
Criar um relatório para o departamento de RH que exibe os sobrenomes do empregado, departamento
Todos os funcionários que trabalham no mesmo departamento que um dado
empregado. Dê a cada coluna um rótulo apropriado. 
*/

select e.department_id department, e.last_name employee, c.last_name correlacao
from employees e join employees c on (e.department_id = c.department_id)
where e.employee_id <> c.employee_id
order by e.department_id, e.last_name, c.last_name;

/* Exercício 07
O departamento de RH precisa de um relatório sobre os graus de trabalho e salários. Para se familiarizar
com a tabela JOB_GRADES, primeiro mostre a estrutura da tabela JOB_GRADES. Então
Crie uma consulta que exibe o nome, a tarefa, o nome do departamento, o salário ea classificação para todos
Empregados.
*/

desc job_grades;

select e.last_name, e.job_id, d.department_name, e.salary, j.grade_level
from employees e join departments d on (e.department_id = d.department_id)
                 join job_grades j on (e.salary between j.lowest_sal and j.highest_sal);
                 
 select * from job_grades;                
                 

/* Exercício 08 
O departamento de RH quer determinar os nomes de todos os funcionários que foram contratados
Depois de Davies. Criar uma consulta para exibir o nome e contratar a data de qualquer empregado contratado
após o empregado Davies.
*/

select e.last_name, e.hire_date
from employees e JOIN employees davies on (davies.last_name = 'Davies')
where davies.hire_date < e.hire_date
order by 2;

select hire_date from employees where last_name = 'Davies';

29/01/97



/* Exercício 09 
O departamento de RH precisa encontrar os nomes e contratar datas para todos os funcionários que
Foram contratados antes de seus gerentes, juntamente com os nomes de seus gestores e datas de contratação.
*/

select w.last_name, w.hire_date, m.last_name, m.hire_date
from employees w join employees m on (w.manager_id = m.employee_id)
where w.hire_date < m.hire_date;

-- Passos de estudos
-- 1 - Assistir a video aula somente observando 1x
-- 2 - Assistir a video aula agora fazendo os scritps 1x
-- 3 - Assistir a video aula de laboratório 1x
-- 4 - Assistir a video aula de laboratório fazendo os scritps 1x
-- 5 - Realizar o simulado online
       
-- Abraços e bons estudos !
       






