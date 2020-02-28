------------------------------------------------------------------------------------------------------------------------------------------------------
--                                           Capítulo 06 Laboratório - Reportando dados de multiplas tabelas                                        --
--                                               Treinamento para certificação Fundamentals SQL Oracle                                              --
--                                           Pedro F. Carvalho - DBA / Analista de Sistemas / Desenvolvedor                                         --
--                                         Site : www.pedrofcarvalho.com.br   E-mail : contato@pedrofcarvalho.com.br                                --
------------------------------------------------------------------------------------------------------------------------------------------------------

/* Exercício 01
O departamento de RH precisa de uma consulta que solicite ao usuário um sobrenome de empregado.
A consulta, em seguida, exibe o sobrenome e a data de contratação de qualquer funcionário no mesma
departamento como o empregado cujo nome eles fornecem (excluindo esse empregado). Para
Exemplo, se o usuário entrar Zlotkey, localizar todos os funcionários que trabalham com Zlotkey
(Excluindo Zlotkey).
*/

select last_name, hire_date
from employees
where department_id = ( select department_id
                        from employees
                        where last_name = '&&Nome')
and last_name <> '&Nome';

/* Exercício 02
Crie um relatório que exiba o número de empregado, sobrenome e salário de todos
empregados que ganham mais do que o salário médio. Classifique os resultados por ordem de
salário ascendente.
*/

select employee_id, last_name, salary
from employees
where salary > (select avg(salary)
                from employees)
order by salary;

/* Exercício 03
Escreva uma consulta que exibe o número de empregado e o sobrenome de todos os funcionários que
trabalhe em um departamento com qualquer funcionário cujo sobrenome contenha um "u".
*/

select employee_id, last_name
from employees
where department_id in (select department_id
                         from employees
                        where last_name like '%u%');


/* Exercício 04
O departamento de RH precisa de um relatório que exibe o sobrenome, o número do departamento,
e ID do trabalho de todos os funcionários cujo ID de localização do departamento é 1700.
Modificar a consulta para que o usuário é solicitado para um local ID. 
*/

select last_name, department_id, job_id
from employees
where department_id in (select department_id
                        from departments
                        where location_id = 1700);
                        
select last_name, department_id, job_id
from employees
where department_id in (select department_id
                        from departments
                        where location_id = '&local');
                        

/* Exercício 05
Criar um relatório para HR que exibe o sobrenome e o salário de cada funcionário que
é reportado ao KING
*/

select last_name, salary
from employees
where manager_id in (select employee_id
                    from employees
                    where last_name = 'King');



/* Exercício 06
Crie um relatório para HR que exibe o número de departamento, sobrenome e ID do trabalho para
Cada funcionário do departamento Executivo.
*/

select department_id, last_name, job_id
from employees
where department_id in (select department_id
                        from departments
                        where department_name = 'Executive');
                        

/* Exercício 07
Crie um relatório que exiba uma lista de todos os funcionários cujo salário é maior
salário de qualquer funcionário do departamento 60.
*/

select last_name, salary
from employees
where salary > any (select salary
                    from employees
                    where department_id = 60);
                    
/* Exercício 08
Modifique a consulta anterior para exibir o número de empregado, sobrenome,
e salário de todos os empregados que ganham mais do que o salário médio e que trabalham em um
departamento com qualquer funcionário cujo sobrenome contenha um "u".
*/

select last_name, salary
from employees
where department_id in (select department_id
                       from employees
                       where last_name like '%u%')
and salary >          (select avg(salary) from employees);

-- Passos de estudos
-- 1 - Assistir a video aula somente observando 1x
-- 2 - Assistir a video aula agora fazendo os scritps 1x
-- 3 - Assistir a video aula de laboratório 1x
-- 4 - Assistir a video aula de laboratório fazendo os scritps 1x
-- 5 - Realizar o simulado online
       
-- Abraços e bons estudos !
       






