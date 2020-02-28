------------------------------------------------------------------------------------------------------------------------------------------------------
--                                        Capitulo 04 - Laboratório - Sql Expert - Manipulando Grandes Objetos                                      --
--                                               Treinamento para certificação Fundamentals SQL Oracle                                              --
--                                           Pedro F. Carvalho - DBA / Analista de Sistemas / Desenvolvedor                                         --
--                                         Site : www.pedrofcarvalho.com.br   E-mail : contato@pedrofcarvalho.com.br                                --
------------------------------------------------------------------------------------------------------------------------------------------------------

/* Exercício 01
Crie a estrutura de tabelas abaixo*/

drop table sales_history;
create table sales_history
( empid number,
   hiredate date,
   sal number(8,2));

drop table mgr_history; 
create table mgr_history  
( empid number,
  mrg number,
  sal number(8,2)
  );
  
drop table special_sal;  
create table special_sal
( empid number,
  sal number(8,2)
  );
  
drop table emp_sales_info;
create table emp_sales_info(
id number(6),
week number(2),
qty_sales number(8,2));


/* Exercício 02
Escreva uma consulta para fazer o seguinte:
- Recupere detalhes, como identificação do empregado, data do contrato, salário e ID do gerente
dos funcionários cuja identidade de empregado é inferior a 125 do
tabela de EMPREGADOS.
- Se o salário for superior a US $ 20.000, insira detalhes como o ID do empregado
e salário na tabela SPECIAL_SAL.
- Insira detalhes como o ID do empregado, a data de contratação e o salário no
Tabela SAL_HISTORY.
- Insira detalhes como o ID do empregado, o ID do gerente e o salário no
Tabela MGR_HISTORY.
-Mostre todos os dados inseridos*/

insert all
when sal > 20000 then
  into special_sal values(empid, sal)
else
  into sales_history values(empid, hiredate, sal)
  into mgr_history values(empid, mgr, sal)
select employee_id empid, hire_date hiredate, salary sal, manager_id mgr
from employees
where employee_id < 125;

select * from special_sal;
select * from sales_history;
select * from mgr_history;


/* Exercício 03
Crie a tabela sales_week_data e insira somente um registro, faça um select para ver os dados e depois suas estrutura*/

CREATE TABLE sales_week_data(id number(6),
                            week_id number(2),
                            qty_mon number(8,2),
                            qty_tue number(8,2),
                            qty_wed number(8,2),
                            qty_thur number(8,2),
                            qty_fri number(8,2)
                            );
  insert into sales_week_data values (200,2,2050,220,1700,1200,3000);
  commit;
  
  delete from sales_week_data;
  commit;
  
  select * from sales_week_data;
  
/* Exercício 04
Escreva uma consulta para fazer o seguinte:
- Recupere detalhes como o ID do empregado, o ID da semana, a quantidade de vendas no
segunda-feira, quantidade de vendas na terça-feira, quantidade de vendas na quarta-feira, vendas
suantidade na quinta-feira, e quantidade de vendas na sexta-feira a partir do
tabela SALES_WEEK_DATA.
- Construa uma transformação de forma que cada registro seja recuperado da
a tabela SALES_WEEK_DATA é convertida em vários registros para o
tabela EMP_SALES_INFO.
Dica: use uma declaração INSERT giratória PIVOTING
- Mostre os resultados*/


insert all
   into emp_sales_info values (id, week_id, qty_mon)
   into emp_sales_info values (id, week_id, qty_tue)
   into emp_sales_info values (id, week_id, qty_wed)
   into emp_sales_info values (id, week_id, qty_thur)
   into emp_sales_info values (id, week_id, qty_fri)
select id, week_id, qty_mon, qty_tue, qty_wed, qty_thur, qty_fri from sales_week_data;

select * from sales_week_data;

-- 200	2	2050	220	1700	1200	3000

select * from emp_sales_info


/* Exercício 05 
Você tem os dados de funcionários passados armazenados em um arquivo plano chamado emp.data. Você
deseja armazenar os nomes e as IDs de e-mail de todos os funcionários passados e presentes em um
mesa. Para fazer isso, primeiro crie uma tabela externa chamada EMP_DATA usando o
arquivo fonte emp.dat no diretório emp_dir.  */

CREATE TABLE emp_data
(first_name VARCHAR2(20)   -- pedro,carvalho,contato@pedrofcarvalho.com.br
,last_name VARCHAR2(20)
, email VARCHAR2(30)
)
ORGANIZATION EXTERNAL
(
TYPE oracle_loader
DEFAULT DIRECTORY emp_dir
ACCESS PARAMETERS
(
RECORDS DELIMITED BY NEWLINE CHARACTERSET US7ASCII
NOBADFILE
NOLOGFILE
FIELDS
( first_name POSITION ( 1:20) CHAR
, last_name POSITION (22:41) CHAR
, email POSITION (43:72) CHAR )
)
LOCATION ('emp.dat') ) ;

/* Exercício 06
Aumente a coluna da tabela emp_hist para coluna email conter 45 caracteres */

desc emp_history;
create table emp_history as select * from employees;

select * from emp_history

desc emp_history

alter table emp_history modify email varchar(45);


/* Exercício 07
Crie uma tabela chamada employees_backup cópia da tabela employees.
Após isso delete e altere algumas informações da tabela employees.
Mescle  os dados na tabela employees  nos dados em employees_backup
Isto é atualize os dados da tabela employees para a tabela employees_backup utilizando MERGE
Verifique os dados após a criação */

create table employees_backup as select * from employees;

select * from employees_backup;

select * from employees;

delete from employees where employee_id = 199; -- 199	Douglas	Grant	DGRANT
commit

select * from employees;

update employees set salary = 1000 -- 102	Lex	De Haan	LDEHAAN	515.123.4569	13/01/93	AD_VP	17000
where employee_id = 102;

commit;

MERGE INTO employees_backup f USING employees h
ON (f.first_name = h.first_name
AND f.last_name = h.last_name)
WHEN MATCHED THEN
UPDATE SET f.salary = h.salary
WHEN NOT MATCHED THEN
INSERT (f.first_name
, f.last_name
, f.salary)
VALUES (h.first_name
, h.last_name
, h.salary);


select * from employees_backup;

/* Exercício 08
Crie a tabela EMP3 copia da tabela employees. 
Mude o departamento para Kochhar para 60 e comente sua mudança. Próximo,
Mude o departamento para Kochhar para 50 e comente sua mudança. Acompanhe a
mudança para Kochhar usando o recurso Versões de linha. */


create table emp3 as select * from employees;

UPDATE emp3 SET department_id = 60 -- 110
WHERE last_name = 'Popp';
COMMIT;
UPDATE emp3 SET department_id = 50
WHERE last_name = 'Popp';
COMMIT;

SELECT VERSIONS_STARTTIME "START_DATE", VERSIONS_ENDTIME "END_DATE", DEPARTMENT_ID
FROM EMP3
VERSIONS BETWEEN SCN MINVALUE AND MAXVALUE
WHERE LAST_NAME ='Popp';


-- Passos de estudos
-- 1 - Assistir esta video aula 1x
-- 2 - Assistir a video aula agora fazendo os scritps 1x
-- 5 - Realizar o simulado online
































