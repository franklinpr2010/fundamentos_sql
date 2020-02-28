------------------------------------------------------------------------------------------------------------------------------------------------------
--                                    Capitulo 03 - Laboratório - Sql Expert - Administrando View com Dicionário de Dados                           --
--                                               Treinamento para certificação Fundamentals SQL Oracle                                              --
--                                           Pedro F. Carvalho - DBA / Analista de Sistemas / Desenvolvedor                                         --
--                                         Site : www.pedrofcarvalho.com.br   E-mail : contato@pedrofcarvalho.com.br                                --
------------------------------------------------------------------------------------------------------------------------------------------------------

/* Exercício 01
Consulte as tabelas do dicionário de dados */

select * from user_tables; -- all_tables dba_tables

/* Exercício 02
Consulte as tabelas do dicionário de dados que você tem acesso*/

select * from all_tables;

/* Exercício 03
Crie um relatório que mostre as colunas, tipos de dados e tamanho e se são permitidos nulos ou não
Coloque para ser digitado o nome da tabela em prompt
E seus aliases DATA_PRECISION DATA_SCALE */

select column_name, data_type, data_length, data_precision PRECISION, data_scale SCALE, nullable
from user_tab_columns
where table_name = UPPER('&nome');

/* Exercício 04
Crie um relatório que mostre o nome da coluna, a constraint, o tipo de constraint, sua condição, e o status da tabela.
Você deve usar a user_constraints e user_cons_columns para obter essas informações.
O nome da tabela deve vir de um prompt*/

select ucc.column_name, uc.constraint_name, uc.constraint_type, uc.search_condition, uc.status
from user_constraints uc join user_cons_columns ucc
on uc.table_name = ucc.table_name
and uc.constraint_name = ucc.constraint_name
and uc.table_name = UPPER('&nome');


/* Exercício 05
Adicione um comentário para a tabela departments
Depois demonstre esse comentário
 */

comment on table departments is 'Tabela Departamentos';

select * from user_tab_comments
where table_name = 'DEPARTMENTS'

/* Exercício 06
Crie um sinonimo para a tabela empregados, chame de emp e depois faça busca por este
*/
create synonym emp for employees;
select * from user_synonyms

CREATE SYNONYM -- habilitar esse privilegio


/* Exercício 07
Crie uma tabela dept80 vindo da tabela employees, após isso crie uma view que mostre somente os primeiros 3 registros
Após isso verifique essa view em sua view administrativa*/

create table dept80 as select * from employees
create or replace view v_dept80 as select employee_id, first_name, last_name from dept80;
select * from user_views




/* Exercício 08
Busque os nomes das sequences em seu banco de dados, liste suas caracteristicas*/
select * from user_sequences;


/* Exercício 09
Confirme as tabelas dept2 e emp2 se estão armazenadas em nosso dicionario de dados*/

select * from user_tables


/* Exercício 10
Consulte no dicionário de dados o nomes e tipos de constraints para o esquema HR*/

select * from user_constraints

/* Exercício 11
Consulte no dicionário de dados os objetos do esquema HR*/

select * from user_objects

/* Exercício 12
Crie uma tabela sales_dept com um indice primary key ´para a coluna sales_pk_idx
Após isso consulte na view administrativa esse indice

Column Name         Team_Id         Location
Primary Key         Yes
Data Type           Number          VARCHAR2
Length              3               30
*/

create table sales_dept
(team_id number(3) primary key using index (create index sales_pk_idx on sales_dept(team_id)),
   location varchar(30));
   
select * from user_indexes;   



-- Passos de estudos
-- 1 - Assistir esta video aula 1x
-- 2 - Assistir a video aula agora fazendo os scritps 1x
-- 5 - Realizar o simulado online
































