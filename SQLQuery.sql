create database db_project
use db_project

create table tbl_course
(
course_id int primary key identity,
course_name varchar(50),
inseted_date date,
course_status int default 1
)
 insert into tbl_course(course_name,inseted_date) values('BCA',GETDATE()),('B.tech',GETDATE())
 truncate table tbl_course
 select * from tbl_course
create table tbl_country
(
country_id int primary key identity,
country_name varchar(50),
inseted_date date,
country_status int default 1
)

select * from tbl_country

create table tbl_userRegistration
(
user_id int primary key identity,
user_name varchar(50),
user_email varchar(50),
user_password varchar(50),
user_gender int,
user_course int, 
inserted_date date,
user_status int default 1
)

alter procedure sp_tbl_userRegistration_insert
@user_name varchar(50),
@user_email varchar(50),
@user_password varchar(50),
@user_gender int,
@user_course int
as
begin
insert into tbl_userRegistration(user_name,user_email,user_password,user_gender,user_course,inserted_date) values(@user_name,@user_email,@user_password,@user_gender,@user_course,GETDATE())
end

select * from tbl_userRegistration
alter procedure sp_tbl_registration_join
as
begin
select tbl_userRegistration.user_id,tbl_userRegistration.user_name,tbl_userRegistration.user_email,tbl_userRegistration.user_gender,convert(varchar(50),inserted_date,106) as abc,tbl_userRegistration.inserted_date,tbl_course.course_name from tbl_userRegistration join tbl_course on tbl_userRegistration.user_course=tbl_course.course_id
end

create procedure sp_tbl_course_insert
@course_name varchar(50)
as
begin
insert into tbl_course(course_name,inseted_date) values(@course_name,GETDATE())
end

alter procedure sp_tbl_course_select
as
begin
select *, convert(varchar(50),inseted_date,106) as abc from tbl_course where course_status=1
end

create proc  sp_tbl_course_delete
@course_id int
as
begin
update tbl_course set course_status=0 where course_id=@course_id
end

create proc sp_tbl_course_edit
@course_id int
as
begin
select * from tbl_course where course_id=@course_id
end

create procedure sp_tbl_course_update
@course_id int,
@course_name varchar(50)
as
begin
update tbl_course set course_name=@course_name , inseted_date=GETDATE() where course_id=@course_id
end


update tbl_course set course_status=1 where course_status=0
select * from tbl_course

select * from tbl_country

create procedure sp_tbl_country_insert
@country_name varchar(50)
as
begin
insert into tbl_country(country_name,inseted_date) values(@country_name,GETDATE())
end

create procedure sp_tbl_country_select
as
begin
select *, convert(varchar(50),inseted_date,106) as abc from tbl_country where country_status=1
end


create proc  sp_tbl_country_delete
@country_id int
as
begin
update tbl_country set country_status=0 where country_id=@country_id
end

create proc sp_tbl_country_edit
@country_id int
as
begin
select * from tbl_country where country_id=@country_id
end


create procedure sp_tbl_country_update
@country_id int,
@country_name varchar(50)
as
begin
update tbl_country set country_name=@country_name , inseted_date=GETDATE() where country_id=@country_id
end

update tbl_country set country_status=1 where country_status=0
select * from tbl_country

select * from tbl_course where course_status=1

create procedure sp_tbl_userRegistration_delete
@uid int
as
begin
update tbl_userRegistration set user_status=0 where user_id=@uid
end

sp_helptext sp_tbl_registration_join
alter procedure sp_tbl_registration_join  
as  
begin  
select tbl_userRegistration.user_id,tbl_userRegistration.user_name,tbl_userRegistration.user_email,tbl_userRegistration.user_gender,convert(varchar(50),inserted_date,106) as abc,tbl_userRegistration.inserted_date,tbl_course.course_name from tbl_userRegistration join tbl_course on tbl_userRegistration.user_course=tbl_course.course_id  where tbl_userRegistration.user_status=1
end

create proc sp_tbl_registration_edit 1
@user_id int
as
begin
select * from tbl_userRegistration where user_id=@user_id
end

create proc sp_tbl_userRegistration_update
@user_id int,
@user_name varchar(50),
@user_email varchar(50),
@user_password varchar(50),
@user_gender int,
@user_course int
as
begin
update tbl_userRegistration set user_name=@user_name,user_email=@user_email,user_password=@user_password,user_gender=@user_gender,user_course=@user_course,inserted_date=GETDATE() where user_id=@user_id
end


create table tbl_recruiterRegistratioin
(
recruiter_id int primary key identity,
compnay_name varchar(50),
email varchar(50),
password varchar(50),
compnay_url varchar(50),
contact_person varchar(50),
contact_number bigint,
address varchar(100),
inserted_date date,
status int default 1
)

create proc sp_tbl_recruiterRegistratioin_insert
@compnay_name varchar(50),
@email varchar(50),
@password varchar(50),
@compnay_url varchar(50),
@contact_person varchar(50),
@contact_number bigint,
@address varchar(100)
as
begin
insert into tbl_recruiterRegistratioin(compnay_name,email,password,compnay_url,contact_person,contact_person,address,inserted_date) values(@compnay_name,@email,@password,@compnay_url,@con)
end

alter proc sp_tbl_recruiterRegistratioin_get
as
begin
select *,convert(varchar(20),inserted_date,106)rdate from tbl_recruiterRegistratioin where status=1
end

create proc sp_tbl_recruiterRegistratioin_delete
@rid int
as
begin
update tbl_recruiterRegistratioin set status=0 where recruiter_id=@rid
end

create proc sp_tbl_recruiterRegistratioin_edit
@rid int
as
begin
select * from tbl_recruiterRegistratioin where recruiter_id=@rid
end

create table tbl_admin
(
admin_id int primary key identity,
admin_name varchar(50),
admin_email varchar(50),
password varchar(50),
)

insert into tbl_admin(admin_name,admin_email,password) values('Admin','admin','admin');

create proc sp_admin_login 'admin','admin'
@email varchar(50),
@password varchar(50)
as
begin
select * from tbl_admin where admin_email=@email and password=@password
end

create proc sp_user_login
@email varchar(50),
@password varchar(50)
as
begin
select * from tbl_userRegistration where user_email=@email and user_password=@password
end

create proc sp_recruiter_login
@email varchar(50),
@password varchar(50)
as
begin
select * from tbl_recruiterRegistratioin where email=@email and password=@password
end

sp_helptext sp_tbl_registration_join

alter procedure sp_tbl_registration_get_by_user  
@user_id int
as    
begin    
select tbl_userRegistration.user_id,tbl_userRegistration.user_name,tbl_userRegistration.user_email,tbl_userRegistration.user_gender,convert(varchar(50),inserted_date,106) as abc,tbl_userRegistration.inserted_date,tbl_course.course_name from tbl_userRegistration join tbl_course on tbl_userRegistration.user_course=tbl_course.course_id  where tbl_userRegistration.user_status=1  and tbl_userRegistration.user_id=@user_id
end