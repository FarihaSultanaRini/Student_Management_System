create database uap
GO

use uap
GO

create table department
(
	dept_name varchar(60) primary key,
	building varchar(60),
	budget int
);
insert into department
values
	('Biology' ,'Watson' , 90000),
	('Comp. Sci.', 'Taylor', 100000),
	('Elec. Eng.', 'Taylor', 85000),
	('Finance', 'Painter', 160000),
	('History', 'Painter', 50000),
	('Music' ,'Packard' ,80000),
	('Physics', 'Watson', 70000);
	
	
create table course
(
	course_id varchar(60) primary key,
	title varchar(60),
	dept_name varchar(60) ,
	credit smallint,
	foreign key(dept_name) references department(dept_name)
);
insert into course
values
('BIO-101','Intro to Biology','Biology',4),
('BIO-301','Genetics','Biology',4),
('BIO-399','Computational Biology','Biology',3),
('CS-101','Intro to coumputer science','Comp. Sci.',4),
('CS-190','Game Design','Comp. Sci.',4),
('CS-315','Robotics','Comp. Sci.',3),
('CS-319','Image Processing','Comp. Sci.',3),
('CS-347','Database System Concepts','Comp. Sci.',3),
('EE-181','Intro. to Digital Systems','Elec. Eng.',3),
('FIN-201','Investment Banking','Finance',3),
('HIS-351','World History','History',3),
('MU-199','Music Video Production','Music',3),
('PHY-101','Physical Principles','Physics',4);


create table prereq
(
	course_id varchar(60),
	prereq_id varchar(60),
	foreign key (course_id) references course(course_id),
	foreign key (prereq_id) references course(course_id)

);
insert into prereq
values 
('BIO-301','BIO-101'),
('BIO-399','BIO-101'),
('CS-190','CS-101'),
('CS-315','CS-101'),
('CS-319','CS-101'),
('CS-347','CS-101'),
('EE-181','PHY-101');


create table instructor
(
	ID varchar(60) primary key,
	namee varchar(60),
	dept_name varchar(60),
	salary int,
	foreign key(dept_name) references department(dept_name)

);
insert into instructor
values
('10101','Srinivasan','Comp. Sci.',65000),
('12121','Wu','Finance',90000),
('15151','Mozart','Music',40000),
('22222','Einstein','Physics',95000),
('32343','El Said','History',60000),
('33456','Gold','Physics',87000),
('45565','Katz','Comp. Sci.',75000),
('58583','Califieri','History',62000),
('76543','Singh','Finance',80000),
('76766','Crick','Biology',72000),
('83821','Brandt','Comp. Sci.',92000),
('98345','Kim','Elec. Eng.',80000);


create table classroom 
(
	building varchar(60),
	room_no smallint,
	capacity smallint,
	primary key (building,room_no)


);
insert into classroom
values
('Painter',514,50),
('Packard',101,55),
('Taylor',3128,58),
('Watson',120,60),
('Watson',100,50)


create table time_slot
(
	time_slot_id varchar(60),
	dayy varchar(60),
	start_time float,
	end_time float,
	primary key (time_slot_id,dayy,start_time)
);
insert into time_slot
values
('A','monday',8.00,9.30),
('B','tuesday',9.30,11.00),
('C','wednesday',12.30,2.00);


create table section
(
	course_id varchar(60),
	sec_id varchar(60),
	semester varchar(60),
	yearr smallint,
	building varchar(60),
	room_no smallint,
	primary key(course_id,sec_id,semester,yearr),
	foreign key (building,room_no) references classroom,
	foreign key (course_id) references course

);
insert into section
values 
('BIO-101','1','Summer',2009,'Painter',514),
('BIO-301','1','Summer',2010,'Painter',514),
('CS-101','1','Fall',2009,'Packard',101),
('CS-101','1','Spring',2010,'Packard',101),
('CS-190','1','Spring',2009,'Taylor',3128),
('CS-190','2','Spring',2009,'Taylor',3128),
('CS-315','1','Spring',2010,'Watson',120),
('CS-319','1','Spring',2010,'Watson',100),
('CS-319','2','Spring',2010,'Taylor',3128),
('CS-347','1','Fall',2009,'Taylor',3128),
('EE-181','1','Spring',2009,'Taylor',3128),
('FIN-201','1','Spring',2010,'Packard',101),
('HIS-351','1','Spring',2010,'Painter',514),
('MU-199','1','Spring',2010,'Packard',101),
('PHY-101','1','Fall',2009,'Watson',100)


