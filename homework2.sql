-- create table part

CREATE TABLE Course(
  number VARCHAR(45) NOT NULL,
  title VARCHAR(45) NOT NULL,
  credits VARCHAR(45) NOT NULL,
  syllabus VARCHAR(45) NOT NULL,
  PRIMARY KEY (number));

CREATE TABLE CourseOffering(
  number VARCHAR(45) NOT NULL,
  year VARCHAR(45) NOT NULL,
  semester VARCHAR(45) NOT NULL,
  section_number VARCHAR(45) NOT NULL,
  classroom VARCHAR(45) NOT NULL,
  PRIMARY KEY (number,year,semester,section_number),
  FOREIGN KEY (number) REFERENCES Course(number)
  );  

CREATE TABLE CourseOffering_timing(
  number VARCHAR(45) NOT NULL,
  year VARCHAR(45) NOT NULL,
  semester VARCHAR(45) NOT NULL,
  section_number VARCHAR(45) NOT NULL,
  timing VARCHAR(45) NOT NULL,
  PRIMARY KEY (number,year,semester,section_number,timing),
  FOREIGN KEY (number) REFERENCES Course(number),
  FOREIGN KEY (number,year,semester,section_number) REFERENCES CourseOffering(number,year,semester,section_number)
  );

  
CREATE TABLE Student(
  student_id VARCHAR(45) NOT NULL,
  name VARCHAR(45) NOT NULL,
  department VARCHAR(45) NOT NULL,
  PRIMARY KEY (student_id)
  );   
  
CREATE TABLE Instructor(
  instructor_id VARCHAR(45) NOT NULL,
  name VARCHAR(45) NOT NULL,
  department VARCHAR(45) NOT NULL,
  title VARCHAR(45) NOT NULL,
  PRIMARY KEY (instructor_id));  


CREATE TABLE Prerequisite(
  course_number VARCHAR(45) NOT NULL,
  prerequisite_number VARCHAR(45) NOT NULL,
  PRIMARY KEY (course_number,prerequisite_number),
  FOREIGN KEY (course_number) REFERENCES Course(number),
  FOREIGN KEY (prerequisite_number) REFERENCES Course(number)
  ); 
  
CREATE TABLE Enrolls(
  student_id VARCHAR(45) NOT NULL,
  number VARCHAR(45) NOT NULL,
  year VARCHAR(45) NOT NULL,
  semester VARCHAR(45) NOT NULL,
  section_number VARCHAR(45) NOT NULL,
  grade VARCHAR(45) NOT NULL,
  PRIMARY KEY (student_id,number,year,semester,section_number),
  FOREIGN KEY (student_id) REFERENCES Student(student_id),
  FOREIGN KEY (number,year,semester,section_number) REFERENCES CourseOffering(number,year,semester,section_number)
  ); 

CREATE TABLE Teaches(
  instructor_id VARCHAR(45) NOT NULL,
  number VARCHAR(45) NOT NULL,
  year VARCHAR(45) NOT NULL,
  semester VARCHAR(45) NOT NULL,
  section_number VARCHAR(45) NOT NULL,
  PRIMARY KEY (instructor_id,number,year,semester,section_number),
  FOREIGN KEY (instructor_id) REFERENCES Instructor(instructor_id),
  FOREIGN KEY (number,year,semester,section_number) REFERENCES CourseOffering(number,year,semester,section_number)
  ); 

-- populate part

insert into Course (number, title, credits, syllabus) 
values ('601', "CSCI", '3', "a");
insert into Course (number, title, credits, syllabus) 
values ('602', "EE", '3', "b");
insert into Course (number, title, credits, syllabus) 
values ('603', "CSCI", '3', "c");
insert into Course (number, title, credits, syllabus) 
values ('604', "CE", '3', "d");
insert into Course (number, title, credits, syllabus) 
values ('605', "CSCI", '3', "e");
insert into Course (number, title, credits, syllabus) 
values ('606', "ME", '3', "f");
insert into Course (number, title, credits, syllabus) 
values ('607', "ME", '3', "g");
insert into Course (number, title, credits, syllabus) 
values ('608', "EE", '3', "h");
insert into Course (number, title, credits, syllabus) 
values ('609', "CSCI", '3', "i");
insert into Course (number, title, credits, syllabus) 
values ('610', "CSCI", '3', "j");


