
       
/* Exercício 01
Crie uma tabela DEPT2 baseado na tabela abaixo. E depois verifique sua estrutura.

Column Name           ID          NAME
Key Type
Nulls/Unique
FK Table
FK Column
Data type             NUMBER      VARCHAR2
Length                7           25
*/
drop table dept2;
create table dept2( id number(7), nome varchar(25));
desc dept2;


/* Exercício 02
Popule esta tabela com dados da tabela departments com as colunas que você desejar */

insert into dept2
  select department_id, department_name
  from departments;
  
  select * from dept2

/* Exercício 03
Crie a tabela EMP2 baseado na tabela abaixo e depois verifique sua estrutura 
Column Name       ID              LAST_NAME          FIRST_NAME           DEPT_ID
Key Type
Nulls/Unique
FK Table
FK Column
Data type         NUMBER          VARCHAR2            VARCHAR2              NUMBER
Length            7               25                   25                    7   */

create table emp2 ( id number(7), last_name varchar(25), first_name varchar(25), dept_id number(7));
describe emp2;

/* Exercício 04
Modifique a tabela EMP2 para aumentar para 50 o numero de caracteres do last_name  */

alter table emp2
  modify (last_name varchar(50));
  
  desc emp2;
  

/* Exercício 05
Crie uma tabela employees2 baseado na estrutura da tabela employees, incluindo EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY, e
DEPARTMENT_ID.
O nome dos cabeçalhos dever ser ID, FIRST_NAME, LAST_NAME, SALARY, and DEPT_ID, respectivamente*/

drop table employees2;
create table employees2 as
  select employee_id id, first_name, last_name, salary, department_id dept_id
  from employees;
  
select * from employees2;  
  
/* Exercício 06
Apague a tabela EMP2 */

drop table emp2;

/* Exercício 7
Consulte a tabela apagada na recycle bin */

select * from recyclebin;

select original_name, operation, droptime from recyclebin
where original_name = 'EMP2';

/* Exercício 8
Recupere esta tabela antes do drop */

flashback table EMP2 TO BEFORE DROP;

select original_name, operation, droptime from recyclebin
where original_name = 'EMP2';

select * from emp2;

/* Exercício 9
Drop first_name da tabela employees2 e depois confirme esta modificação*/

alter table employees2
drop column first_name;

desc employees2;


/* Exercício 10
Na tabela employees2 marque a coluna dept_id como unused, depois confirme esta modificação*/

alter table employees2
set unused (dept_id);

desc employees2;



/* Exercício 11
Apague todas as colunas com unused da tabela employees2 e depois confirme esta modificação*/
alter table employees2
drop unused columns;

desc employees2;

/* Exercício 12
Adicione uma primary key na tabela emp2 na coluna id.  Coloque o nome de my_emp_id_pk*/

describe emp2;
alter table emp2
add constraint my_emp_id_pk primary key (id);


/* Exercício 13
Crie uma primary key na tabela dept2 na coluna id com o nome my_dept_id_pk*/
alter table dept2
add constraint my_dept_id_pk primary key (id);
desc dept2;


/* Exercício 14
Adicione uma foreign key na tabela emp2 vindo ta tabela dept2 relacionando id e dept_id*/
alter table emp2
add constraint my_emp_dept_id_fk foreign key (dept_id) references dept2(id);


/* Exercício 15
Modifique a tabela emp2 adicionr a coluna comissão para numero com precisao de 2 scala 2.
Adicione uma constraint na coluna comissao onde os valores tem que ser maior que 0*/

alter table emp2
add commission number(2,2)
constraint my_emp_comm_ck check (commission > 0);

desc emp2


/* Exercício 16
Apague a tabela emp2 e dept2 com o comando purge e depois verifique na reciclebin*/

purge não consegue recuperar com flashback

drop table emp2 purge;
drop table dept2 purge;

select original_name, operation, droptime from recyclebin
where original_name = 'DEPT2';


/* Exercício 17
Crie uma tabela baseada na tabela abaixo e um indice de primary key colocando o nome de DEPT_PK_IDX

Column Name       Deptno      Dname
Primary Key       Yes
Data Type         Number       VARCHAR2
Length            4             30*/

create table dept_named_index
 (deptno number(4) primary key using index (create index dept_pk_idx on dept_named_index(deptno)),
         dname varchar2(30));

desc dept_named_index 

/* Exercício 18
Crie uma tabela externa library_items_ext usando oracle loader e depois faça um select para verificar os dados externos*/

CREATE TABLE library_items_ext ( category_id number(12)
, book_id number(6)
, book_price number(8,2)
, quantity number(8)
)
ORGANIZATION EXTERNAL
(TYPE ORACLE_LOADER
DEFAULT DIRECTORY emp_dir /* Direciona para um diretório especifico os dados */
ACCESS PARAMETERS (RECORDS DELIMITED BY NEWLINE /* Os dados vão ser cadastrados por linha */
FIELDS TERMINATED BY ',')
LOCATION ('library_items.dat') /* Adiciona nesse arquivo */
)
REJECT LIMIT UNLIMITED; /* se colocar 300, não pode cadastrar mais que 300 registros */



/* Exercício 19
Crie uma tabela usando o oracle data pump para popular a tabela interna dept_add_ext vindo de 2 arquivos externos*/
CREATE TABLE dept_add_ext (location_id,
street_address, city,
state_province,
country_name)
ORGANIZATION EXTERNAL(
TYPE ORACLE_DATAPUMP
DEFAULT DIRECTORY emp_dir
LOCATION ('oraxx_emp4.exp','oraxx_emp5.exp'))
PARALLEL
AS
SELECT location_id, street_address, city, state_province,
country_name
FROM locations
NATURAL JOIN countries;

/* Exercício 20
Crie uma tabela emp_books e popule com alguns dados e acrescente uma constraint DEFERRED, delete a constraint, adicione uma
primary key deferrable e depois a altere para deferred, insira mais 3 registros e commite a transação*/

create table emp_books (book_id number, title varchar2(20), constraint emp_books_pk primary key (book_id));
desc emp_books;

insert into emp_books values (300, 'Organização');
insert into emp_books values (300, 'Histórico'); -- erro de constraint
delete * from emp_books

--Não permite dados duplicados
set constraint emp_books_pk deferred;

alter table emp_books drop constraint emp_books_pk

--Permite dados duplicados
alter table emp_books add (constraint emp_books_pk primary key(book_id) deferrable);

select * from emp_books
delete from emp_books
commit;

insert into emp_books values (300, 'Organização');
insert into emp_books values (300, 'Histórico'); -- erro de constraint

set constraint emp_books_pk deferred;

commit;































