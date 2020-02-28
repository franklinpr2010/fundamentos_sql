------------------------------------------------------------------------------------------------------------------------------------------------------
--                                     Capitulo 07 - Laborat�rio - Sql Expert - Usando Express�es Regulares                                         --
--                                               Treinamento para certifica��o Fundamentals SQL Oracle                                              --
--                                           Pedro F. Carvalho - DBA / Analista de Sistemas / Desenvolvedor                                         --
--                                         Site : www.pedrofcarvalho.com.br   E-mail : contato@pedrofcarvalho.com.br                                --
------------------------------------------------------------------------------------------------------------------------------------------------------

/* Exerc�cio 01
Escreva uma consulta para pesquisar a tabela de EMPREGADOS para todos os funcion�rios cujo primeiro
os nomes come�am com "Ki" ou "Ko".*/

select first_name, last_name
from employees
where regexp_like (last_name, '^K(i|o).');

select first_name, last_name
from employees
where last_name like 'Ki%' or last_name like 'Ko%';


/* Exerc�cio 02
Crie uma consulta que remova os espa�os na coluna STREET_ADDRESS do
Tabela LOCATIONS na tela. Use "Endere�o de rua" como o t�tulo da coluna.*/

select regexp_replace(street_address, ' ', '') as "Street Addreee", street_address "Com espa�os em Branco"
from locations;


/* Exerc�cio 03
Crie uma consulta que exiba "St" substitu�do por "Street" no STREET_ADDRESS
coluna da tabela LOCATIONS. Tenha cuidado para que voc� n�o afeta nenhuma linha que
j� tem "Rua" neles. Exibir apenas as linhas, que s�o afetadas. */

select regexp_replace(street_address, 'St$', 'Street'), street_address
from locations
where regexp_like(street_address, 'St');


/* Exerc�cio 04
Crie uma tabela de contatos e adicione uma restri��o de verifica��o � coluna p_number para
imponha a seguinte m�scara de formato para garantir que os n�meros de telefone sejam inseridos em
o banco de dados no seguinte formato padr�o: (XXX) XXX-XXXX. A mesa
deve ter as seguintes colunas:
� l_name varchar2 (30)
� p_number varchar2 (30) */

create table contacts
(
  l_name varchar2(30),
  p_number varchar2(30) constraint p_number_formant check (regexp_like (p_number, '^\(\d{3}\) \d{3}-\d{4}$'))
);

insert into contacts values ('PEDRO', '(017)380-5544');
insert into contacts values ('PEDRO', '0173805544');
insert into contacts values ('PEDRO', '(017) 380-5544');

select * from contacts;


/* Exerc�cio 05
Escreva uma consulta para encontrar o n�mero de ocorr�ncias do padr�o de DNA ctc no
string Gtctcgtctcgttctgtctgtcgttctg. Use o apelido Count_DNA. Ignorar
sensibilidade a mai�sculas e min�sculas. */

select regexp_count('gtctcgtctcgttctgtctgtcgttctg','ctc') as count_dna
from dual;

https://docs.oracle.com/cd/E11882_01/appdev.112/e41502/adfns_regexp.htm#ADFNS235


-- Passos de estudos
-- 1 - Assistir esta video aula 1x
-- 2 - Assistir a video aula agora fazendo os scritps 1x
-- 5 - Realizar o simulado online
