insert into CourseOffering (number, year, semester, section_number, classroom) 
values ('601', '2018', "fall", '1', '2450');
insert into CourseOffering (number, year, semester, section_number, classroom) 
values ('602', '2018', "fall", '1', '2451');
insert into CourseOffering (number, year, semester, section_number, classroom) 
values ('603', '2018', "fall", '2', '2452');
insert into CourseOffering (number, year, semester, section_number, classroom) 
values ('604', '2018', "fall", '1', '2453');
insert into CourseOffering (number, year, semester, section_number, classroom) 
values ('605', '2018', "spring", '1', '2454');
insert into CourseOffering (number, year, semester, section_number, classroom) 
values ('606', '2019', "fall", '2', '2455');
insert into CourseOffering (number, year, semester, section_number, classroom) 
values ('606', '2018', "spring", '1', '2455');
insert into CourseOffering (number, year, semester, section_number, classroom) 
values ('607', '2019', "spring", '1', '2454');
insert into CourseOffering (number, year, semester, section_number, classroom) 
values ('607', '2019', "spring", '2', '2454');
insert into CourseOffering (number, year, semester, section_number, classroom) 
values ('608', '2019', "fall", '3', '2455');



insert into CourseOffering_timing (number, year, semester, section_number, timing) 
values ('601', '2018', "fall", '1', "12:45");
insert into CourseOffering_timing (number, year, semester, section_number, timing) 
values ('602', '2018', "fall", '1', "8:30");
insert into CourseOffering_timing (number, year, semester, section_number, timing) 
values ('603', '2018', "fall", '2', "12:45");
insert into CourseOffering_timing (number, year, semester, section_number, timing) 
values ('604', '2018', "fall", '1', "8:30");
insert into CourseOffering_timing (number, year, semester, section_number, timing) 
values ('605', '2018', "spring", '1', "15:45");
insert into CourseOffering_timing (number, year, semester, section_number, timing) 
values ('606', '2019', "fall", '2', "8:40");
insert into CourseOffering_timing (number, year, semester, section_number, timing) 
values ('606', '2018', "spring", '1', "12:45");
insert into CourseOffering_timing (number, year, semester, section_number, timing) 
values ('607', '2019', "spring", '1', "16:00");
insert into CourseOffering_timing (number, year, semester, section_number, timing) 
values ('607', '2019', "spring", '2', "8:00");
insert into CourseOffering_timing (number, year, semester, section_number, timing) 
values ('608', '2019', "fall", '3', "11:00");


insert into Student (student_id, name, department) 
values ('1000', "Naruto", "Computer Science");
insert into Student (student_id, name, department) 
values ('1001', "Sasuke", "Computer Science");
insert into Student (student_id, name, department) 
values ('1002', "Hinata", "ee");
insert into Student (student_id, name, department) 
values ('1003', "Sakura", "ee");
insert into Student (student_id, name, department) 
values ('1004', "Boruto", "Computer Science");
insert into Student (student_id, name, department) 
values ('1005', "Kiba", "ce");
insert into Student (student_id, name, department) 
values ('1006', "Lee", "ce");
insert into Student (student_id, name, department) 
values ('1007', "Gaara", "me"); 
insert into Student (student_id, name, department) 
values ('1008', "Kankuro", "me");
insert into Student (student_id, name, department) 
values ('1009', "Choco", "Computer Science");


insert into Instructor (instructor_id, name, department,title) 
values ('2000', "Kakashi", "Computer Science" , "professor");
insert into Instructor (instructor_id, name, department,title) 
values ('2001', "Itachi", "Computer Science" , "professor");
insert into Instructor (instructor_id, name, department,title) 
values ('2002', "Madara", "ce" , "lecturer");
insert into Instructor (instructor_id, name, department,title) 
values ('2003', "Guy", "Computer Science" , "associate professor");
insert into Instructor (instructor_id, name, department,title) 
values ('2004', "John", "Computer Science" , "associate professor");
insert into Instructor (instructor_id, name, department,title) 
values ('2005', "Mintato", "ee" , "lecturer");
insert into Instructor (instructor_id, name, department,title) 
values ('2006', "Nagato", "ce" , "professor");
insert into Instructor (instructor_id, name, department,title) 
values ('2007', "Jiraiya", "Computer Science" , "associate professor");
insert into Instructor (instructor_id, name, department,title) 
values ('2008', "Orochimaru", "me" , "professor");
insert into Instructor (instructor_id, name, department,title) 
values ('2009', "Tsunade", "me" , "lecturer");

