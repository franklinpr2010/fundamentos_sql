------------------------------------------------------------------------------------------------------------------------------------------------------
--                                                    Cap�tulo 09 Laborat�rio Manipulando Dados                                                     --
--                                               Treinamento para certifica��o Fundamentals SQL Oracle                                              --
--                                           Pedro F. Carvalho - DBA / Analista de Sistemas / Desenvolvedor                                         --
--                                         Site : www.pedrofcarvalho.com.br   E-mail : contato@pedrofcarvalho.com.br                                --
------------------------------------------------------------------------------------------------------------------------------------------------------


/* Exerc�cio 01
Crie uma tabela my_employee como c�pia da tabela employees, acrescente uma coluna USERID varchar(10) e depois delete todos os dados
 */
 drop table my_employee;
 create table my_employee as select * from employees;
 select * from my_employee;
 delete from my_employee;
 commit;
 --
 alter table my_employee add userid varchar(10);
 
/* Exerc�cio 02
Insira os seguintes registros nas colunas
ID  LAST_NAME   FIRST_NAME        USERID        SALARY
1   Patel       Ralph             rpatel        895
2   Dancs       Betty             bdancs        860
3   Biri        Ben               bbiri         1100
4   Newman      Chad              cnewman       750
5   Ropeburn    Audrey            aropebur      1550
*/

insert into my_employee (employee_id, last_name, first_name, userid, salary) values (1, 'Patel', 'Ralph', 'rpatel', 895);
insert into my_employee (employee_id, last_name, first_name, userid, salary) values (2, 'Dancs', 'Betty', 'bdancs', 860);
insert into my_employee (employee_id, last_name, first_name, userid, salary) values (3, 'Biri', 'Ben', 'bbiri', 1100);
insert into my_employee (employee_id, last_name, first_name, userid, salary) values (4, 'Newman', 'Chad', 'cnewman', 750);
insert into my_employee (employee_id, last_name, first_name, userid, salary) values (5, 'Ropeburn', 'Audrey', 'aropebur', 1550);
commit;


/* Exerc�cio 03
Insira mais 2 registros com vari�veis de substitui��o
*/

insert into my_employee (employee_id, last_name, first_name, userid, salary) values (&id, '&last', '&fisrt', '&apelido', &salario);
commit;


/* Exerc�cio 04
Insira mais 2 registros com vari�veis de substitui��o
*/

insert into my_employee (employee_id, last_name, first_name, userid, salary) values (&id, '&last', '&fisrt', '&apelido', &salario);
commit;

select * from my_employee

/* Exerc�cio 05
Mude o last_name do id 3 para Drexeler
*/

select * from my_employee
where employee_id = 3;

update my_employee set last_name = 'Drexeler'
where employee_id = 3;
commit;

select * from my_employee
where employee_id = 3;

/* Exerc�cio 06
Mude o sal�rio dos empregados que ganham menos de 900 para 1000
*/

select * from my_employee;
update my_employee set salary = 1000
where salary < 900;
commit;
select * from my_employee;

rollback


/* Exerc�cio 07
Delete o empregado com o last_name Dancs
*/

delete my_employee 
where last_name = 'Dancs';
commit;

select * from my_employee

/* Exerc�cio 08
Insira mais um empregado na tabela
Crie um SavePoint
Delete todos os registros da tabela
Fa�a um rollback at� o SavePoint
Selecione todos os registros
Finalize a transa��o
*/

insert into my_employee (employee_id, last_name, first_name, userid, salary) values (&id, '&last', '&fisrt', '&apelido', &salario);
select * from my_employee;

savepoint insert_1;

delete from my_employee;
select * from my_employee;

rollback to insert_1;

select * from my_employee;

commit;



/* Exerc�cio 09
Insira mais um registro na tabela usando variaveis de substitui��o.
O id � numero
O last_name e first_name pode ser o mesmo nome.
O userid ser� a primeira letra do first_name concatenado com a posi��o 1 a 7 do last_name.
O salario a desejar
*/

insert into my_employee (employee_id, last_name, first_name, userid, salary)
values (&p_id, '&&p_last_name', '&&p_first_name',
        lower(substr('&p_first_name', 1, 1) ||
        substr('&p_last_name', 1, 7)), &p_salary);
commit;

select * from my_employee


-- Passos de estudos
-- 1 - Assistir a video aula somente observando 1x
-- 2 - Assistir a video aula agora fazendo os scritps 1x
-- 3 - Assistir a video aula de laborat�rio 1x
-- 4 - Assistir a video aula de laborat�rio fazendo os scritps 1x
-- 5 - Realizar o simulado online
       
-- Abra�os e bons estudos !
       






