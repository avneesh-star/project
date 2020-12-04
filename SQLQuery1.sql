use db_project
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