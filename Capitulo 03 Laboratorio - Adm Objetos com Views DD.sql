------------------------------------------------------------------------------------------------------------------------------------------------------
--                                    Capitulo 03 - Laborat�rio - Sql Expert - Administrando View com Dicion�rio de Dados                           --
--                                               Treinamento para certifica��o Fundamentals SQL Oracle                                              --
--                                           Pedro F. Carvalho - DBA / Analista de Sistemas / Desenvolvedor                                         --
--                                         Site : www.pedrofcarvalho.com.br   E-mail : contato@pedrofcarvalho.com.br                                --
------------------------------------------------------------------------------------------------------------------------------------------------------

/* Exerc�cio 01
Consulte as tabelas do dicion�rio de dados */

select * from user_tables; -- all_tables dba_tables

/* Exerc�cio 02
Consulte as tabelas do dicion�rio de dados que voc� tem acesso*/

select * from all_tables;

/* Exerc�cio 03
Crie um relat�rio que mostre as colunas, tipos de dados e tamanho e se s�o permitidos nulos ou n�o
Coloque para ser digitado o nome da tabela em prompt
E seus aliases DATA_PRECISION DATA_SCALE */

select column_name, data_type, data_length, data_precision PRECISION, data_scale SCALE, nullable
from user_tab_columns
where table_name = UPPER('&nome');

/* Exerc�cio 04
Crie um relat�rio que mostre o nome da coluna, a constraint, o tipo de constraint, sua condi��o, e o status da tabela.
Voc� deve usar a user_constraints e user_cons_columns para obter essas informa��es.
O nome da tabela deve vir de um prompt*/

select ucc.column_name, uc.constraint_name, uc.constraint_type, uc.search_condition, uc.status
from user_constraints uc join user_cons_columns ucc
on uc.table_name = ucc.table_name
and uc.constraint_name = ucc.constraint_name
and uc.table_name = UPPER('&nome');


/* Exerc�cio 05
Adicione um coment�rio para a tabela departments
Depois demonstre esse coment�rio
 */

comment on table departments is 'Tabela Departamentos';

select * from user_tab_comments
where table_name = 'DEPARTMENTS'

/* Exerc�cio 06
Crie um sinonimo para a tabela empregados, chame de emp e depois fa�a busca por este
*/
create synonym emp for employees;
select * from user_synonyms

CREATE SYNONYM -- habilitar esse privilegio


/* Exerc�cio 07
Crie uma tabela dept80 vindo da tabela employees, ap�s isso crie uma view que mostre somente os primeiros 3 registros
Ap�s isso verifique essa view em sua view administrativa*/

create table dept80 as select * from employees
create or replace view v_dept80 as select employee_id, first_name, last_name from dept80;
select * from user_views




/* Exerc�cio 08
Busque os nomes das sequences em seu banco de dados, liste suas caracteristicas*/
select * from user_sequences;


/* Exerc�cio 09
Confirme as tabelas dept2 e emp2 se est�o armazenadas em nosso dicionario de dados*/

select * from user_tables


/* Exerc�cio 10
Consulte no dicion�rio de dados o nomes e tipos de constraints para o esquema HR*/

select * from user_constraints

/* Exerc�cio 11
Consulte no dicion�rio de dados os objetos do esquema HR*/

select * from user_objects

/* Exerc�cio 12
Crie uma tabela sales_dept com um indice primary key �para a coluna sales_pk_idx
Ap�s isso consulte na view administrativa esse indice

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
































