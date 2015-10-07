-- SQL Social-Network Triggers Exercises Core Set 

-- Q1
create trigger Friendly
after insert on Highschooler
for each row
when New.name = 'Friendly'
begin
  insert into Likes select New.ID, Highschooler.ID from  Highschooler where Highschooler.grade = New.grade and New.ID <> Highschooler.ID;
end;

-- Q2
create trigger R2
after insert on Highschooler 
for each row
when (new.grade < 9 or new.grade >12 or new.grade is null)
begin
 update Highschooler
 set grade = case 
 when grade is null then 9
 when (grade < 9 or grade > 12) then null 
 when (grade between 9 and 12) then grade
 end
 where ID = new.ID;
end;

--Q3
create trigger Graduate
after update on Highschooler
for each row
when New.grade > 12
begin 
    delete from Highschooler where New.ID = Highschooler.ID;
end
