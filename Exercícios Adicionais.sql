------------------------------------------------------------------------------------------------------------------------------------------------------
--                                        EXERC�CIOS ADICIONAIS PREPARAT�RIO PARA SQL FUNDAMENTOS E SQL EXPERT                                      --
--                                           Pedro F. Carvalho - DBA / Analista de Sistemas / Desenvolvedor                                         --
--                                         Site : www.pedrofcarvalho.com.br   E-mail : contato@pedrofcarvalho.com.br                                --
------------------------------------------------------------------------------------------------------------------------------------------------------

/* Exerc�cio 01
O departamento de HR necessita buscar todos os empregados com o tipo de trabalho CLERKS e data de cadastro maior que 1997*/

select * from employees where job_id = 'ST_CLERKS' and hire_date > '31-DEZ-1997'
and to_char(hire_date, 'YY') > 97;

/* Exerc�cio 02
O departamento de HR necessita buscar empregados que possuem comiss�o. Mostrar no last_name, job, salario, comiss�o e ordenar
descendete*/

select last_name, job_id, salary, comission_pct from employee where comission_pct is not null order by salary desc




/* Exerc�cio 03
HR departamento necessita buscar os dados dos empregados com o last_name, e o calculo de sua comiss�o mais 10% onde realmente
possuia comiss�o*/

round - arredondamento

select 'O sal�rio de ' || last_name || ' Acrescido de 10% ' || round(salary*1.10) || ' Novo sal�rio ' 
from employees where comission_pct is not null 

/* Exerc�cio 04
Crie um relat�rio que mostre a dura��o dos empregados. Mostre o last_name de todos empregados e seu numero de anos e o numero 
completo de meses. Ordene por dura��o em anos e depois em meses.*/

months_between - vai trazer os meses. divididos por 12 vai dar o n�mero de anos
trunc - The TRUNC (number) function returns n1 truncated to n2 decimal places. If n2 is omitted, then n1 is truncated to 0 places. n2 can be negative to truncate (make zero) n2 digits left of the decimal point.

mod - tr�s o resto da divis�o

SELECT TRUNC(15.79,1) "Truncate" FROM DUAL;

  Truncate
----------
      15.7

select last_name, trunc(months_between(sysdate, hire_date)/12) ANOS, trunc(mod(months_between(sysdate, hire_date), 12)) MES
from employees order by ANOS desc, MES desc


/* Exerc�cio 05
Mostre os empregados que tem o ultimo nome com as letras inici�ris J K L ou M*/

select last_name from employees 
--where substr(last_name, 1,1) in ('J', 'K', 'L', 'M') 
where last_name like 'J%'
or last_name like 'K%'
or last_name like 'L%'
or last_name like 'M%'



/* Exerc�cio 06
Crie um relat�rio que mostre todos os empregados, indicando sim ou n�o quando recebem comiss�o*/


select last_name, salary, decode(comission_pct, null 'NO', 'YES') comissao from employees

This example decodes the value warehouse_id. If warehouse_id is 1, then the function returns 'Southlake'; if warehouse_id is 2, then it returns 'San Francisco'; and so forth. If warehouse_id is not 1, 2, 3, or 4, then the function returns 'Non domestic'.

SELECT product_id,
       DECODE (warehouse_id, 1, 'Southlake', 
                             2, 'San Francisco', 
                             3, 'New Jersey', 
                             4, 'Seattle',
                                'Non domestic') 
       "Location of inventory" FROM inventories
       WHERE product_id < 1775;


/* Exerc�cio 07
Crie um relat�rio que mostre nome do departamento, localiza��o, nome do empregado, job, e o salario.
A localiza��o deve ser buscada por prompt*/

select d.department_name, d.location_id, e.last_name, e.job_id from department d, employee e 
where e.department_id = d. department_id
and d.location_id = &location_id; 



/* Exerc�cio 08
Busque o numero de empregados que tenham o ultimo nome terminado com a letra n, crie 2 possibilidades.*/

select count(*) from employees where last_name like '%n';

--negativo � de tr�s para frente
select count(*) from employees where substr(last_name, -1) = 'n'


/* Exerc�cio 09
Crie um relat�rio que mostre o nome, a localiza��o o numero de empregados para todo departamento.
Altere o join para com ou sem departamentos
*/
select d.department_id, d.department_name, d.location_id, count(e.employee_id)  employees e right outer join department d
on e.department_id = d.department_id
group by d.department_id, d.department_name, d.location_id



/* Exerc�cio 10
Busque os jobs do departamento 10 e 20 distintos*/

select distinct job_id 
from employees
where department_id in (10, 20)





/* Exerc�cio 11
Crie um relat�rio que mostre os jobs que s�o de administration e executive.  Mostre o numero quantidade de jobs e
e do maior para o menor*/

select e.job_id, count(e.job_id) frequencia
from employees e join department d
on e.department_id = d.department_id
where d.department_name in ('Administration', 'Executive')
group by e.job_id
order by frequencia



/* Exerc�cio 12
Mostre todos os empregados que se cadastraram no sistema no dia 16 ou maior*/

select last_name, hire_date from employees 
where to_char(hire_date, 'DD') <= 16;


/* Exerc�cio 13
Crie um relat�rio que mostre para todos os empregados seu ultimo nome, salario, e o salario em porcentagem de 1000 dolar*/

select last_name, salary, trunc(salary, -3)/1000 from employees


/* Exerc�cio 14
Mostre todos os empregados que possuem managers com o salario maior que 1500
Mostre o nome, o nome do administrador, o salario do administrador o salario grade*/


select e.last_name, m.last_name manager, m.salary, j.grade_level
from employee e join employees m
on e.manager = m.employee_id
join job_grades j
on m.salary between j.lowest_sal and j.highest_sal
and m.salary > 1000;


/* Exerc�cio 15
Mostre o numero do departamento, nome, numero de empregados a media salarial de todos departamentos, com nome
salario e jobs dos empregrados que trabalham e todos departamentos*



/* Exerc�cio 16
Crie um relat�rio que mostre o numero do departamento e o menor salario do departamento comparando com sua media salarial
ao maior media salarial dos empregados
*/



/* Exerc�cio 17
Crie um relat�rio que mostre onde o departamento sales n�o trabalha, incluir o numero nome e localiza��o do departamento*/



/* Exerc�cio 18
Crie um relat�rio estatistico para os departamentos.  Inclua o numero, nome e o numero de empregados trabalhando para todos os
departamentos e mostre somente os 3 primeiros, depois outra consulta quemostre os maiores numeros de empregados e depois outrs
relat�rio que mostre o menor numero de empregados
*/



/* Exerc�cio 19
Crie um relat�rio que mostre o numero do empregado, seu ultimonome, seu salario e o nome do departamento e a media salarial por departamento
de todos os empregados*/




/* Exerc�cio 20
Mostre todos os empregados onde o numero do dia da semana comparando com o maior numero de empregados*/



/* Exerc�cio 21
Crie um relatorio de anivers�rio baseado na data de cadastro dos empregados. Ordene por ascendente essa data*/





































