------------------------------------------------------------------------------------------------------------------------------------------------------
--                                           Cap�tulo 06 Laborat�rio - Reportando dados de multiplas tabelas                                        --
--                                               Treinamento para certifica��o Fundamentals SQL Oracle                                              --
--                                           Pedro F. Carvalho - DBA / Analista de Sistemas / Desenvolvedor                                         --
--                                         Site : www.pedrofcarvalho.com.br   E-mail : contato@pedrofcarvalho.com.br                                --
------------------------------------------------------------------------------------------------------------------------------------------------------

/* Exerc�cio 01 
Escreva uma consulta para o departamento de RH para produzir os endere�os de todos os departamentos.
Use as tabelas LOCATIONS e COUNTRIES. Mostrar o ID da localiza��o, endere�o,
Cidade, estado ou prov�ncia, e pa�s na sa�da. Use um NATURAL JOIN para produzir
os resultados.
*/

select location_id, street_address, city, state_province, country_name
from locations
natural join countries; -- mesmo tipo de dado e mesmo nome da coluna


/* Exerc�cio 02 
O departamento de RH precisa de um relat�rio de todos os funcion�rios. Escreva uma consulta para exibir o �ltimo
Nome, n�mero de departamento e nome do departamento para todos os funcion�rios.
*/
select last_name, department_id, department_name
from employees
join departments 
using (department_id);



/* Exerc�cio 03 
O departamento de RH precisa de um relat�rio de funcion�rios em Toronto. Exibir o sobrenome,
N�mero do departamento e nome do departamento para todos os funcion�rios que
Toronto.
*/

-- toronto n�o tem nenhum cadastrado
-- seattle

select e.last_name, e.job_id, e.department_id, d.department_name
from employees e join departments d on (e.department_id = d.department_id)
                 join locations l on (d.location_id = l.location_id) and LOWER(l.city) = 'seattle';
--where LOWER(l.city) = 'seattle';


/* Exerc�cio 04 
Crie um relat�rio para exibir os sobrenomes dos funcion�rios e o n�mero de id
os sobrenomes de seus gerentes e o n�mero do gerente. Rotular as colunas Empregado,
Emp #, Manager, e Mgr #, respectivamente. 
*/

select w.last_name "Employee", w.employee_id "ID Emp", m.last_name "Manager", m.employee_id "ID MGR"
from employees w join employees m
on (w.manager_id = m.employee_id);


/* Exerc�cio 05 
Modifique a consulta acima para exibir todos os funcion�rios, incluindo King, que n�o tem
Gerente. Ordene os resultados pelo n�mero do empregado. 
*/

select w.last_name "Employee", w.employee_id "ID Emp", m.last_name "Manager", m.employee_id "ID MGR"
from employees w left outer join employees m on (w.manager_id = m.employee_id) and w.manager_id is null 
order by 2;


/* Exerc�cio 06 
Criar um relat�rio para o departamento de RH que exibe os sobrenomes do empregado, departamento
Todos os funcion�rios que trabalham no mesmo departamento que um dado
empregado. D� a cada coluna um r�tulo apropriado. 
*/

select e.department_id department, e.last_name employee, c.last_name correlacao
from employees e join employees c on (e.department_id = c.department_id)
where e.employee_id <> c.employee_id
order by e.department_id, e.last_name, c.last_name;

/* Exerc�cio 07
O departamento de RH precisa de um relat�rio sobre os graus de trabalho e sal�rios. Para se familiarizar
com a tabela JOB_GRADES, primeiro mostre a estrutura da tabela JOB_GRADES. Ent�o
Crie uma consulta que exibe o nome, a tarefa, o nome do departamento, o sal�rio ea classifica��o para todos
Empregados.
*/

desc job_grades;

select e.last_name, e.job_id, d.department_name, e.salary, j.grade_level
from employees e join departments d on (e.department_id = d.department_id)
                 join job_grades j on (e.salary between j.lowest_sal and j.highest_sal);
                 
 select * from job_grades;                
                 

/* Exerc�cio 08 
O departamento de RH quer determinar os nomes de todos os funcion�rios que foram contratados
Depois de Davies. Criar uma consulta para exibir o nome e contratar a data de qualquer empregado contratado
ap�s o empregado Davies.
*/

select e.last_name, e.hire_date
from employees e JOIN employees davies on (davies.last_name = 'Davies')
where davies.hire_date < e.hire_date
order by 2;

select hire_date from employees where last_name = 'Davies';

29/01/97



/* Exerc�cio 09 
O departamento de RH precisa encontrar os nomes e contratar datas para todos os funcion�rios que
Foram contratados antes de seus gerentes, juntamente com os nomes de seus gestores e datas de contrata��o.
*/

select w.last_name, w.hire_date, m.last_name, m.hire_date
from employees w join employees m on (w.manager_id = m.employee_id)
where w.hire_date < m.hire_date;

-- Passos de estudos
-- 1 - Assistir a video aula somente observando 1x
-- 2 - Assistir a video aula agora fazendo os scritps 1x
-- 3 - Assistir a video aula de laborat�rio 1x
-- 4 - Assistir a video aula de laborat�rio fazendo os scritps 1x
-- 5 - Realizar o simulado online
       
-- Abra�os e bons estudos !
       






