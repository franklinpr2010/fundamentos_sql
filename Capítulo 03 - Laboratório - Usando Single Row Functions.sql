



/* Exercício 01
Escreva uma consulta para exibir a data do sistema. Rotule a coluna Date.
*/

select sysdate "Date" from dual;


/* Exercício 02
O departamento de RH precisa de um relatório para exibir o número de empregado, sobrenome, salário,
E o salário aumentou 15,5% (expresso em um número inteiro) para cada funcionário.
Rotule a coluna Novo Salário.
*/
select employee_id, last_name, salary, round (salary * 1.155, 0) as "New Salary" from employees


/* Exercício 03
Modifique sua consulta anterior para adicionar uma coluna que subtraia o salário antigo
do novo salário. Rotular a coluna Aumentar. 
*/
select employee_id, last_name, salary, round(salary * 1.155, 0) as "new salary", salary * 1.155 from employees;


/* Exercício 04
Escreva uma consulta que exibe o sobrenome (com a primeira letra em maiúscula e
outras letras em minúsculas) e o comprimento do sobrenome para todos os funcionários cujos
Nome começa com as letras "J", "A" ou "M." Dê a cada coluna um rótulo apropriado.
Classifique os resultados pelos sobrenomes dos empregados.

Reescreva a consulta para que o usuário seja solicitado a inserir uma letra 
Por exemplo, se o usuário digitar H (maiúsculo) a saída deve mostrar todos os funcionários cujo sobrenome começa com a letra "H."

Modifique a consulta acima para caso o usuário digite a letra me maíusculo.
*/
initcap - função para colocar letra maiúscula

select initcap(last_name) "Name", length(last_name) "Lenght" from employees where last_name like 'J%'
or last_name like 'A%'
or last_name like 'M%'
order by last_name



/* Exercício 05
6) O departamento de RH quer encontrar a duração do emprego para cada funcionário. 
Para cada funcionário, exibir o sobrenome e calcular o número de meses entre Hoje e a data em que o empregado foi contratado. 
Rotular a coluna MONTHS_WORKED. 
Ordem seus resultados pelo número de meses empregados. 
Arredondar o resultado
*/


select last_name, round(months_between(sysdate, hire_date)) MONTHS_WORKED from employees
order by MONTHS_WORKED

/* Exercício 06
7) Criar uma consulta para exibir o último nome e salário para todos os funcionários. Formate o
Salário para ser de 15 caracteres, esquerdo-direita com o símbolo $. Rotular a coluna SALÁRIO.
*/

select last_name, lpad(salary, 15, '$') SALARY from employees



/* Exercício 07
Crie uma consulta que exibe os oito primeiros caracteres dos sobrenomes dos funcionários
e indica os montantes de seus salários com asteriscos. Cada asterisco significa
mil dólares. Classificar os dados em ordem decrescente de salário. Rotular a coluna
EMPLOYEES_AND_THEIR_SALARIES.
*/


select rpad(last_name, 8 || ' ' rpad(' ', SALARY/1000+1, '*') EMPLOYEES_AND_THEIR_SALARIES from employees order by salary desc


/* Exercício 08
Crie uma consulta para exibir o sobrenome eo número de semanas empregadas para todos
Funcionários no departamento 90. Rotular o número de semanas coluna TENURE. Truncar
O valor do número de semanas para 0 casas decimais. Mostrar os registros em ordem decrescente
Da permanência do empregado.
Nota: O valor TENURE será diferente, pois depende da data em que você
Consulta.
*/

select last_name, trunc((sysdate - hire_date)/7) TENURE from employees
from employees where department_id = 90
orgder by TENURE 







