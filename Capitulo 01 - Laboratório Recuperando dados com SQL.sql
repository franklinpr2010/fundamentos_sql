
                                               
/* Exerc�cio 01 
Crie uma consulta para exibir o n�mero de empregado, primeiro nome, sobrenome, n�mero de telefone e n�mero de departamento (tabela employees). 
*/



/* Exerc�cio 02 
Crie uma consulta para exibir o primeiro nome, sobrenome, data de contrata��o, sal�rio e sal�rio ap�s um aumento de 20%. 
Nomeie a �ltima coluna (sal�rio depois de um aumento) t�tulo como "ANNUAL_SAL" (tabela employees).
*/

select first_name, last_name, hire_date, salary, salary * 1.2 as "ANNUAL_SAL" from employees;


/* Exerc�cio 03 
Crie uma consulta para exibir o sobrenome concatenado com o primeiro nome, separado por espa�o e o n�mero de telefone concatenado com o 
endere�o de e-mail, separados por h�fen. Nomeie os cabe�alhos de coluna "FULL_NAME" e "CONTACT_DETAILS" respectivamente (tabela employees).
*/

select last_name || ' ' || first_name AS "FULL_NAME", phone_number || ' ' || email as "CONTACT_DETAILS" from employees;

/* Exerc�cio 04 
Crie uma consulta para exibir os n�meros de gerente exclusivo da tabela employees.
*/
select distinct (manager_id) from employees;


/* Exerc�cio 05 
Crie uma consulta para exibir o apelido concatenado com coluna job_id, separado por espa�o. Nomeie este cabe�alho da coluna como 
"EMPLOYEE_AND_TITLE" (tabela employee).
*/

select last_name || '' || job_id as "EMPLOYEE_AND_TITLE" from employees;


/* Exerc�cio 06 
Crie uma consulta para exibir o nome, o sobrenome, o sal�rio ea data de contrata��o concatenados com a seq��ncia literal "HD", 
separados por espa�o. Nomeie os cabe�alhos das colunas "FN", "LN", "SAL" e "HD" respectivamente (tabela employee).
*/

select first_name as "FN", last_name as "LN", salary as "SAL", 'HD: ' || hire_date AS "HD" from employees;


/* Exerc�cio 07 
Crie uma consulta para exibir os sal�rios exclusivos em tabela employee
*/

select distinct salary from employees

/* Exerc�cio 08 
Crie uma consulta para exibir a combina��o exclusiva de valores em column_de_departamento e colunas de job_id (tabela employee)
*/
select distinct departament_id, job_id from employees;


/* Exerc�cio 09 
Crie uma consulta que exiba todos os dados da tabela employees, separando-os por uma virgula e nomeie esta coluna como SAIDA.
*/

select last_name || ',' || job_id as "SAIDA" from employees;



/* Exerc�cio 10 
O departamento de RH solicitou um relat�rio de todos os funcion�rios e seus IDs de trabalho. Exibe o sobrenome concatenado 
com o ID do trabalho (separado por uma v�rgula e espa�o) e nomeie a coluna Empregado e T�tulo*/

select last_name || ',' || job_id as "EMPREGADO E TITULO" from employees;

                 
