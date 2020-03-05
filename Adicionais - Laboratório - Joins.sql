

/*Exerc�cio 01
Escrever uma consulta que produza o endere�o de todos os departamentos, usando tabelas locations e countries.
Mostre o location id, streed adress, city, status ou provience e country em sua saida.*/

select location_id, street_address, city, state_province, country_name
from locations, countries
where locations.country_id = countries.country_id;
      

/*Exerc�cio 02
Fazer um relat�rio de todos os empregados que mostre o ultimo nome, o numero do departamento o nome do departamento
para todos os empregados*/

select e.last_name, e.department_id, d.department_name
from employees e, departments d
where e.department_id = d.department_id;


/*Exerc�cio 03
Fazer um relat�rio de todos os empregados de toronto.  Mostre o nome, o trabalho, o numero de departamento e o nome do 
departamento*/

select e.last_name, e.job_id, e.department_id, d.department_name
from employees e, departments d, locations l
where e.department_id = d.department_id
and  d.location_id = l.location_id
and LOWER(l.city) = 'toronto';


/*Exerc�cio 04
Criar um relat�rio que mostre o ultimo nome e o numero do empregado com o ultimo nome de seu manager e seu numero.
Coloque os cabe�alhos Employee, Emp#, Manager, e Mgr# respectivamente. */


select w.last_name "Employee", w.employee_id "EMP#",
       m.last_name "Manager", m.employee_id "MGR#"
from employees w, employees m
where w.manager_id = m.employee_id;


/*Exerc�cio 05
Modificar o relat�rio acima incluindo o King(ele n�o possui manager).
Ordene os resultados pelo numero do empregado*/

left join de outra forma, empregados que n�o contenha o manager.

select w.last_name "Employee", w.employee_id "EMP#",
       m.last_name "Manager", m.employee_id "MGR#"
from employees w, employees m
where w.manager_id = m.employee_id(+)
order by 2;


/*Exerc�cio 06
Crie um relat�rio que mostre o ultimo nome, o numero do departamento para todos os empregados que trabalha no mesmo departamento*/

select e1.department_id department, e1.last_name employee, e2.last_name colleague
from employees e1, employees e2
where e1.department_id = e2.DEPARTMENT_ID
and e1.employee_id <> e2.employee_id
order by e1.department_id, e1.last_name, e2.last_name;


/*Exerc�cio 07
Crie um relat�rio que mostre os jobs grades e salarios, nomes, trabalho, nome do departamento, salario, e a grade para todos
empregados
*/

desc job_grades

select * from job_grades;

SELECT e.last_name, e.job_id, d.department_name, e.salary, j.grade_level
FROM employees e, departments d, job_grades j
WHERE e.department_id = d.department_id
AND e.salary BETWEEN j.lowest_sal AND j.highest_sal; -- no equijoins


/*Exerc�cio 08
Criar um relat�rio que detrmina o nome dos empregados ap�s o cadastro de Davies.  Mostre o nome a data para todos empregados.
*/

select e.last_name, e.hire_date
from employees e, employees davies
where davies.last_name = 'Davies'
and davies.hire_date < e.hire_date;


/*Exerc�cio 09
Criar um relat�rio que busca os nomes e data de cadastro para todos empregados que foram cadastrados antes de seus managers
Os cabe�alhos dever�o ser Employee, Emp Hired, Manager, e Mgr Hired
*/

select w.last_name Employee, w.hire_date Emp, m.last_name Manager, m.hire_date Hired
from employees w, employees m
where w.manager_id = m.employee_id
and w.hire_date < m.hire_date;


/*Exerc�cio 10
Crie um relat�rio que mostre o nome dos empregados, o nome de seu departamento, o nome deseu job, o nome de sua location e seu countries
*/

select e.last_name, d.department_name, j.job_title, l.CITY, c.COUNTRY_NAME 
from employees e, departments d, jobs j, locations l, countries c
where e.department_id = d.department_id
and l.COUNTRY_ID = c.COUNTRY_ID
and e.job_id = j.job_id
and d.location_id = l.location_id;



       






