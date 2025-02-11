create database school
use school 
create table teachers(
ID INT PRIMARY KEY,
Name varchar(255),

);

create table courses(
ID int primary key,
Name varchar(255),
Timme varchar(255)
);

create table student(
ID int primary key ,
namr varchar(255),
class varchar(255),
FOREIGN KEY (ID) REFERENCES courses(ID)
);

create table TeacherDetails (
ID int primary key,
salary int ,
gender varchar(255),
birthday varchar(255),
national_id int ,
FOREIGN KEY (ID) REFERENCES teachers(ID)
);

create table student_courses(

    StudentID INT,
    CourseID INT,
    FOREIGN KEY (StudentID) REFERENCES Student(ID),
    FOREIGN KEY (CourseID) REFERENCES Courses(ID)
);

create table student_teachers(

    StudentID INT,
    teachersID INT,
    FOREIGN KEY (StudentID) REFERENCES Student(ID),
    FOREIGN KEY (teachersID) REFERENCES teachers(ID)
);

create table teachers_courses(
	coursesID INT,
    teachersID INT,
    FOREIGN KEY (coursesID) REFERENCES courses(ID),
    FOREIGN KEY (teachersID) REFERENCES teachers(ID)
);
create table class(
ID int primary key,
name varchar(255) not null,
timee varchar(255)
);

create table class_techer(
classID INT,
    teachersID INT,
    FOREIGN KEY (classID) REFERENCES class(ID),
    FOREIGN KEY (teachersID) REFERENCES teachers(ID)
);