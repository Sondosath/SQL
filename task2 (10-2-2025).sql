create database Library

use Library;
create table book (
BookID int PRIMARY key ,
title varchar(255) not null ,
AuthorID int not null unique ,
PublishedYear varchar(255) ,
CopiesAvailable varchar(255) ,
BookCategory varchar(255) not null
);


use Library;

create table Authors (
AuthorID int PRIMARY KEY ,
FirstName varchar (255) not null ,
LastName varchar (255) not null ,
BirthYear date ,
);


INSERT INTO Authors (AuthorID,FirstName, LastName, BirthYear) VALUES 
(1,'John', 'Doe', '1975-05-20'),
(2,'Jane', 'Smith', '1980-11-15'),
(3,'Michael', 'Brown', '1990-07-30'),
(4,'Emily', 'Davis', '1985-03-25'),
(5,'Daniel', 'Wilson', '1992-09-10');

insert into book (BookID,title, AuthorID, PublishedYear, CopiesAvailable, BookCategory) VALUES 
(1,'The Great Adventure', 1, 2005, 10, 'Fiction'),
(2,'Science for Beginners', 2, 2010, 15, 'Science'),
(3,'History of Civilizations', 3, 2015, 5, 'History'),
(4,'The Art of Coding', 4, 2020, 8, 'Technology'),
(5,'Mystery of the Unknown', 5, 2018, 12, 'Mystery');


select * from book 
select * from Authors

select MAX(CopiesAvailable) from book 
select MIN(CopiesAvailable) from book 

select AVG(PublishedYear) from book 


ALTER TABLE book 
ALTER COLUMN PublishedYear INT;


select * from book 

UPDATE book 
SET PublishedYear = CAST(PublishedYear AS INT);

select AVG(PublishedYear) from book 

select count(BookID) from book 


TRUNCATE TABLE book;
select * from book ;

ALTER TABLE book 
add  Email varchar(255);
ALTER TABLE book ADD  Phone_Number int;

drop table Authors

