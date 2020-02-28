
/* Exerc�cio 01
Crie um relat�rio que produza o seguinte resultado para cada funcion�rio:
<Nome do empregado> ganha <sal�rio> mensalmente, mas quer <3 vezes sal�rio.>. Rotule a coluna Dream Sal�rio.
*/

select last_name || ' ganha ' || to_char (salary, 'fm$999.00') || ' mas quer : ' || to_char(salary * 3, 'fm$999.00')
|| '.' " Dream Salary" from employees;


/* Exerc�cio 02
Exibir o nome de cada empregado, data de contrata��o e data de revis�o do sal�rio, que �
primeira segunda-feira depois de seis meses de servi�o. Rotule a coluna REVIEW. Formate o
Datas para aparecer no formato similar a "segunda-feira, o trinta-primeiro de julho, 2000."
*/

select last_name, fire_date, to_char(next_day(add_months(hire_date, 6), 'MONDAY'), 'fmDay', 'the' Ddspth "of" Month, YYYY') REVIEW
from employees; 

/* Exerc�cio 03
Exibir o sobrenome, data de contrata��o e dia da semana em que o empregado come�ou.
Rotule a coluna DAY. Ordem os resultados pelo dia da semana, come�ando com Segunda-feira.
*/
select last_name, hire_date, to_char(hire_date, 'DAY') Day from employees 
order by to_char(hire_date - 1, 'd')


/* Exerc�cio 04
Crie uma consulta que exiba os sobrenomes e os montantes das comiss�es dos funcion�rios. E se
um funcion�rio n�o ganha comiss�o, mostre "Sem Comiss�o". Rotule a coluna COMM.
*/

nvl - trata valores nulos
select last_name, nvl (to_char(commission_pct), 'No Commission') COMM from employees;



/* Exerc�cio 05
Usando a fun��o DECODE, escreva uma consulta que exibe o grau de todos os funcion�rios
Com base no valor da coluna JOB_ID, usando os seguintes dados:


Categoria de trabalho  Tipo
AD_PRES                 A
ST_MAN                  B
IT_PROG                 C
SA_REP                  D
ST_CLERK                E
Nenhuma das anteriores  0
*/


decode - DECODE compares the expression to each search value one by one. If expression is equal to a search, then the corresponding result is returned by the Oracle Database.

select job_id, decode(job_id, 'ST_CLERK', 'E',
                         'SA_REP', 'D',
                         'IT_PROG', 'C',
			 'SA_REP', 'D'
			 'ST_CLERK', 'E',
			 'O') Grade
from employees;















