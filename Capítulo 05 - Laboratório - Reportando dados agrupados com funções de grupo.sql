------------------------------------------------------------------------------------------------------------------------------------------------------
--                                            Cap�tulo 05 Laborat�rio Dados Agrupados com Fun��es de Grupo                                          --
--                                               Treinamento para certifica��o Fundamentals SQL Oracle                                              --
--                                           Pedro F. Carvalho - DBA / Analista de Sistemas / Desenvolvedor                                         --
--                                         Site : www.pedrofcarvalho.com.br   E-mail : contato@pedrofcarvalho.com.br                                --
------------------------------------------------------------------------------------------------------------------------------------------------------

/* Exerc�cio 01
Encontre o mais alto, mais baixo, soma e sal�rio m�dio de todos os funcion�rios. Rotular as colunas
M�ximo, M�nimo, Soma e M�dia, respectivamente. Arredonde seus resultados para o
N�mero inteiro mais pr�ximo. 
*/

select round(max(salary),0) "Maximo",
       round(min(salary),0) "Minimo",
       round(sum(salary),0) "Soma",
       round(avg(salary),0) "M�dia"
from employees;

/* Exerc�cio 02
Modifique a consulta acima para exibir o m�nimo, m�ximo, soma, e sal�rio m�dio para cada tipo de trabalho. 
*/

select job_id, 
       round(max(salary),0) "Maximo",
       round(min(salary),0) "Minimo",
       round(sum(salary),0) "Soma",
       round(avg(salary),0) "M�dia"
from employees
group by job_id;


/* Exerc�cio 03
Escreva uma consulta para exibir o n�mero de pessoas com o mesmo trabalho.
*/

select job_id, count(*)
from employees
group by job_id;

/* Exerc�cio 04
Generalize a consulta para que o usu�rio no departamento de RH seja solicitado para um cargo.
Insira IT_PROG quando solicitado e clique em OK.
*/

select job_id, count(*)
from employees
where job_id = '&job_title'
group by job_id;

/* Exerc�cio 05
Determine o n�mero de gerentes sem list�-los. Rotular a coluna N�mero De Gerentes.
Dica: Use a coluna MANAGER_ID para determinar o n�mero de gerentes.

Encontre a diferen�a entre os sal�rios mais altos e mais baixos. Rotular a coluna
DIFEREN�A.
*/

select count(distinct manager_id) "Numero de Gerentes"
from employees;

select * from employees;

select max(salary) - min(salary) DIFERENCA
from employees;


/* Exerc�cio 06
Criar um relat�rio para exibir o n�mero do gerente eo sal�rio do mais baixo-pago
empregado para esse gerente. Exclua qualquer pessoa cujo gerente n�o seja conhecido. Excluir
Qualquer grupo onde o sal�rio m�nimo � de US $ 6.000 ou menos. Classificar a sa�da em ordem decrescente
Ordem do sal�rio.
*/

select manager_id, min(salary)
from employees
where manager_id is not null
group by manager_id
having min(salary) < 60000
order by min(salary) desc;

-- Errata olha exerc�cio anterior.


/* Exerc�cio 07
Crie uma consulta que exiba o n�mero total de funcion�rios e, desse total, a
N�mero de funcion�rios contratados em 2001, 2002, 2003 e 2004. Criar
Cabe�alhos das colunas.
*/

select count(*) TOTAL,
      sum(decode(to_char(hire_date, 'YYYY'),2001,1,0)) "2001",
      sum(decode(to_char(hire_date, 'YYYY'),2002,1,0)) "2002",
      sum(decode(to_char(hire_date, 'YYYY'),2003,1,0)) "2003",
      sum(decode(to_char(hire_date, 'YYYY'),2004,1,0)) "2004"
from employees;

select * from employees;


/* Exerc�cio 08
Criar uma consulta de matriz para exibir o trabalho, o sal�rio para esse trabalho com base no
N�mero de departamento, eo sal�rio total para esse trabalho, para os departamentos 20, 50, 80 e
90, dando a cada coluna um cabe�alho apropriado.
*/

decode - primeiro parametro - nome da coluna, segundo parametro � o valor e o terceiro � o que eu quero que substitua

select job_id "JOB",
       sum(decode(department_id, 20, salary)) "20",
       sum(decode(department_id, 50, salary)) "50",
       sum(decode(department_id, 80, salary)) "80",
       sum(decode(department_id, 90, salary)) "90"
from employees
group by job_id;

  
-- Passos de estudos
-- 1 - Assistir a video aula somente observando 1x
-- 2 - Assistir a video aula agora fazendo os scritps 1x
-- 3 - Assistir a video aula de laborat�rio 1x
-- 4 - Assistir a video aula de laborat�rio fazendo os scritps 1x
-- 5 - Realizar o simulado online
       
-- Abra�os e bons estudos !







