create database projects;
USE PROJECTS;

Select * from hr;

-- "DATA CLEANING"
-- changing ï»¿id to emp_id;


Alter table hr
change ï»¿id emp_id varchar (20) Null;

describe hr;

Select birthdate from hr;

Set sql_safe_updates = 0;

update hr
set birthdate = case
when birthdate like '%/%' then date_format(str_to_date(birthdate,'%m/%d/%Y'),'%Y-%m-%d')
when birthdate like '%-%' then date_format(str_to_date(birthdate,'%m-%d-%Y'),'%Y-%m-%d')
else null
end;

rollback;
Select birthdate from hr;

Alter table hr
modify column birthdate date;

Select termdate from hr;


update hr
set termdate=
case 
when termdate like '%Y-%m-%d %H:%i:%s UTC' then date_format(str_to_date(birthdate,'%m/%d/%Y'),'%Y-%m-%d')
when termdate like ' ' then '0000-00-00'
else null
end;



SELECT termdate FROM hr;

ALTER TABLE hr
MODIFY COLUMN termdate DATE;

UPDATE hr
SET termdate = DATE_FORMAT(STR_TO_DATE(termdate, '%Y-%m-%d %H:%i:%s UTC'), '%Y-%m-%d')
WHERE termdate IS NOT NULL AND termdate != '' AND termdate != ' ';

update hr
set termdate= date_format(STR_TO_DATE(termdate, '%Y-%m-%d %H:%i:%s UTC'),'0000-00-00')
where termdate='';

Alter table hr
modify column termdate date;

update hr
set Hire_date = case
when hire_date like '%/%' then date_format(str_to_date(hire_date,'%m/%d/%Y'),'%Y-%m-%d')
when hire_date like '%-%' then date_format(str_to_date(hire_date,'%m-%d-%Y'),'%Y-%m-%d')
else null
end;

Alter table hr
modify column hire_date date;

describe hr;

select hire_date from hr;

update hr
set termdate = date(str_to_date(termdate,'%Y-%m-%d %H:%i:%s UTC'))
where termdate is not null and termdate = '';

select termdate from hr;

Select * from hr;

Alter table hr
Add column Age int;
Select * from hr;

update hr
set Age = timestampdiff(Year, birthdate, curdate());
Select * from hr;

Select
min(age) as youngest,
max(age) as oldest
from hr; 

select count(*) from hr
where age < 18;