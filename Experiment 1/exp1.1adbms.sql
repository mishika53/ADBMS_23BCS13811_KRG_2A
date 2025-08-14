create table author_tb (author_id int primary key, author_name varchar(20), author_country varchar(10));
insert into author_tb (author_id, author_name, author_country)
values (101, 'George Orwell','uk'),
(102,' Haruki ', 'japan'),
(103,' Chinua Achebe', 'nigeria');

create table book_tb (book_id int primary key, book_name varchar(50), author_id int , publisheryear int);
insert into book_tb (book_id, book_name,author_id, publisheryear)
values (01, 'toogood', 101, 1978),
(02,'wood',102,2021),
(03,'thing fall apart',101,2021),
(04,'tobe true',102,2021),
(05,'DHVYUUABS ',103,2021),
(06,'chandigarhuniversity',101,2021),
(07,'BDC',102,2021);

select b1.book_name as [book_title] , a1.author_name, a1.author_country
from author_tb as a1
inner join
book_tb as b1
on a1.author_id=b1.author_id;
