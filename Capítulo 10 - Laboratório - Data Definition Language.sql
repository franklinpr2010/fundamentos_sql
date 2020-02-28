------------------------------------------------------------------------------------------------------------------------------------------------------
--                                                    Capítulo 10 Laboratório Data Definition Language                                              --
--                                               Treinamento para certificação Fundamentals SQL Oracle                                              --
--                                           Pedro F. Carvalho - DBA / Analista de Sistemas / Desenvolvedor                                         --
--                                         Site : www.pedrofcarvalho.com.br   E-mail : contato@pedrofcarvalho.com.br                                --
------------------------------------------------------------------------------------------------------------------------------------------------------


/* Exercício 01
Crie uma tabela DEPT baseada na tabela abaixo

Column Name       ID          NAME
Key Type          Primary key
Nulls/Unique
FK Table
FK Column
Data type         NUMBER      VARCHAR2
Length            7           25

após isso confirme a estrutura da tabela
*/
drop table hr.dept;
create table hr.dept (id number(7) constraint department_id_pk PRIMARY KEY, nome VARCHAR2(25));

desc hr.dept;
describe hr.dept;


/* Exercício 02
Popule a tabela criada acima com os dados da tabela departments
*/

select * from hr.departments
select * from hr.dept

insert into hr.dept
  select department_id, department_name
  from hr.departments;
  
select * from hr.dept
  

/* Exercício 03
Crie uma tabela DEPT2 baseada na tabela abaixo

Column Name         ID        LAST_NAME           FIRST_NAME          DEPT_ID
Key Type
Nulls/Unique
FK Table                                                              DEPT
FK Column                                                             ID
Data type           NUMBER    VARCHAR2            VARCHAR2            NUMBER
Length              7         25                  25                  7

após isso confirme a estrutura da tabela
*/

create table hr.dept2
  ( id number(7),
    last_name varchar2(25),
    first_name varchar2(25),
    dept2_id number(7) constraint emp_dept2_id_fk references hr.dept (id));
       
drop table hr.dep2

desc hr.dept2;

/* Exercício 04
Crie uma tabela employees2 baseado na tabela employyes. Incluir somente o employee_id, first_name, last_name, salary e department_id
Os nomes das colunas devem ser ID, FIRST_NAME, LAST_NAME, SALARY, e DEPT_ID, respectivamente. */

drop table hr.employees2

create table hr.employees2 as
  select  employee_id id,
          first_name,
          last_name,
          salary,
          department_id detp_id
  from hr.employees
  

/* Exercício 05
Altere a tabela criada acima para somente leitura */

alter table hr.employees2 read only;

/* Exercício 06
Insira os valores na tabela employye2

ID        FIRST_NAME        LAST_NAME         SALARY          DEPT_ID
34        Grant             Marcie            5678            10
*/

insert into hr.employees2 values (34, 'Grant', 'Marcie', 5678, 10);

/* Exercício 07

Reverta a tabela employee2 para escrita e gravação e tente inserir novamente os dados abaixo 

ID        FIRST_NAME        LAST_NAME         SALARY          DEPT_ID
34        Grant             Marcie            5678            10 */

alter table hr.employees2 read write;

insert into hr.employees2 values (34, 'Grant', 'Marcie', 5678, 10);


/* Exercício 08
Drope a tabela employees2

*/

Drop table hr.employees2;


-- TABELAS QUE ESTÃO EM MODO SOMENTE LEITURA
select * from dba_tables
where owner = 'HR'


-- Passos de estudos
-- 1 - Assistir a video aula somente observando 1x
-- 2 - Assistir a video aula agora fazendo os scritps 1x
-- 3 - Assistir a video aula de laboratório 1x
-- 4 - Assistir a video aula de laboratório fazendo os scritps 1x
-- 5 - Realizar o simulado online
       
-- Abraços e bons estudos !
       






