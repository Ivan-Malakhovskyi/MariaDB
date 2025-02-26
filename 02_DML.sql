select concat(first_name," ", last_name) as fullname, birthdate 
	from authors 
	where birthdate between "2010-01-22" and "2020-01-12"  limit 10;

select id, name, price 
	from practice_1 
	where id in(1,3,10);

select id, name, price
	from practice_1
	where name like 'a_';

select first_name, birthdate 
	from authors 
	where birthdate regexp '1980-[0-9]{2}-16';


select * from authors limit 10;

select year(birthdate) as year from authors
	group by year;

select AVG(price) as avgverage from practice_1;
select min(price) as minPrice from practice_1;
select max(price) as maxPrice from practice_1 p;
select group_concat(name) as concat_name from employee
 limit 10;
select SUM(price) as sum from practice_1;
select first_name, last_name from authors 
order by first_name, last_name;
select first_name as name from authors a 
order by name;

select id, first_name, email from 
	authors limit 10 offset 20;

select id, first_name, email from authors 
	where id > 4980
	limit 10;

select * from 
 authors where id > 9000
	and first_name = 'john' 
	and last_name = 'kLing';

select t1.name, t2.name 
	from practice_1 t1, employee t2
		where t1.name = t2.name;

select first_name, birthdate
	from authors 
	where birthdate between '2010-01-12' and '2010-06-22';

select first_name,birthdate 
	from authors 
	where id is null;

select id, first_name, email
	from authors
	where id in(1,2,6);

select id, first_name, email
	from authors
	where first_name like 'Joh_';

create fulltext index first_name_ft on authors(first_name, last_name);

select id, first_name 
	from authors 
	where match(first_name, last_name)
	against ('Hddw' in natural language mode) limit 4;

select id, first_name 
	from authors 
	where match(first_name, last_name)
	against ('+Jonh -ann' in boolean mode);


select id, floor(price/100) 
	from practice_1
	group by id, floor(price/100) 
	having price > 50;

create table departments (
id int unsigned auto_increment not null,
department varchar(100) null,
constraint departments_pk primary key(id)
)

insert into departments (id, department) values 
(1, 'Seller'),
(2, 'Engineer'),
(3, 'Cleaner'),
(4, 'Project Manager'),
(5, 'Support'),
(6, 'Boss');

create table employees (
id int unsigned auto_increment not null,
firstName varchar(100) not null,
lastName varchar(100) not null,
departmentId int unsigned null,
constraint employees_pk primary key (id),
constraint employees_departmentId_fk foreign key (departmentId) references departments(id)
);

insert into employees (id, firstName, lastName, departmentId) values 
(1,'Reagan','Kutch',1),
(2,'Fabiola','Schmidt',2),
(3,'Joe','Mraz',3),
(4,'Monique','Cassin',4),
(5,'Taryn','Mosciski',5),
(6,'Waino','Buckridge',NULL),
(7,'Julio','Hettinger',1),
(8,'Gardner','Marquardt',NULL),
(9,'Isai','Brakus',3),
(10,'Aiyana','Runolfsson',NULL);

-- INNER JOIN
select e.id as employeeId, e.firstName, e.lastName, e.departmentId, d.id as idInDepartments, d.department
	from employees as e
	inner join departments as d on d.id = e.departmentId;

-- LEFT JOIN
select e.id as employeeId, e.firstName, e.lastName, e.departmentId, d.id as idInDepartments, d.department
	from employees as e
	left join departments as d on d.id = e.departmentId;

-- RIGHT JOIN
select e.id as employeeId, e.firstName, e.lastName, e.departmentId, d.id as idInDepartments, d.department
	from employees as e
	right join departments as d on d.id = e.departmentId;

-- CROSS JOIN
select e.id as employeeId, e.firstName, e.lastName, e.departmentId, d.id as idInDepartments, d.department
	from employees as e
	cross join departments as d;

	(select e.id as employeeId, e.firstName, e.lastName, e.departmentId
	from employees as e
	where e.id = 3
	)
union 
(select e.id as employeeId, e.firstName, e.lastName, e.departmentId
	from employees as e
	inner join departments as d on d.id = e.departmentId
	where d.department = 'Seller'
	
)
order by employeeId;

select country.name 
	from country 
	where country.code not in 
	(
	select city.countryCode	
		from city
		where city.population >= 1000000
	)
	limit 10;
	
select country.name, (select count(*) from city where city.countryCode = country.code) as cityCount
	from country 
	order by cityCount asc; 