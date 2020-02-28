------------------------------------------------------------------------------------------------------------------------------------------------------
--                                            ESTUDO DE CASO PARA CERTIFICAÇÃO SQL FUNDAMENTOS E SQL EXPERT                                         --
--                                           Pedro F. Carvalho - DBA / Analista de Sistemas / Desenvolvedor                                         --
--                                         Site : www.pedrofcarvalho.com.br   E-mail : contato@pedrofcarvalho.com.br                                --
------------------------------------------------------------------------------------------------------------------------------------------------------

/* Exercício 01
Crie todas as tabelas baseada na imagem do DER  nas imagens respectivamente de suas tabelas*/

-- MEMBER -- grava os clientes

create table member 
(   member_id number(10) constraint member_member_id_pk primary key,
    last_name varchar(25) constraint member_last_name_nn not null,
    first_name varchar(25),
    address varchar(100),
    city varchar(30),
    phone varchar(15),
    join_date date default sysdate constraint member_join_date_nn not null
 );
    
-- TITLE - grava os filmes que tenho

create table title
(   title_id number(10) constraint title_title_id_pk primary key,
    title varchar(60) constraint title_title_nn not null,
    description varchar(400) constraint title_description_nn not null,
    rating varchar(4),
    category varchar(20) constraint title_category_ck check (category in ('DRAMA', 'COMEDY', 'ACTION', 'CHILD', 'SCIFI', 'DOCUMENTARY')),
    release_date date
);

-- TITLE COPY - 
 create table title_copy
 (  copy_id number(10),
    title_id number(10) constraint title_copy_title_if_fk references title(title_id),
    status varchar(15) constraint title_copu_status_nn not null
                       constraint title_copy_status_ck check (status in ('AVAILABLE', 'DRESTOYED', 'RESERVED')), 
    constraint title_copy_copy_id_title_id_pk primary key(copy_id, title_id)
 ); 
 
 -- RENTAL
 create table rental
 (  book_date date default sysdate,
    member_id number(10) constraint rental_memeber_id_fk references member(member_id),
    copy_id number(10),
    act_ret_date date,
    expe_ret_date date default sysdate + 2,
    title_id number(10), constraint rental_book_date_copy_title_pk primary key (book_date, member_id, copy_id, title_id),
                        constraint rental_copy_id_title_id_fk foreign key (copy_id, title_id) references title_copy(copy_id, title_id)
  );                      
    
  -- RESERVATION
  
create table reservation
(   res_date date,
    member_id number(10) constraint reservation_member_id references member(member_id),
    title_id number(10) constraint reservation_title_id references title(title_id),
                        constraint reservation_resdate_mem_tit_pk primary key (res_date, member_id, title_id)
);                        


/* Exercício 02
Verifique as tabelas criadas pelo SQL Developer no esquema HR*/

/* Exercício 03
Crie as sequences para as chaves primarias das tabelas : 
MEMBER  - inicio com 101, nao cache, nome member_id_seq
TITLE   - inicio com 92,não cache, nome title_id_seq
E verifique a existencia utilizando o SQL Developer
*/

create sequence member_id_seq start with 101 nocache;
create sequence title_id_seq start with 92 nocache;


/* Exercício 4
Acrescente os dados nas tabelas, ver imagens insert...*/


-- TITLE
INSERT INTO title(title_id, title, description, rating,
category, release_date)
VALUES (title_id_seq.NEXTVAL, 'Willie and Christmas Too',
'All of Willie''s friends make a Christmas list for
Santa, but Willie has yet to add his own wish list.',
'G', 'CHILD', TO_DATE('05-OUT-1995','DD-MON-YYYY'));

INSERT INTO title(title_id , title, description, rating,
category, release_date)
VALUES (title_id_seq.NEXTVAL, 'Alien Again', 'Yet another
installment of science fiction history. Can the
heroine save the planet from the alien life form?',
'R', 'SCIFI', TO_DATE( '19-MAI-1995','DD-MON-YYYY'));

INSERT INTO title(title_id, title, description, rating,
category, release_date)
VALUES (title_id_seq.NEXTVAL, 'The Glob', 'A meteor crashes
near a small American town and unleashes carnivorous
goo in this classic.', 'NR', 'SCIFI',
TO_DATE( '12-AGO-1995','DD-MON-YYYY'));

INSERT INTO title(title_id, title, description, rating,
category, release_date)
VALUES (title_id_seq.NEXTVAL, 'My Day Off', 'With a little
luck and a lot ingenuity, a teenager skips school
for
a day in New York.', 'PG', 'COMEDY',
TO_DATE( '12-JUL-1995','DD-MON-YYYY'));

INSERT INTO title(title_id, title, description, rating,
category, release_date)
VALUES (title_id_seq.NEXTVAL, 'Miracles on Ice', 'A sixyear-
old has doubts about Santa Claus, but she discovers
that miracles really do exist.', 'PG', 'DRAMA',
TO_DATE('12-SET-1995','DD-MON-YYYY'));

