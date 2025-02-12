create database LibraryDatabaseManagementSystem
use LibraryDatabaseManagementSystem

create table Books(
ID int primary key,
Title varchar(255) not null,
Author varchar(255) not null,
Genre varchar(255),	
PublicationYear int,
AvailabilityStatus varchar(255) not null 

);



create table Members (
ID int primary key,
Name varchar(255) not null,
Contact_Information varchar(255),
Membership_Type varchar(255),
Registration_Date Date not null
);


create table MemberBook  (
ID int primary key,
Member_ID int ,
Book_ID int ,
Borrowing_Date date,
Due_Date date,
return_date date ,
FOREIGN key (Member_ID) REFERENCES Members(ID) ,
FOREIGN key (Book_ID)  REFERENCES Books(ID)


);


create table library_staff(
ID int primary key,
Name varchar(255) not null,
Contact_Info varchar(255),
Assigned_Section varchar(255) not null,
Employment_Date date

);


create table Categories (
ID int primary key,
Name varchar(255) not null,
Description varchar(255),

);


create table Reservations  (
ID int primary key,
Book_ID int not null,
Member_ID int not null ,
 Reservation_Date date, 
 Status varchar(255),
 FOREIGN key (Member_ID)  REFERENCES Members(ID),
FOREIGN key (Book_ID)  REFERENCES Books(ID)

);


create table Financial_fines (
ID int primary key,
Member_ID int not null ,
 Amount int not null,
 Payment_Status varchar(255) not null,
 FOREIGN key (Member_ID)  REFERENCES Members(ID)
);

--insert into book table -------------------

INSERT INTO Books (ID, Title, Author, Genre, PublicationYear, AvailabilityStatus) VALUES
(1, 'SQL for Beginners', 'John Doe', 'Education', 2020, 'Available'),
(2, 'C# Programming', 'Jane Smith', 'Programming', 2019, 'Borrowed'),
(3, 'Database Fundamentals', 'Alice Brown', 'Technology', 2018, 'Available'),
(4, 'Python Basics', 'Robert Johnson', 'Programming', 2021, 'Available'),
(5, 'Data Science 101', 'Emily White', 'Data Science', 2022, 'Borrowed');

--insert into Members table -------------------

INSERT INTO Members (ID, Name, Contact_Information, Membership_Type, Registration_Date) VALUES
(1, 'Omar', '9876543210', 'Student', '2024-06-05'),
(2, 'Sara', '1234567890', 'Teacher', '2024-02-15'),
(3, 'Ali', '1122334455', 'Visitor', '2025-01-01'),
(4, 'Lina', '5566778899', 'Student', '2023-09-20'),
(5, 'Khalid', '9988776655', 'Teacher', '2022-11-10');


--insert into MemberBook (joinction) table -------------------

INSERT INTO MemberBook (ID, Member_ID, Book_ID, Borrowing_Date, Due_Date, Return_Date) VALUES
(1, 1, 2, '2024-02-01', '2024-02-10', '2024-02-09'),  
(2, 2, 3, '2024-03-05', '2024-03-15', NULL),           
(3, 3, 1, '2025-01-02', '2025-01-12', '2025-01-15'),  
(4, 4, 4, '2023-10-10', '2023-10-20', '2023-10-19'),  
(5, 5, 5, '2022-11-15', '2022-11-25', '2022-11-27');  


--insert into Library_Staff table -------------------
INSERT INTO Library_Staff (ID, Name, Contact_Info, Assigned_Section, Employment_Date) VALUES
(1, 'Ahmed', '1122334455', 'Technology', '2020-01-10'),
(2, 'Fatima', '2233445566', 'Education', '2019-05-20'),
(3, 'Mohammed', '3344556677', 'Programming', '2018-07-15'),
(4, 'Nour', '4455667788', 'Data Science', '2021-03-22'),
(5, 'Yusuf', '5566778899', 'General', '2017-09-12');


--insert into Categories table -------------------
INSERT INTO Categories (ID, Name, Description) VALUES
(1, 'Technology', 'Books related to technology and innovation'),
(2, 'Education', 'Educational and academic books'),
(3, 'Programming', 'Books about programming languages and coding'),
(4, 'Data Science', 'Books on AI, machine learning, and data analysis'),
(5, 'General', 'General books of various topics');



--insert into Reservations table -------------------


INSERT INTO Reservations (ID, Book_ID, Member_ID, Reservation_Date, Status) VALUES
(1, 1, 3, '2025-01-02', 'Completed'),  
(2, 2, 4, '2023-10-05', 'Pending'),  
(3, 3, 1, '2024-02-28', 'Cancelled'),  
(4, 4, 2, '2024-03-01', 'Completed'),  
(5, 5, 5, '2022-11-10', 'Completed'); 




