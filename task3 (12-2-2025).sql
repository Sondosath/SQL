create database schoolMangmentSystem
use schoolMangmentSystem


create table students(
ID int primary key ,
name varchar(255) not null ,
age int not null
);

create table family_info(
ID int primary key ,
P_name varchar(255) not null ,
P_phone varchar(255) not null ,
student_id int unique,
FOREIGN KEY (student_id) REFERENCES students(ID)

);

create table courses(
ID int primary key ,
name varchar(255) not null ,
discription varchar(255)  ,
resource varchar(255),
student_id int unique,
FOREIGN KEY (student_id) REFERENCES students(ID)

);
CREATE TABLE StudentCourses (
    StudentID INT,
    CourseID INT,
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Students(ID) ON DELETE CASCADE,
    FOREIGN KEY (CourseID) REFERENCES Courses(ID) ON DELETE CASCADE
);

create table classes(
ID int primary key ,
class_code varchar(255) not null ,
Room_number varchar(255) not null ,
schaduale date,
FOREIGN KEY (student_id) REFERENCES students(ID)

);