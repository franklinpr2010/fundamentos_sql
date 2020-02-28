



/* Exerc�cio 01
Escreva uma consulta para exibir a data do sistema. Rotule a coluna Date.
*/

select sysdate "Date" from dual;


/* Exerc�cio 02
O departamento de RH precisa de um relat�rio para exibir o n�mero de empregado, sobrenome, sal�rio,
E o sal�rio aumentou 15,5% (expresso em um n�mero inteiro) para cada funcion�rio.
Rotule a coluna Novo Sal�rio.
*/
select employee_id, last_name, salary, round (salary * 1.155, 0) as "New Salary" from employees


/* Exerc�cio 03
Modifique sua consulta anterior para adicionar uma coluna que subtraia o sal�rio antigo
do novo sal�rio. Rotular a coluna Aumentar. 
*/
select employee_id, last_name, salary, round(salary * 1.155, 0) as "new salary", salary * 1.155 from employees;


/* Exerc�cio 04
Escreva uma consulta que exibe o sobrenome (com a primeira letra em mai�scula e
outras letras em min�sculas) e o comprimento do sobrenome para todos os funcion�rios cujos
Nome come�a com as letras "J", "A" ou "M." D� a cada coluna um r�tulo apropriado.
Classifique os resultados pelos sobrenomes dos empregados.

Reescreva a consulta para que o usu�rio seja solicitado a inserir uma letra 
Por exemplo, se o usu�rio digitar H (mai�sculo) a sa�da deve mostrar todos os funcion�rios cujo sobrenome come�a com a letra "H."

Modifique a consulta acima para caso o usu�rio digite a letra me ma�usculo.
*/
initcap - fun��o para colocar letra mai�scula

select initcap(last_name) "Name", length(last_name) "Lenght" from employees where last_name like 'J%'
or last_name like 'A%'
or last_name like 'M%'
order by last_name



/* Exerc�cio 05
6) O departamento de RH quer encontrar a dura��o do emprego para cada funcion�rio. 
Para cada funcion�rio, exibir o sobrenome e calcular o n�mero de meses entre Hoje e a data em que o empregado foi contratado. 
Rotular a coluna MONTHS_WORKED. 
Ordem seus resultados pelo n�mero de meses empregados. 
Arredondar o resultado
*/


select last_name, round(months_between(sysdate, hire_date)) MONTHS_WORKED from employees
order by MONTHS_WORKED

/* Exerc�cio 06
7) Criar uma consulta para exibir o �ltimo nome e sal�rio para todos os funcion�rios. Formate o
Sal�rio para ser de 15 caracteres, esquerdo-direita com o s�mbolo $. Rotular a coluna SAL�RIO.
*/

select last_name, lpad(salary, 15, '$') SALARY from employees



/* Exerc�cio 07
Crie uma consulta que exibe os oito primeiros caracteres dos sobrenomes dos funcion�rios
e indica os montantes de seus sal�rios com asteriscos. Cada asterisco significa
mil d�lares. Classificar os dados em ordem decrescente de sal�rio. Rotular a coluna
EMPLOYEES_AND_THEIR_SALARIES.
*/


select rpad(last_name, 8 || ' ' rpad(' ', SALARY/1000+1, '*') EMPLOYEES_AND_THEIR_SALARIES from employees order by salary desc


/* Exerc�cio 08
Crie uma consulta para exibir o sobrenome eo n�mero de semanas empregadas para todos
Funcion�rios no departamento 90. Rotular o n�mero de semanas coluna TENURE. Truncar
O valor do n�mero de semanas para 0 casas decimais. Mostrar os registros em ordem decrescente
Da perman�ncia do empregado.
Nota: O valor TENURE ser� diferente, pois depende da data em que voc�
Consulta.
*/

select last_name, trunc((sysdate - hire_date)/7) TENURE from employees
from employees where department_id = 90
orgder by TENURE 







