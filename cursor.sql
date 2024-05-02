-- I am working on this cursor program keep patience


-- code below is broken

use temp;
create table emp(
	name varchar(45),
    id int primary key,
    salary int(10)
);
INSERT INTO emp (name, id, salary) VALUES ('John Doe', 1, 50000);
INSERT INTO emp (name, id, salary) VALUES ('Jane Smith', 2, 60000);
INSERT INTO emp (name, id, salary) VALUES ('Mark Johnson', 3, 55000);
INSERT INTO emp (name, id, salary) VALUES ('Emily Davis', 4, 70000);
INSERT INTO emp (name, id, salary) VALUES ('Michael Brown', 5, 45000);
INSERT INTO emp (name, id, salary) VALUES ('Sarah Wilson', 6, 65000);
INSERT INTO emp (name, id, salary) VALUES ('David Thompson', 7, 80000);

select * from emp;

delimiter //
create procedure tn()
begin
	declare x varchar(45);
    declare y int default 0;
    declare z int(10) default 0;
    declare finished int default 0;
    
    declare cur cursor for select name, id, salary from emp order by salary desc limit 5;
    declare continue handler for not found set finished =1;
    
    open cur;
    
    lp:loop 
		fetch cur into x,y,z;
        
        if finished = 1 then leave lp;
        end if;
        
        select x,y,z;
	end loop lp;
	close cur;
end;//

call tn();


















-- Create the Student table
CREATE TABLE Student (
    id INT PRIMARY KEY,
    name VARCHAR(20),
    grade VARCHAR(3)
);


DECLARE
   -- Implicit Cursor
   CURSOR c1 IS
      SELECT id, name, grade
      FROM Student;
      
   -- Explicit Cursor (UPDATE statement)
   CURSOR c2 IS
      SELECT id, grade
      FROM Student
      WHERE grade = 'C';
      
   -- Variable declarations
   v_id int;
   v_name varchar(20);
   v_grade varchar(3);
BEGIN
   -- Implicit Cursor (SELECT query)
   FOR std IN c1 LOOP
      DBMS_OUTPUT.PUT_LINE('Student ID: ' || std.id || ', Name: ' || std.name || ', Grade: ' || std.grade);
   END LOOP;
   
   -- Explicit Cursor (UPDATE statement)
   OPEN c2;
   LOOP
      FETCH c2 INTO v_id, v_grade;
      EXIT WHEN c2%NOTFOUND;
      v_grade := 'B'; -- Update the grade to 'B'
      UPDATE Student
      SET grade = v_grade
      WHERE id = v_id;
   END LOOP;
   CLOSE c2;

EXCEPTION
   WHEN OTHERS THEN
END;
/
