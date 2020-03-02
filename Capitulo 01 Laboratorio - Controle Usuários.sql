------------------------------------------------------------------------------------------------------------------------------------------------------
--                                          Capitulo 01 - Laborat�rio - Sql Expert - Controlando Usu�rios                                           --
--                                               Treinamento para certifica��o Fundamentals SQL Oracle                                              --
--                                           Pedro F. Carvalho - DBA / Analista de Sistemas / Desenvolvedor                                         --
--                                         Site : www.pedrofcarvalho.com.br   E-mail : contato@pedrofcarvalho.com.br                                --
------------------------------------------------------------------------------------------------------------------------------------------------------

/* Exerc�cio 01
Qual o privil�gio para se logar no Oracle Server? � um privil�gio de Sistema ou de Objeto
*/

CREATE SESSION -- privil�gio de sistema

/* Exerc�cio 02
Qual o privil�gio que voce deve ter para criar uma tabela ?
*/

CREATE TABLE -- privil�gio de sistema


/* Exerc�cio 03
Se voc� quer criar uma tabela e quer passar esse privil�gio as demais pessoas qual o comando utilizado ?
*/

with grant option
grant select on hr.departments to USUARIO with grant option


/* Exerc�cio 04
Voc� � um DBA e criou alguns usu�rios com o mesmo privil�gio.
O que � usado para economizar neste seu trabalho ?
*/

-- privil�gios de sistema ou objeto X 24 
-- ROLE agrupamento de privil�gios para voc� desinar a um usu�rio


/* Exerc�cio 05
Qual o comando para alterar sua senha ?
*/

alter user pedro identified by 12345678 immediate;
-- eliminar o erro de senha expirada


/* Exerc�cio 06
O user21 � propriet�rio da tabela EMP e designa privil�gio de delete ao User22 usando WITH GRANT OPTION.
User22 designa delete para o user23 na tabela EMP. User21 retira esse privil�gio do user22.
Quem pode deletar dados da tabela EMP
*/

user21 -> delete emp para p usuario user22 with grant option
user22 -> libera esse mesmo privil�gio para o user23
user21 -> retira privilegio do user22; -- automaticamente v�o perder esse acesso

user21

/* Exerc�cio 07
Voce quer designar privilegio de update para o usuario scoot na tabela departments.
Voce quer permitir que o usuario scott de esses mesmo privil�gios a outro usu�rios. 
Qual o comando que voc� emite ?
*/

grant update on departments to scott with grant option;


/* Exerc�cio 08
Crie 3 usu�rios A1 A2 e A3 e de permiss�o de connect e create session
Crie uma tabela com o usuario A1 e de permiss�o nela para o usu�rio A2 dar select e para que ele possa dar essa mesma permiss�o a outros
Tente dar select com o usu�rio A3 nesta tabela.
Conectado com o usuario A2 de permiss�o de insert na tabela para o usuario A3
Conectado com o usuario A2 de permiss�o de select na tabela para o usuario A3
conectado com o usuario A1 revogue o privil�gio do usuario A2 na tabela.
*/

create user a1 identified by 12345678;
create user a2 identified by 12345678;
create user a3 identified by 12345678;

grant connect to a1;
grant connect to a2;
grant connect to a3;

grant create session to a1;
grant create session to a2;
grant create session to a3;

grant create table to a1;

drop user a1;
drop user a2;
drop user a3;




/* Exerc�cio 09
Com o usu�rio A1 crie outra tabela e de permiss�o de select, insert e update para o A2
*/


/* Exerc�cio 10
Revogue os mesmos privil�gios do exerc�cio 09
*/
revoke select on a1teste from a2;


/* Exerc�cio 11
Com usu�rio HR de permiss�o de consulta e insert na tabela departments para o usu�rio a1 e a2
*/

grant select, insert on hr.departments to a1;

/* Exerc�cio 12
Revoke os privilegios do exerc�cio 11
*/

revoke select, insert on hr.departments from a1;


       