create table teaches
(
	ID varchar(60) primary key,
	course_id varchar(60),
	sec_id varchar(60),
	semester varchar (60),
	yearr smallint,
	foreign key (ID) references instructor(ID),
	constraint FK_01 foreign key (course_id,sec_id,semester,yearr) references section


);
insert into teaches
values 
('15151','CS-347','1','Fall',2009),
('32343','EE-181','1','Spring',2009),
('45565','FIN-201','1','Spring',2010),
('76543','HIS-351','1','Spring',2010),
('83821','MU-199','1','Spring',2010),
('98345','PHY-101','1','Fall',2009)


create table student
(
	ID varchar(60) primary key,
	namee varchar(60),
	dept_name varchar(60),
	tot_cred float,
	foreign key (dept_name) references department (dept_name),

);

insert into student
values
	('01','Isha','Biology', 20.5),
	('02','Sadi','Comp. Sci.', 20.5),
	('03','Supty','Elec. Eng.', 20.5),
	('06','Alim','Finance', 20.5),
	('09','Talha','History', 20.5),
	('11','Mou','Music' ,20.5),
	('12','Rashik','Physics', 20.5),
	('13','Nidhi','History',20.5),
	('17','Sharmin','Physics',20.5),
	('18','Anol','Music',19.5),
	('19','Shaon','History',18.00),
	('20','Mitul','Finance',17.5),
	('21','Ratul','Elec. Eng.',20.5),
	('22','Jui','Comp. Sci.',17.5),
	('23','Farjana','Biology',20.5),
	('24','Ramisa','Biology',20.5),
	('25','Tanha','Biology',22.00),
	('26','Naem','Finance',16.5),
	('27','Mridul','History',17.00),
	('28','Rakib','Comp. Sci.',18.5),
	('29','Mithi','Comp. Sci.',22.00),
	('30','Mariam','Comp. Sci.',22.00),
	('32','Shupty','Finance',18.5),
	('33','Anika','History',19.5),
	('34','Antor','Biology',22.00),
	('35','Fahim','History',17.5),
	('36','Mamun','History',17.5),
	('37','Shimul','Finance',18.5),
	('38','Farhan','Biology',22.00),
	('39','Samiul','Elec. Eng.',22.5),
	('40','Nabila','Biology',22.00);

insert into student
values
	('41','Tinni','Comp. Sci.',22.00),
	('42','Khadiza','Finance',18.5),
	('43','Emon','History',19.5),
	('44','Osman','Biology',22.00),
	('45','Rafi','History',17.5),
	('46','Gobindo','History',17.5),
	('47','Ashraf','Finance',18.5),
	('48','Shuvo','Biology',22.00),
	('49','Forhad','Elec. Eng.',22.5),
	('50','Roni','Biology',22.00);
		
--use master
--drop database uap
		

create table advisor
(
	s_id varchar(60) primary key,
	i_id varchar(60),
	foreign key (s_id) references student(ID),
	foreign key (i_id) references instructor(ID)
);
insert into advisor
values
	('01','10101'),
	('02','12121'),
	('03','15151'),
	('06','22222'),
	('09','32343'),
	('11','33456'),
	('12','45565');


create table takes
(
	ID varchar(60),
	course_id varchar(60),
	sec_id varchar(60),
	semester varchar(60),
	yearr smallint,
	primary key(ID,course_id,sec_id,semester,yearr),
	foreign key (ID) references student (ID),
	foreign key (course_id,sec_id,semester,yearr) references section(course_id,sec_id,semester,yearr)
	
);
insert into takes
values
('01','BIO-101',1,'Summer',2009),
('02','BIO-301',1,'Summer',2010),
('03','CS-101',1,'Fall',2009),
('06','CS-101',1,'Spring',2010),
('09','CS-190',1,'Spring',2009),
('11','CS-190',2,'Spring',2009),
('12','CS-315',1,'Spring',2010);


select * from department
select * from course
select * from prereq
select * from instructor
select * from classroom
select * from time_slot
select * from section
select * from teaches
select * from student
select * from advisor
select * from takes

