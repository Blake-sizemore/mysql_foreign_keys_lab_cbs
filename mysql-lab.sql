create schema chirper_sql;
use chirper_sql;

create table users (
id int auto_increment ,
handle varchar(50) unique not null,
email varchar(50) unique not null,
created_at datetime default current_timestamp,
primary key (id)
);

create table chirps (
id int auto_increment ,
user_id int,
body varchar(50) not null,
location varchar(50),
created_at datetime default current_timestamp,
primary key (id),
foreign key (user_id) references users (id)
);

create table mentions (
chirps_id INT,
users_id INT,
primary key (chirps_id,user_id),
foreign key (chirps_id) references chirps (id),
foreign key (user_id) references users (id)
);

-- insert 5 users

insert into users (handle,email) values 
( '1Susan', 'yogi@hotmail.com'),
('2Blaine', 'brinkhouse@hotmail.com'),
('3hZach-', 'masterHere@hotmail.com'),
('4Sarah', 'westhouse@hotmail.com'),
('5finland', 'lookaround@hotmail.com');

insert into users (handle,email) values  ( '6random', 'nochirp@chirpmail.com');

-- test insert for chirp
insert into chirps (body,location,user_id) values 
('This user test body number @6random', 'atlanta',1),
('this  user test body number 2Blaine', 'detroit',1),
('this  user test body number @3hZach-', 'chicago',1),
('this  user test body number @6random', 'washington d.c.',1),
('this  user test body number @5finland', 'boston',1);

-- completed insert to chirps
insert into chirps (body,location,user_id) values 
('This user 2 body number @1Susan', 'orlando',2),
('this user 2 body number ', 'memphis',2),
('this user 2 body number @3hZach-', 'new york city',2),
('this user 2 body number @4Sarah', 'washington d.c.',2),
('this user 2 body number @5finland', 'reno',2),
('This user 3 body number 1Susan', 'orlando',3),
('this user 3 body number 2Blaine', 'memphis',3),
('this user 3 body number 3hZach-', 'new york city',3),
('this user 3 body number 4Sarah', 'washington d.c.',3),
('this user 3 body number 5finland', 'reno',3),
('This user 4 body number 1', 'miami',4),
('this user 4 body number 2', 'los angelas',4),
('this user 4 body number @6random', 'portland',4),
('this user 4 body number 4', 'kansas city',4),
('this user 4 body number 5', 'las vegas',4),
('This user 5 body number 1', 'green bay',5),
('this user 5 body number 2', 'new orleans',5),
('this user 5 body number 3', 'roswell',5),
('this user 5 body number 4', 'brooklyn',5),
('this user 5 body number @6random', 'cape town',5);

Select * from users;
-- create chirps with one to many table FK user_id ref users (id)
Select * from chirps;
Select * from mentions;

insert into users (handle,email) values  ( '6random', 'nochirp@chirpmail.com');

Select c.*, c.created_at as chirptime, u.handle as username, u.email from chirps as c join users as u  on u.id = c.user_id;
Select c.*, c.created_at as c_timestamp, u.handle as username, u.email, u.created_at as u_timestamp  from chirps as c join users as u  on u.id = c.user_id;
Select c.*, c.created_at as c_timestamp, u.handle as username, u.email, u.created_at as u_timestamp  from chirps as c right join users as u  on u.id = c.user_id;
drop tables chirps;