insert into Prerequisite (course_number, prerequisite_number) 
values ('605','601');
insert into Prerequisite (course_number, prerequisite_number) 
values ('605','602');
insert into Prerequisite (course_number, prerequisite_number) 
values ('605','603');
insert into Prerequisite (course_number, prerequisite_number) 
values ('610','601');
insert into Prerequisite (course_number, prerequisite_number) 
values ('610','602');
insert into Prerequisite (course_number, prerequisite_number) 
values ('602','601');
insert into Prerequisite (course_number, prerequisite_number) 
values ('606','605');
insert into Prerequisite (course_number, prerequisite_number) 
values ('607','601');
insert into Prerequisite (course_number, prerequisite_number) 
values ('608','601');
insert into Prerequisite (course_number, prerequisite_number) 
values ('609','602');


insert into Enrolls (student_id, number, year, semester, section_number, grade) 
values ('1000', '608', '2019', "fall", '3', "A");
insert into Enrolls (student_id, number, year, semester, section_number, grade) 
values ('1001', '608', '2019', "fall", '3', "A");
insert into Enrolls (student_id, number, year, semester, section_number, grade) 
values ('1002', '605', '2018', "spring", '1', "A");
insert into Enrolls (student_id, number, year, semester, section_number, grade) 
values ('1002', '608', '2019', "fall", '3', "B");
insert into Enrolls (student_id, number, year, semester, section_number, grade) 
values ('1002', '602', '2018', "fall", '1', "A");
insert into Enrolls (student_id, number, year, semester, section_number, grade) 
values ('1003', '601', '2018', "fall", '1', "A");
insert into Enrolls (student_id, number, year, semester, section_number, grade) 
values ('1004', '601', '2018', "fall", '1', "C");
insert into Enrolls (student_id, number, year, semester, section_number, grade) 
values ('1005', '603', '2018', "fall", '2', "B");
insert into Enrolls (student_id, number, year, semester, section_number, grade) 
values ('1006', '604', '2018', "fall", '1', "A");
insert into Enrolls (student_id, number, year, semester, section_number, grade) 
values ('1009', '607', '2019', "spring", '2', "F");


insert into Teaches (instructor_id, number, year, semester, section_number) 
values ('2000', '601', '2018', "fall",'1');
insert into Teaches (instructor_id, number, year, semester, section_number) 
values ('2005', '602', '2018', "fall", '1');
insert into Teaches (instructor_id, number, year, semester, section_number) 
values ('2003', '603', '2018', "fall", '2');
insert into Teaches (instructor_id, number, year, semester, section_number) 
values ('2002', '604', '2018', "fall", '1');
insert into Teaches (instructor_id, number, year, semester, section_number) 
values ('2004', '605', '2018', "spring", '1');
insert into Teaches (instructor_id, number, year, semester, section_number) 
values ('2009', '606', '2019', "fall", '2');
insert into Teaches (instructor_id, number, year, semester, section_number) 
values ('2006', '606', '2018', "spring", '1');
insert into Teaches (instructor_id, number, year, semester, section_number) 
values ('2008', '607', '2019', "spring", '1');
insert into Teaches (instructor_id, number, year, semester, section_number) 
values ('2008', '607', '2019', "spring", '2');
insert into Teaches (instructor_id, number, year, semester, section_number) 
values ('2005', '608', '2019', "fall", '3');

-- query part

select student_id, name from Student
where department="Computer Science";

select distinct E.student_id from Enrolls as E, Teaches as T, Instructor as I
			where T.`instructor_id`=I.`instructor_id` 
			and E.number=T.number 
			and E.year=T.year 
			and E.semester=T.semester 
			and E.`section_number`=T.`section_number`
			and I.name="John";


select S.student_id from Student as S 
		where S.student_id not in 
			(select distinct E.student_id from Enrolls as E, Teaches as T, Instructor as I
				where T.`instructor_id`=I.`instructor_id` 
				and E.number=T.number 
				and E.year=T.year 
				and E.semester=T.semester 
				and E.`section_number`=T.`section_number`
				and I.name="John");


select department, count(student_id) from Student
group by department;


select  I.name,T.number, T.section_number, T.year, T.semester,count(E.student_id)
from Instructor as I, Teaches as T, Enrolls as E, Course as C
where   T.`instructor_id`=I.`instructor_id` 
		and E.number=T.number
		and E.year=T.year
		and E.semester=T.semester
		and E.`section_number`=T.`section_number`
		and E.number=C.number
		and C.title="CSCI" 
group by I.`instructor_id`,T.number,T.`section_number`,T.year,T.semester;











