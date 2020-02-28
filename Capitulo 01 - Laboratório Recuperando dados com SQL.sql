
                                               
/* Exercício 01 
Crie uma consulta para exibir o número de empregado, primeiro nome, sobrenome, número de telefone e número de departamento (tabela employees). 
*/



/* Exercício 02 
Crie uma consulta para exibir o primeiro nome, sobrenome, data de contratação, salário e salário após um aumento de 20%. 
Nomeie a última coluna (salário depois de um aumento) título como "ANNUAL_SAL" (tabela employees).
*/

select first_name, last_name, hire_date, salary, salary * 1.2 as "ANNUAL_SAL" from employees;


/* Exercício 03 
Crie uma consulta para exibir o sobrenome concatenado com o primeiro nome, separado por espaço e o número de telefone concatenado com o 
endereço de e-mail, separados por hífen. Nomeie os cabeçalhos de coluna "FULL_NAME" e "CONTACT_DETAILS" respectivamente (tabela employees).
*/

select last_name || ' ' || first_name AS "FULL_NAME", phone_number || ' ' || email as "CONTACT_DETAILS" from employees;

/* Exercício 04 
Crie uma consulta para exibir os números de gerente exclusivo da tabela employees.
*/
select distinct (manager_id) from employees;


/* Exercício 05 
Crie uma consulta para exibir o apelido concatenado com coluna job_id, separado por espaço. Nomeie este cabeçalho da coluna como 
"EMPLOYEE_AND_TITLE" (tabela employee).
*/

select last_name || '' || job_id as "EMPLOYEE_AND_TITLE" from employees;


/* Exercício 06 
Crie uma consulta para exibir o nome, o sobrenome, o salário ea data de contratação concatenados com a seqüência literal "HD", 
separados por espaço. Nomeie os cabeçalhos das colunas "FN", "LN", "SAL" e "HD" respectivamente (tabela employee).
*/

select first_name as "FN", last_name as "LN", salary as "SAL", 'HD: ' || hire_date AS "HD" from employees;


/* Exercício 07 
Crie uma consulta para exibir os salários exclusivos em tabela employee
*/

select distinct salary from employees

/* Exercício 08 
Crie uma consulta para exibir a combinação exclusiva de valores em column_de_departamento e colunas de job_id (tabela employee)
*/
select distinct departament_id, job_id from employees;


/* Exercício 09 
Crie uma consulta que exiba todos os dados da tabela employees, separando-os por uma virgula e nomeie esta coluna como SAIDA.
*/

select last_name || ',' || job_id as "SAIDA" from employees;



/* Exercício 10 
O departamento de RH solicitou um relatório de todos os funcionários e seus IDs de trabalho. Exibe o sobrenome concatenado 
com o ID do trabalho (separado por uma vírgula e espaço) e nomeie a coluna Empregado e Título*/

select last_name || ',' || job_id as "EMPREGADO E TITULO" from employees;

                 
