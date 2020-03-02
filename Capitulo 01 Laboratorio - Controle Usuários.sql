------------------------------------------------------------------------------------------------------------------------------------------------------
--                                          Capitulo 01 - Laboratório - Sql Expert - Controlando Usuários                                           --
--                                               Treinamento para certificação Fundamentals SQL Oracle                                              --
--                                           Pedro F. Carvalho - DBA / Analista de Sistemas / Desenvolvedor                                         --
--                                         Site : www.pedrofcarvalho.com.br   E-mail : contato@pedrofcarvalho.com.br                                --
------------------------------------------------------------------------------------------------------------------------------------------------------

/* Exercício 01
Qual o privilégio para se logar no Oracle Server? É um privilégio de Sistema ou de Objeto
*/

CREATE SESSION -- privilégio de sistema

/* Exercício 02
Qual o privilégio que voce deve ter para criar uma tabela ?
*/

CREATE TABLE -- privilégio de sistema


/* Exercício 03
Se você quer criar uma tabela e quer passar esse privilégio as demais pessoas qual o comando utilizado ?
*/

with grant option
grant select on hr.departments to USUARIO with grant option


/* Exercício 04
Você é um DBA e criou alguns usuários com o mesmo privilégio.
O que é usado para economizar neste seu trabalho ?
*/

-- privilégios de sistema ou objeto X 24 
-- ROLE agrupamento de privilégios para você desinar a um usuário


/* Exercício 05
Qual o comando para alterar sua senha ?
*/

alter user pedro identified by 12345678 immediate;
-- eliminar o erro de senha expirada


/* Exercício 06
O user21 é proprietário da tabela EMP e designa privilégio de delete ao User22 usando WITH GRANT OPTION.
User22 designa delete para o user23 na tabela EMP. User21 retira esse privilégio do user22.
Quem pode deletar dados da tabela EMP
*/

user21 -> delete emp para p usuario user22 with grant option
user22 -> libera esse mesmo privilégio para o user23
user21 -> retira privilegio do user22; -- automaticamente vão perder esse acesso

user21

/* Exercício 07
Voce quer designar privilegio de update para o usuario scoot na tabela departments.
Voce quer permitir que o usuario scott de esses mesmo privilégios a outro usuários. 
Qual o comando que você emite ?
*/

grant update on departments to scott with grant option;


/* Exercício 08
Crie 3 usuários A1 A2 e A3 e de permissão de connect e create session
Crie uma tabela com o usuario A1 e de permissão nela para o usuário A2 dar select e para que ele possa dar essa mesma permissão a outros
Tente dar select com o usuário A3 nesta tabela.
Conectado com o usuario A2 de permissão de insert na tabela para o usuario A3
Conectado com o usuario A2 de permissão de select na tabela para o usuario A3
conectado com o usuario A1 revogue o privilégio do usuario A2 na tabela.
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




/* Exercício 09
Com o usuário A1 crie outra tabela e de permissão de select, insert e update para o A2
*/


/* Exercício 10
Revogue os mesmos privilégios do exercício 09
*/
revoke select on a1teste from a2;


/* Exercício 11
Com usuário HR de permissão de consulta e insert na tabela departments para o usuário a1 e a2
*/

grant select, insert on hr.departments to a1;

/* Exercício 12
Revoke os privilegios do exercício 11
*/

revoke select, insert on hr.departments from a1;


       