INSERT INTO title(title_id, title, description, rating,
category, release_date)
VALUES (title_id_seq.NEXTVAL, 'Soda Gang', 'After
discovering a cache of drugs, a young couple find themselves
pitted against a vicious gang.', 'NR', 'ACTION', TO_DATE('01-
JUN-1995','DD-MON-YYYY'));


-- MEMBER
INSERT INTO member(member_id, first_name, last_name,
address, city, phone, join_date)
VALUES (member_id_seq.NEXTVAL, 'Carmen', 'Velasquez',
'283 King Street', 'Seattle', '206-899-6666',
TO_DATE('08-MAR-1990',
'DD-MM-YYYY'));

INSERT INTO member(member_id, first_name, last_name,
address, city, phone, join_date)
VALUES (member_id_seq.NEXTVAL, 'LaDoris', 'Ngao',
'5 Modrany', 'Bratislava', '586-355-8882',
TO_DATE('08-MAR-1990',
'DD-MM-YYYY'));

INSERT INTO member(member_id, first_name, last_name,
address, city, phone, join_date)
VALUES (member_id_seq.NEXTVAL, 'Midori', 'Nagayama',
'68 Via Centrale', 'Sao Paolo', '254-852-5764',
TO_DATE('17-JUN-1991',
'DD-MM-YYYY'));

INSERT INTO member(member_id, first_name, last_name,
address, city, phone, join_date)
VALUES (member_id_seq.NEXTVAL, 'Mark', 'Quick-to-See',
'6921 King Way', 'Lagos', '63-559-7777', TO_DATE('07-
ABR-1990',
'DD-MM-YYYY'));

INSERT INTO member(member_id, first_name, last_name,
address, city, phone, join_date)
VALUES (member_id_seq.NEXTVAL, 'Audry', 'Ropeburn',
'86 Chu Street', 'Hong Kong', '41-559-87',
TO_DATE('18-JAN-1991',
'DD-MM-YYYY'));

INSERT INTO member(member_id, first_name, last_name,
address, city, phone, join_date)
VALUES (member_id_seq.NEXTVAL, 'Molly', 'Urguhart',
'3035 Laurier', 'Quebec', '418-542-9988', TO_DATE('18-
JAN-1991',
'DD-MM-YYYY'));

-- title copy

select * from title;

desc title_copy;

delete from title_copy

INSERT INTO title_copy(copy_id, title_id, status)
VALUES (1, 99, 'AVAILABLE');

INSERT INTO title_copy(copy_id, title_id, status)
VALUES (2, 100, 'AVAILABLE');

INSERT INTO title_copy(copy_id, title_id, status)
VALUES (3, 101, 'RESERVED');

INSERT INTO title_copy(copy_id, title_id, status)
VALUES (4, 102, 'AVAILABLE');

INSERT INTO title_copy(copy_id, title_id, status)
VALUES (5, 103, 'RESERVED');

INSERT INTO title_copy(copy_id, title_id,status)
VALUES (6, 104, 'AVAILABLE');

-- rental
select * from title
select * from member
select * from title_copy

INSERT INTO rental(title_id, copy_id, member_id, book_date, expe_ret_date, act_ret_date)
VALUES (99, 1, 101, sysdate-3, sysdate-1, sysdate-2);

INSERT INTO rental(title_id, copy_id, member_id, book_date, expe_ret_date, act_ret_date)
VALUES (100, 2, 101, sysdate-1, sysdate-1, NULL);

INSERT INTO rental(title_id, copy_id, member_id, book_date, expe_ret_date, act_ret_date)
VALUES (101, 3, 102, sysdate-2, sysdate, NULL);

INSERT INTO rental(title_id, copy_id, member_id, book_date, expe_ret_date,act_ret_date)
VALUES (102, 4, 106, sysdate-4, sysdate-2, sysdate-2);

delete from titl;e
delete from member;

COMMIT;

SELECT *
FROM title;

SELECT * 
FROM MEMBER

select * from title_copy




/* Exercício 5
Crie uma view chamada title_avail que mostre todos os titulos de filmes relacionado com sua cópia e sua data de retorno esperado
Apos isso faça im select nesta view*/

create or replace view title_avail as
  select t.title, c.copy_id, c.status, r.expe_ret_date
  from title t join title_copy c
  on t.title_id = c.title_id
  full outer join rental r
  on c.copy_id = r.copy_id
  and c.title_id = r.title_id;

select * from title_avail


/* Exercício 6
Adicione um novo titulo "Interestellar wars" 
Faça duas reservas para Carmem Velasques para os filmes interestelar e soda gang*/

INSERT INTO title(title_id, title, description, rating, category, release_date)
VALUES (title_id_seq.NEXTVAL, 'Interstellar Wars', 'Futuristic interstellar action movie. Can the rebels save the humans from the evil empire?',
'PG', 'SCIFI', '07-JUL-77');

select * from title
select * from title_copy

INSERT INTO title_copy (copy_id, title_id, status)
VALUES (1, 105, 'AVAILABLE');

INSERT INTO title_copy (copy_id, title_id, status)
VALUES (2, 105, 'AVAILABLE');

select * from member
select * from title

INSERT INTO reservation (res_date, member_id, title_id)
VALUES (SYSDATE, 101, 104);

INSERT INTO reservation (res_date, member_id, title_id)
VALUES (SYSDATE, 104, 105);



/* Exercício 7
Altere a tabela title modificando o campo price para scale 8,2
altere um titulo da tabela title usando variáveis de substituição*/

desc title

alter table title add (price number(8,2));

desc title

select * from title

update title
set price = &price
where title_id = &title_id


/* Exercício 8

Crie um relatório que contenha o histórico de cada cliente que alugou videos. Tenha certeza de
Incluir o nome do cliente, o filme alugado, as datas do aluguel e a duração dos aluguéis.
Total do número de aluguéis para todos os clientes para o período de relatório.  */

SELECT m.first_name||' '||m.last_name MEMBER, t.title,
       r.book_date, 
       r.act_ret_date - r.book_date DURATION
FROM member m JOIN rental r
  ON r.member_id = m.member_id
JOIN title t 
  ON r.title_id = t.title_id
ORDER BY member;
      

-- Passos de estudos
-- 1 - Assistir esta video aula 1x
-- 2 - Assistir a video aula agora fazendo os scritps 1x
-- 5 - Realizar o simulado online -- video aula
































