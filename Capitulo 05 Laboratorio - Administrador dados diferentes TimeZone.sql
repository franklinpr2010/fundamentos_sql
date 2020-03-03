------------------------------------------------------------------------------------------------------------------------------------------------------
--                                    Capitulo 05 - Laborat�rio - Sql Expert - Administrando dados em diferentes TimeZone                           --
--                                               Treinamento para certifica��o Fundamentals SQL Oracle                                              --
--                                           Pedro F. Carvalho - DBA / Analista de Sistemas / Desenvolvedor                                         --
--                                         Site : www.pedrofcarvalho.com.br   E-mail : contato@pedrofcarvalho.com.br                                --
------------------------------------------------------------------------------------------------------------------------------------------------------

/* Exerc�cio 01
Altere a sess�o da vari�vel NLS_DATE_FORMAT para DD-MON-YYYY HH24:MI:SS.
*/
select sysdate from dual;
alter session set nls+date_format = 'DD-MON-YYY HH24:MI:SS'
select sysdate from dual;



/* Exerc�cio 02
Escreva consultas que mostrem o timezone offsets tz_offset para os seguintes time zones : US/Pacific-New, Singapore, e Egypt.
Altere a sess�o time_zone para a US/Pacific-New
Mostre os campos CURRENT_DATE, CURRENT_TIMESTAMP, e LOCALTIMESTAMP para sua sess�o.
Altere o time_zone da sess�o para singapura
Mostre os campos CURRENT_DATE, CURRENT_TIMESTAMP, e LOCALTIMESTAMP para sua sess�o.
*/
select tz_offset('US/Pacific-New') from dual; -- -07:00
select tz_offset('Singapore') from dual; -- +08:00
select tz_offset('Egypt') from dual;

/*alterando para pacific*/
alter session set time_zone = '-7:00'


select current_date, current_timestamp, localtimestamp from dual;



/* Exerc�cio 03
Mostre o dbtimezone e sessiontimezone
*/

select dbtimezone, sessiontimezone from dual; ---02:00 +08:00

/* Exerc�cio 04
Escreva uma consulta para extrair o ano da coluna hire_date da tabela employees para o departamento 80*/

select last_name, extract(year from hire_date) from employees where department_id = 80;
select last_name, to_char(hire_date, 'YYYY') from employees where department_id = 80;


/* Exerc�cio 05
Altere a sess�o do nls_date_format para DD-MON-YYYY
*/

alter session set nls_date_format = 'DD-MON-YYYY'

/* Exerc�cio 06
Crie a tabela samples_date, e insira alguns registros
Altere a coluna 1 colluna data para timestamp
Modifique esta coluna para timestamp with time zone
*/

create table sample_dates
( d1, DATE,
d2 DATE
);

insert into sample_dates (d1, d2) values (to_date('01-Mar-2013 12:35:59', 'DD-Mon-YYYY HH24:MI:SS'), 
to_date('01-Mar-2013 18:35:59', 'DD-Mon-YYYY HH24:MI:SS'))


/* Exerc�cio 07
Altere a sess�o do nls_date_format para DD-MON-YYYY
*/


select e.last_name
	( case extract(year from e.hire_date)
		where 1998 "Precisa de revis�o"
		else "N�o precisa" as "Revis�o"
from employees e
order by e.hire_date

alter table sample_dates modify d1 timestamp;

/* Exerc�cio 07
Crie uma consulta para imprimir os sobrenomes e o n�mero de anos de servi�o para cada um
empregado. Se o empregado tiver trabalhado cinco ou mais anos, imprima 5 anos de
servi�o. Se o empregado tiver empregado 10 ou mais anos, imprima 10 anos
de servi�o. Se o empregado tiver trabalhado 15 ou mais anos, imprima 15 anos
de servi�o. Se nenhuma dessas condi��es corresponderem, imprima talvez no pr�ximo ano! Ordenar
os resultados pela coluna HIRE_DATE. Use a tabela de EMPREGADOS.
Dica: Use as express�es CASE e TO_YMINTERVAL. */

SELECT E.LAST_NAME, HIRE_DATE, SYSDATE,
(CASE WHEN (SYSDATE - TO_YMINTERVAL('15-0'))>= HIRE_DATE THEN '15 YEARS OF SERVICE'
      WHEN (SYSDATE - TO_YMINTERVAL('10-0'))>= HIRE_DATE THEN '10 YEARS OF SERVICE'
      WHEN (SYSDATE - TO_YMINTERVAL('5-0'))>= HIRE_DATE THEN '5 YEARS OF SERVICE'
      ELSE 'MAYBE NEXT YEAR!'
      END) AS 'AWARDS'
FROM EMPLOYEES E;




































