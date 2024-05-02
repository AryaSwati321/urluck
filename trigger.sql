-- Write and execute suitable database triggers . 
-- Consider row level and statement level triggers.

-- Create the Student table
CREATE TABLE Student (
    id INT PRIMARY KEY,
    name VARCHAR(20),
    grade VARCHAR(3)
);

-- Create the row-level trigger
delimiter //

CREATE TRIGGER t1 BEFORE INSERT ON Student
FOR EACH ROW
BEGIN
    SET NEW.grade = UPPER(NEW.grade);
END;
//

delimiter //
CREATE TRIGGER t2 BEFORE INSERT ON Student
FOR EACH ROW
BEGIN
 IF (NEW.grade NOT IN ('A', 'B', 'C', 'D', 'E')) THEN
  SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid grade';
 END IF;
END;
//

select * from Student

# trigger---------------------------------------------


create database temp;
use temp;

create table company(
	name varchar(45),
    id int primary key
);

create table history(
	name varchar(45),
    id int ,
    action varchar(45)
);

delimiter //
create trigger trigger_B 
before delete on company
for each row
begin
	insert into history values (old.name,old.id,"delete before");
end;//

delimiter //
create trigger trigger_A 
after delete on company
for each row
begin
	insert into history values (old.name,old.id,"delete after");
end;//

insert into company values ('ram', 24);

select * from company;
select * from history;

delete from company where id = 23;

delimiter //
create trigger update_B
before update on company
for each row
begin
	insert into history values (old.name,old.id,"update before");
end;//

delimiter //
create trigger insert_B
before insert on company
for each row
begin
	insert into history values (new.name,new.id,"insert before");
end;//


update company SET id = 22 where id = 21;

