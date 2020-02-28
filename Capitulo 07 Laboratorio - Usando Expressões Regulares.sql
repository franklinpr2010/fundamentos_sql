------------------------------------------------------------------------------------------------------------------------------------------------------
--                                     Capitulo 07 - Laboratório - Sql Expert - Usando Expressões Regulares                                         --
--                                               Treinamento para certificação Fundamentals SQL Oracle                                              --
--                                           Pedro F. Carvalho - DBA / Analista de Sistemas / Desenvolvedor                                         --
--                                         Site : www.pedrofcarvalho.com.br   E-mail : contato@pedrofcarvalho.com.br                                --
------------------------------------------------------------------------------------------------------------------------------------------------------

/* Exercício 01
Escreva uma consulta para pesquisar a tabela de EMPREGADOS para todos os funcionários cujo primeiro
os nomes começam com "Ki" ou "Ko".*/

select first_name, last_name
from employees
where regexp_like (last_name, '^K(i|o).');

select first_name, last_name
from employees
where last_name like 'Ki%' or last_name like 'Ko%';


/* Exercício 02
Crie uma consulta que remova os espaços na coluna STREET_ADDRESS do
Tabela LOCATIONS na tela. Use "Endereço de rua" como o título da coluna.*/

select regexp_replace(street_address, ' ', '') as "Street Addreee", street_address "Com espaços em Branco"
from locations;


/* Exercício 03
Crie uma consulta que exiba "St" substituído por "Street" no STREET_ADDRESS
coluna da tabela LOCATIONS. Tenha cuidado para que você não afeta nenhuma linha que
já tem "Rua" neles. Exibir apenas as linhas, que são afetadas. */

select regexp_replace(street_address, 'St$', 'Street'), street_address
from locations
where regexp_like(street_address, 'St');


/* Exercício 04
Crie uma tabela de contatos e adicione uma restrição de verificação à coluna p_number para
imponha a seguinte máscara de formato para garantir que os números de telefone sejam inseridos em
o banco de dados no seguinte formato padrão: (XXX) XXX-XXXX. A mesa
deve ter as seguintes colunas:
• l_name varchar2 (30)
• p_number varchar2 (30) */

create table contacts
(
  l_name varchar2(30),
  p_number varchar2(30) constraint p_number_formant check (regexp_like (p_number, '^\(\d{3}\) \d{3}-\d{4}$'))
);

insert into contacts values ('PEDRO', '(017)380-5544');
insert into contacts values ('PEDRO', '0173805544');
insert into contacts values ('PEDRO', '(017) 380-5544');

select * from contacts;


/* Exercício 05
Escreva uma consulta para encontrar o número de ocorrências do padrão de DNA ctc no
string Gtctcgtctcgttctgtctgtcgttctg. Use o apelido Count_DNA. Ignorar
sensibilidade a maiúsculas e minúsculas. */

select regexp_count('gtctcgtctcgttctgtctgtcgttctg','ctc') as count_dna
from dual;

https://docs.oracle.com/cd/E11882_01/appdev.112/e41502/adfns_regexp.htm#ADFNS235


-- Passos de estudos
-- 1 - Assistir esta video aula 1x
-- 2 - Assistir a video aula agora fazendo os scritps 1x
-- 5 - Realizar o simulado online
































