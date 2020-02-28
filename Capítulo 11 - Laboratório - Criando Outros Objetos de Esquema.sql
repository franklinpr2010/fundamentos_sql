------------------------------------------------------------------------------------------------------------------------------------------------------
--                                             Capítulo 11 Laboratório Criando Outros Objetos de Esquema                                            --
--                                               Treinamento para certificação Fundamentals SQL Oracle                                              --
--                                           Pedro F. Carvalho - DBA / Analista de Sistemas / Desenvolvedor                                         --
--                                         Site : www.pedrofcarvalho.com.br   E-mail : contato@pedrofcarvalho.com.br                                --
------------------------------------------------------------------------------------------------------------------------------------------------------


/* Exercício 01
Crie uma view employees_vu baseado na tabela employees onde tenhamos o id, last_name, department_id
*/

create or replace view hr.employees_vu as
  select employee_id, last_name employee, department_id from hr.employees;

/* Exercício 02
Confirme os dados desta view
*/

select * from hr.employees_vu;

desc hr.employees_vu;


/* Exercício 03
Nesta view faça um select que traga os nomes e o id dos departamentos
*/

select employee, department_id
from hr.employees_vu


/* Exercício 04
Crie uma view chamdada detp50 com os ids, last_name, department_id e os cabeçalhos como EMPNO, EMPLOYEE e DEPTNO.
Para a segurança não permita que seja alterado dados do departamento 50
*/
drop view hr.dept50;
create or replace view hr.dept50 as
  select employee_id empno, last_name employee, department_id deptno
  from HR.EMPLOYEES
  where department_id = 50
  with check option constraint emp_dept_50;
  
/* Exercício 05
Mostre a estrutura desta view
*/

describe hr.dept50;

select * from hr.dept50

/* Exercício 06
Nesta view atualize o departamento 80 para o empregado MATOS
*/

update hr.dept50
set deptno = 80
where EMPLOYEE = 'Matos';

/* Exercício 07
Voce precisa criar uma sequence para ser usada em uma primary key da tabela dept
Essa sequencia deve iniciar no 200 e ter maximo de 1000
Seu incremento tem que ser de 10 em 10 e seu nome DEPT_ID_SEQ
*/
drop sequence hr.dept_id_seq;
create sequence hr.dept_id_seq
start with 900
increment by 10
maxvalue 1000;


/* Exercício 08
Teste sua sequencia inserindo dois dados
*/

desc hr.dept

insert into hr.dept values (hr.dept_id_seq.nextval, 'Educação');

insert into hr.dept values (hr.dept_id_seq.nextval, 'Administração');

select * from hr.dept

/* Exercício 09
Crie um índice para a coluna nome da tabela dept
*/

create index dept_name_idx on hr.dept(nome);


/* Exercício 10
Crie um sinonimo emp para a tabela dept
*/

create synonym de for hr.dept;

select * from de


-- Passos de estudos
-- 1 - Assistir a video aula somente observando 1x
-- 2 - Assistir a video aula agora fazendo os scritps 1x
-- 3 - Assistir a video aula de laboratório 1x
-- 4 - Assistir a video aula de laboratório fazendo os scritps 1x
-- 5 - Realizar o simulado online
       
-- Abraços e bons estudos !
       






