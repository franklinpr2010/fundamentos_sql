------------------------------------------------------------------------------------------------------------------------------------------------------
--                                           Cap�tulo 06 Laborat�rio - Reportando dados de multiplas tabelas                                        --
--                                               Treinamento para certifica��o Fundamentals SQL Oracle                                              --
--                                           Pedro F. Carvalho - DBA / Analista de Sistemas / Desenvolvedor                                         --
--                                         Site : www.pedrofcarvalho.com.br   E-mail : contato@pedrofcarvalho.com.br                                --
------------------------------------------------------------------------------------------------------------------------------------------------------

/* Exerc�cio 01
O departamento de RH precisa de uma consulta que solicite ao usu�rio um sobrenome de empregado.
A consulta, em seguida, exibe o sobrenome e a data de contrata��o de qualquer funcion�rio no mesma
departamento como o empregado cujo nome eles fornecem (excluindo esse empregado). Para
Exemplo, se o usu�rio entrar Zlotkey, localizar todos os funcion�rios que trabalham com Zlotkey
(Excluindo Zlotkey).
*/

select last_name, hire_date
from employees
where department_id = ( select department_id
                        from employees
                        where last_name = '&&Nome')
and last_name <> '&Nome';

/* Exerc�cio 02
Crie um relat�rio que exiba o n�mero de empregado, sobrenome e sal�rio de todos
empregados que ganham mais do que o sal�rio m�dio. Classifique os resultados por ordem de
sal�rio ascendente.
*/

select employee_id, last_name, salary
from employees
where salary > (select avg(salary)
                from employees)
order by salary;

/* Exerc�cio 03
Escreva uma consulta que exibe o n�mero de empregado e o sobrenome de todos os funcion�rios que
trabalhe em um departamento com qualquer funcion�rio cujo sobrenome contenha um "u".
*/

select employee_id, last_name
from employees
where department_id in (select department_id
                         from employees
                        where last_name like '%u%');


/* Exerc�cio 04
O departamento de RH precisa de um relat�rio que exibe o sobrenome, o n�mero do departamento,
e ID do trabalho de todos os funcion�rios cujo ID de localiza��o do departamento � 1700.
Modificar a consulta para que o usu�rio � solicitado para um local ID. 
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
                        

/* Exerc�cio 05
Criar um relat�rio para HR que exibe o sobrenome e o sal�rio de cada funcion�rio que
� reportado ao KING
*/

select last_name, salary
from employees
where manager_id in (select employee_id
                    from employees
                    where last_name = 'King');



/* Exerc�cio 06
Crie um relat�rio para HR que exibe o n�mero de departamento, sobrenome e ID do trabalho para
Cada funcion�rio do departamento Executivo.
*/

select department_id, last_name, job_id
from employees
where department_id in (select department_id
                        from departments
                        where department_name = 'Executive');
                        

/* Exerc�cio 07
Crie um relat�rio que exiba uma lista de todos os funcion�rios cujo sal�rio � maior
sal�rio de qualquer funcion�rio do departamento 60.
*/

select last_name, salary
from employees
where salary > any (select salary
                    from employees
                    where department_id = 60);
                    
/* Exerc�cio 08
Modifique a consulta anterior para exibir o n�mero de empregado, sobrenome,
e sal�rio de todos os empregados que ganham mais do que o sal�rio m�dio e que trabalham em um
departamento com qualquer funcion�rio cujo sobrenome contenha um "u".
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
-- 3 - Assistir a video aula de laborat�rio 1x
-- 4 - Assistir a video aula de laborat�rio fazendo os scritps 1x
-- 5 - Realizar o simulado online
       
-- Abra�os e bons estudos !
       






