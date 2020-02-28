------------------------------------------------------------------------------------------------------------------------------------------------------
--                                            Capítulo 05 Laboratório Dados Agrupados com Funções de Grupo                                          --
--                                               Treinamento para certificação Fundamentals SQL Oracle                                              --
--                                           Pedro F. Carvalho - DBA / Analista de Sistemas / Desenvolvedor                                         --
--                                         Site : www.pedrofcarvalho.com.br   E-mail : contato@pedrofcarvalho.com.br                                --
------------------------------------------------------------------------------------------------------------------------------------------------------

/* Exercício 01
Encontre o mais alto, mais baixo, soma e salário médio de todos os funcionários. Rotular as colunas
Máximo, Mínimo, Soma e Média, respectivamente. Arredonde seus resultados para o
Número inteiro mais próximo. 
*/

select round(max(salary),0) "Maximo",
       round(min(salary),0) "Minimo",
       round(sum(salary),0) "Soma",
       round(avg(salary),0) "Média"
from employees;

/* Exercício 02
Modifique a consulta acima para exibir o mínimo, máximo, soma, e salário médio para cada tipo de trabalho. 
*/

select job_id, 
       round(max(salary),0) "Maximo",
       round(min(salary),0) "Minimo",
       round(sum(salary),0) "Soma",
       round(avg(salary),0) "Média"
from employees
group by job_id;


/* Exercício 03
Escreva uma consulta para exibir o número de pessoas com o mesmo trabalho.
*/

select job_id, count(*)
from employees
group by job_id;

/* Exercício 04
Generalize a consulta para que o usuário no departamento de RH seja solicitado para um cargo.
Insira IT_PROG quando solicitado e clique em OK.
*/

select job_id, count(*)
from employees
where job_id = '&job_title'
group by job_id;

/* Exercício 05
Determine o número de gerentes sem listá-los. Rotular a coluna Número De Gerentes.
Dica: Use a coluna MANAGER_ID para determinar o número de gerentes.

Encontre a diferença entre os salários mais altos e mais baixos. Rotular a coluna
DIFERENÇA.
*/

select count(distinct manager_id) "Numero de Gerentes"
from employees;

select * from employees;

select max(salary) - min(salary) DIFERENCA
from employees;


/* Exercício 06
Criar um relatório para exibir o número do gerente eo salário do mais baixo-pago
empregado para esse gerente. Exclua qualquer pessoa cujo gerente não seja conhecido. Excluir
Qualquer grupo onde o salário mínimo é de US $ 6.000 ou menos. Classificar a saída em ordem decrescente
Ordem do salário.
*/

select manager_id, min(salary)
from employees
where manager_id is not null
group by manager_id
having min(salary) < 60000
order by min(salary) desc;

-- Errata olha exercício anterior.


/* Exercício 07
Crie uma consulta que exiba o número total de funcionários e, desse total, a
Número de funcionários contratados em 2001, 2002, 2003 e 2004. Criar
Cabeçalhos das colunas.
*/

select count(*) TOTAL,
      sum(decode(to_char(hire_date, 'YYYY'),2001,1,0)) "2001",
      sum(decode(to_char(hire_date, 'YYYY'),2002,1,0)) "2002",
      sum(decode(to_char(hire_date, 'YYYY'),2003,1,0)) "2003",
      sum(decode(to_char(hire_date, 'YYYY'),2004,1,0)) "2004"
from employees;

select * from employees;


/* Exercício 08
Criar uma consulta de matriz para exibir o trabalho, o salário para esse trabalho com base no
Número de departamento, eo salário total para esse trabalho, para os departamentos 20, 50, 80 e
90, dando a cada coluna um cabeçalho apropriado.
*/

decode - primeiro parametro - nome da coluna, segundo parametro é o valor e o terceiro é o que eu quero que substitua

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
-- 3 - Assistir a video aula de laboratório 1x
-- 4 - Assistir a video aula de laboratório fazendo os scritps 1x
-- 5 - Realizar o simulado online
       
-- Abraços e bons estudos !