--insert into Financial_Fines table -------------------
INSERT INTO Financial_Fines (ID, Member_ID, Amount, Payment_Status) VALUES
(1, 3, 10, 'Paid'),   
(2, 5, 15, 'Unpaid'),
(3, 2, 5, 'Paid'),   
(4, 4, 0, 'Paid'),    
(5, 1, 0, 'Paid');    



------------------1----------------------
--Write an SQL query to find all members who registered on 1-1-2025.

SELECT Name ,Registration_Date
FROM Members
WHERE Registration_Date = '1-1-2025'

------------------2----------------------
--Write an SQL query to retrieve all details of a book titled "Database Fundamentals".
SELECT *
FROM Books
WHERE Title = 'Database Fundamentals'

----------------------3---------------------
--3. Add a new column ‘Email’ to the Members table

ALTER TABLE Members ADD Email VARCHAR(20);

-----------------4------------------------
--4. Insert a new member record

SELECT * FROM Members
INSERT INTO Members (ID,Name, Contact_Information, Membership_Type, Registration_Date, Email) VALUES
( 6,'Omar', '9876543210', 'Student', '05-06-2024','Omar@gmail.com');


------------------5--------------------
--Select members who have reservations in the system


SELECT NAME
FROM Members 
JOIN Reservations ON  Members.ID = Reservations.Member_ID;


-----------------------------------------------------------------------------------------------------------------------
---WHILE I AM CHECKING I FIND THAT I MISS DONIG THE 1:M RELATION BETWEEN BOOKS & CATECORY SO IAM GOING TO FIX THAT HERE:

-- 1. إضافة عمود Category_ID في جدول Books
ALTER TABLE Books 
ADD Category_ID INT;


-- 2. ربط العمود الجديد Category_ID بالمفتاح الأساسي لجدول Categories
ALTER TABLE Books 
ADD CONSTRAINT FK_Books_Categories 
FOREIGN KEY (Category_ID) REFERENCES Categories(ID);

UPDATE Books SET Category_ID = 1 WHERE ID = 1; -- SQL for Beginners → Technology
UPDATE Books SET Category_ID = 3 WHERE ID = 2; -- C# Programming → Programming
UPDATE Books SET Category_ID = 1 WHERE ID = 3; -- Database Fundamentals → Technology
UPDATE Books SET Category_ID = 3 WHERE ID = 4; -- Python Basics → Programming
UPDATE Books SET Category_ID = 4 WHERE ID = 5; -- Data Science 101 → Data Science

SELECT * FROM Books

-----------------END OF FIXING -----------------------------
--------------------------------------------------------------





-------------------6----------------------
--Write an SQL query to find members who have borrowed the book titled "SQL for Beginners".
SELECT Members.Name, Members.Email
FROM Members
JOIN MemberBook ON  MemberBook.Member_ID = Members.ID
JOIN BOOKS ON  BOOKS.ID = MemberBook.BOOK_ID
WHERE Title ='SQL for Beginners' ;




------------------7-----------------------
--Write an SQL query to find all members who have borrowed and returned the book titled "C# Programming".


SELECT * FROM Members
JOIN MemberBook ON Members.ID = MemberBook.Member_ID
JOIN Books on MemberBook.Book_ID = Books.ID
where Books.Title = 'C# Programming' 
and MemberBook.return_date IS NOT NULL 
and MemberBook.Borrowing_Date IS NOT NULL 

--------------------------8------------------------------------
--Write an SQL query to find members who have returned books after the due date.


SELECT * FROM Members
JOIN MemberBook ON Members.ID = MemberBook.Member_ID
JOIN Books on MemberBook.Book_ID = Books.ID
and MemberBook.return_date > MemberBook.Due_Date 

-------------------9------------------------------------------
--Write an SQL query to find books that have been borrowed more than 3 times
SELECT Books.ID, Books.Title, Books.Author, Books.Genre, Books.PublicationYear, Books.AvailabilityStatus, 
       COUNT(MemberBook.Book_ID) AS BorrowCount
FROM Books
JOIN MemberBook ON Books.ID = MemberBook.Book_ID
GROUP BY Books.ID, Books.Title, Books.Author, Books.Genre, Books.PublicationYear, Books.AvailabilityStatus
HAVING COUNT(MemberBook.Book_ID) > 3;


----------------------10--------------------------------------
--Write an SQL query to find members who have borrowed a book between January 1, 2024, and January 10, 2024.(BETWEEN '01-01-2024' AND '10-01-2024')

select * 
from Members
join MemberBook on Members.ID =MemberBook.Member_ID
where MemberBook.Borrowing_Date between '2024-01-01' and '2024-01-10'

----------------------11--------------------------------------
--Write an SQL query to count the total number of books available in the library.

SELECT COUNT(*) AS TotalAvailableBooks
FROM Books
WHERE AvailabilityStatus = 'Available';
