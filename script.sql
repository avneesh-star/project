USE [master]
GO
/****** Object:  Database [db_project]    Script Date: 25-12-2020 20:18:08 ******/
CREATE DATABASE [db_project]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db_project', FILENAME = N'E:\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\db_project.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'db_project_log', FILENAME = N'E:\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\db_project_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [db_project] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_project].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_project] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db_project] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db_project] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db_project] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db_project] SET ARITHABORT OFF 
GO
ALTER DATABASE [db_project] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [db_project] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db_project] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db_project] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db_project] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db_project] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db_project] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db_project] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db_project] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db_project] SET  DISABLE_BROKER 
GO
ALTER DATABASE [db_project] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db_project] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db_project] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db_project] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db_project] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db_project] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db_project] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db_project] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [db_project] SET  MULTI_USER 
GO
ALTER DATABASE [db_project] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db_project] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db_project] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db_project] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [db_project] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [db_project] SET QUERY_STORE = OFF
GO
USE [db_project]
GO
/****** Object:  Table [dbo].[tbl_admin]    Script Date: 25-12-2020 20:18:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_admin](
	[admin_id] [int] IDENTITY(1,1) NOT NULL,
	[admin_name] [varchar](50) NULL,
	[admin_email] [varchar](50) NULL,
	[password] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[admin_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_bloodgroup]    Script Date: 25-12-2020 20:18:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_bloodgroup](
	[bg_id] [int] IDENTITY(1,1) NOT NULL,
	[bg_name] [varchar](50) NULL,
	[inserted_date] [date] NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[bg_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_city]    Script Date: 25-12-2020 20:18:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_city](
	[city_id] [int] IDENTITY(1,1) NOT NULL,
	[city_name] [varchar](50) NULL,
	[stateID] [int] NULL,
	[coutnryID] [int] NULL,
	[inserted_date] [date] NULL,
	[city_status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[city_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_country]    Script Date: 25-12-2020 20:18:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_country](
	[country_id] [int] IDENTITY(1,1) NOT NULL,
	[country_name] [varchar](50) NULL,
	[inseted_date] [date] NULL,
	[country_status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[country_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_course]    Script Date: 25-12-2020 20:18:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_course](
	[course_id] [int] IDENTITY(1,1) NOT NULL,
	[course_name] [varchar](50) NULL,
	[inseted_date] [date] NULL,
	[course_status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[course_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_jobPost]    Script Date: 25-12-2020 20:18:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_jobPost](
	[job_id] [int] IDENTITY(1,1) NOT NULL,
	[company_id] [int] NULL,
	[jobProfile_id] [int] NULL,
	[min_exp] [int] NULL,
	[max_exp] [int] NULL,
	[min_salary] [int] NULL,
	[max_salary] [int] NULL,
	[vacancies] [int] NULL,
	[comment] [varchar](2000) NULL,
	[added_date] [date] NULL,
	[job_status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[job_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_jobProfile]    Script Date: 25-12-2020 20:18:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_jobProfile](
	[jp_id] [int] IDENTITY(1,1) NOT NULL,
	[jp_name] [varchar](50) NULL,
	[added_date] [date] NULL,
	[jp_status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[jp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_recruiterRegistratioin]    Script Date: 25-12-2020 20:18:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_recruiterRegistratioin](
	[recruiter_id] [int] IDENTITY(1,1) NOT NULL,
	[compnay_name] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[compnay_url] [varchar](50) NULL,
	[contact_person] [varchar](50) NULL,
	[contact_number] [bigint] NULL,
	[address] [varchar](100) NULL,
	[inserted_date] [date] NULL,
	[status] [int] NULL,
	[countryID] [int] NULL,
	[stateID] [int] NULL,
	[cityID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[recruiter_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_skills]    Script Date: 25-12-2020 20:18:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_skills](
	[skill_id] [int] IDENTITY(1,1) NOT NULL,
	[skill_name] [varchar](50) NULL,
	[jp_id] [int] NULL,
	[added_date] [date] NULL,
	[skill_status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[skill_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_state]    Script Date: 25-12-2020 20:18:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_state](
	[state_id] [int] IDENTITY(1,1) NOT NULL,
	[state_name] [varchar](50) NULL,
	[countryID] [int] NULL,
	[inserted_date] [date] NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[state_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_userRegistration]    Script Date: 25-12-2020 20:18:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_userRegistration](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[user_name] [varchar](50) NULL,
	[user_email] [varchar](50) NULL,
	[user_password] [varchar](50) NULL,
	[user_gender] [int] NULL,
	[user_course] [int] NULL,
	[inserted_date] [date] NULL,
	[user_status] [int] NULL,
	[user_resume] [varchar](100) NULL,
	[user_image] [varchar](100) NULL,
	[user_dob] [date] NULL,
	[countryID] [int] NULL,
	[stateID] [int] NULL,
	[cityID] [int] NULL,
	[jobprofileID] [int] NULL,
	[user_skill] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_admin] ON 

INSERT [dbo].[tbl_admin] ([admin_id], [admin_name], [admin_email], [password]) VALUES (1, N'Admin', N'admin', N'admin')
SET IDENTITY_INSERT [dbo].[tbl_admin] OFF
SET IDENTITY_INSERT [dbo].[tbl_bloodgroup] ON 

INSERT [dbo].[tbl_bloodgroup] ([bg_id], [bg_name], [inserted_date], [status]) VALUES (1, N'A+', CAST(N'2020-12-13' AS Date), 1)
INSERT [dbo].[tbl_bloodgroup] ([bg_id], [bg_name], [inserted_date], [status]) VALUES (2, N'A-', CAST(N'2020-12-13' AS Date), 1)
INSERT [dbo].[tbl_bloodgroup] ([bg_id], [bg_name], [inserted_date], [status]) VALUES (3, N'B+', CAST(N'2020-12-13' AS Date), 1)
INSERT [dbo].[tbl_bloodgroup] ([bg_id], [bg_name], [inserted_date], [status]) VALUES (4, N'B-', CAST(N'2020-12-13' AS Date), 1)
INSERT [dbo].[tbl_bloodgroup] ([bg_id], [bg_name], [inserted_date], [status]) VALUES (5, N'B+h', CAST(N'2020-12-13' AS Date), 0)
INSERT [dbo].[tbl_bloodgroup] ([bg_id], [bg_name], [inserted_date], [status]) VALUES (6, N'AB+', CAST(N'2020-12-13' AS Date), 1)
INSERT [dbo].[tbl_bloodgroup] ([bg_id], [bg_name], [inserted_date], [status]) VALUES (7, N'AB-', CAST(N'2020-12-13' AS Date), 1)
INSERT [dbo].[tbl_bloodgroup] ([bg_id], [bg_name], [inserted_date], [status]) VALUES (8, N'O+', CAST(N'2020-12-14' AS Date), 1)
SET IDENTITY_INSERT [dbo].[tbl_bloodgroup] OFF
SET IDENTITY_INSERT [dbo].[tbl_city] ON 

INSERT [dbo].[tbl_city] ([city_id], [city_name], [stateID], [coutnryID], [inserted_date], [city_status]) VALUES (1, N'Kanpur', 1, 1, CAST(N'2020-12-14' AS Date), 1)
INSERT [dbo].[tbl_city] ([city_id], [city_name], [stateID], [coutnryID], [inserted_date], [city_status]) VALUES (2, N'Patna', 2, 1, CAST(N'2020-12-14' AS Date), 1)
INSERT [dbo].[tbl_city] ([city_id], [city_name], [stateID], [coutnryID], [inserted_date], [city_status]) VALUES (3, N'Sivan', 2, 1, CAST(N'2020-12-14' AS Date), 0)
INSERT [dbo].[tbl_city] ([city_id], [city_name], [stateID], [coutnryID], [inserted_date], [city_status]) VALUES (4, N'new york', 3, 2, CAST(N'2020-12-14' AS Date), 1)
INSERT [dbo].[tbl_city] ([city_id], [city_name], [stateID], [coutnryID], [inserted_date], [city_status]) VALUES (5, N'Pilibhit', 1, 1, CAST(N'2020-12-14' AS Date), 1)
SET IDENTITY_INSERT [dbo].[tbl_city] OFF
SET IDENTITY_INSERT [dbo].[tbl_country] ON 

INSERT [dbo].[tbl_country] ([country_id], [country_name], [inseted_date], [country_status]) VALUES (1, N'India', CAST(N'2020-11-27' AS Date), 1)
INSERT [dbo].[tbl_country] ([country_id], [country_name], [inseted_date], [country_status]) VALUES (2, N'USA', CAST(N'2020-11-27' AS Date), 1)
INSERT [dbo].[tbl_country] ([country_id], [country_name], [inseted_date], [country_status]) VALUES (3, N'Japan', CAST(N'2020-11-27' AS Date), 1)
INSERT [dbo].[tbl_country] ([country_id], [country_name], [inseted_date], [country_status]) VALUES (4, N'New Zealand', CAST(N'2020-11-27' AS Date), 0)
INSERT [dbo].[tbl_country] ([country_id], [country_name], [inseted_date], [country_status]) VALUES (5, N'pakistan', CAST(N'2020-11-27' AS Date), 0)
INSERT [dbo].[tbl_country] ([country_id], [country_name], [inseted_date], [country_status]) VALUES (6, N'Taiwan', CAST(N'2020-12-11' AS Date), 1)
INSERT [dbo].[tbl_country] ([country_id], [country_name], [inseted_date], [country_status]) VALUES (7, N'Bhutan', CAST(N'2020-12-14' AS Date), 1)
SET IDENTITY_INSERT [dbo].[tbl_country] OFF
SET IDENTITY_INSERT [dbo].[tbl_course] ON 

INSERT [dbo].[tbl_course] ([course_id], [course_name], [inseted_date], [course_status]) VALUES (1, N'BCA', CAST(N'2020-11-27' AS Date), 1)
INSERT [dbo].[tbl_course] ([course_id], [course_name], [inseted_date], [course_status]) VALUES (2, N'B.tech', CAST(N'2020-11-27' AS Date), 1)
INSERT [dbo].[tbl_course] ([course_id], [course_name], [inseted_date], [course_status]) VALUES (3, N'M.Tech', CAST(N'2020-11-27' AS Date), 0)
INSERT [dbo].[tbl_course] ([course_id], [course_name], [inseted_date], [course_status]) VALUES (4, N'MBA', CAST(N'2020-11-27' AS Date), 0)
INSERT [dbo].[tbl_course] ([course_id], [course_name], [inseted_date], [course_status]) VALUES (5, N'BBA', CAST(N'2020-11-27' AS Date), 1)
INSERT [dbo].[tbl_course] ([course_id], [course_name], [inseted_date], [course_status]) VALUES (8, N'M.Tech', CAST(N'2020-12-11' AS Date), 1)
INSERT [dbo].[tbl_course] ([course_id], [course_name], [inseted_date], [course_status]) VALUES (9, N'MCA', CAST(N'2020-12-11' AS Date), 1)
INSERT [dbo].[tbl_course] ([course_id], [course_name], [inseted_date], [course_status]) VALUES (10, N'BCS', CAST(N'2020-12-11' AS Date), 1)
INSERT [dbo].[tbl_course] ([course_id], [course_name], [inseted_date], [course_status]) VALUES (11, N'MCS', CAST(N'2020-12-11' AS Date), 1)
SET IDENTITY_INSERT [dbo].[tbl_course] OFF
SET IDENTITY_INSERT [dbo].[tbl_jobPost] ON 

INSERT [dbo].[tbl_jobPost] ([job_id], [company_id], [jobProfile_id], [min_exp], [max_exp], [min_salary], [max_salary], [vacancies], [comment], [added_date], [job_status]) VALUES (1, 1, 2, 2, 2, 20000, 30000, 5, N'for Bangalore location', CAST(N'2020-12-15' AS Date), 1)
INSERT [dbo].[tbl_jobPost] ([job_id], [company_id], [jobProfile_id], [min_exp], [max_exp], [min_salary], [max_salary], [vacancies], [comment], [added_date], [job_status]) VALUES (2, 9, 3, 1, 1, 15000, 30000, 8, NULL, CAST(N'2020-12-15' AS Date), 0)
INSERT [dbo].[tbl_jobPost] ([job_id], [company_id], [jobProfile_id], [min_exp], [max_exp], [min_salary], [max_salary], [vacancies], [comment], [added_date], [job_status]) VALUES (3, 1, 2, 0, 0, 15000, 25000, 5, N'For noida location', CAST(N'2020-12-18' AS Date), 1)
INSERT [dbo].[tbl_jobPost] ([job_id], [company_id], [jobProfile_id], [min_exp], [max_exp], [min_salary], [max_salary], [vacancies], [comment], [added_date], [job_status]) VALUES (4, 1, 1, 2, 2, 30000, 45000, 15, N'For Hyderabad Location ', CAST(N'2020-12-18' AS Date), 0)
INSERT [dbo].[tbl_jobPost] ([job_id], [company_id], [jobProfile_id], [min_exp], [max_exp], [min_salary], [max_salary], [vacancies], [comment], [added_date], [job_status]) VALUES (5, 10, 1, 2, 2, 30000, 45000, 5, N'for gurgaon location', CAST(N'2020-12-24' AS Date), 1)
INSERT [dbo].[tbl_jobPost] ([job_id], [company_id], [jobProfile_id], [min_exp], [max_exp], [min_salary], [max_salary], [vacancies], [comment], [added_date], [job_status]) VALUES (6, 10, 2, 1, 1, 25000, 35000, 7, N'for noida', CAST(N'2020-12-25' AS Date), 0)
SET IDENTITY_INSERT [dbo].[tbl_jobPost] OFF
SET IDENTITY_INSERT [dbo].[tbl_jobProfile] ON 

INSERT [dbo].[tbl_jobProfile] ([jp_id], [jp_name], [added_date], [jp_status]) VALUES (1, N'Java', CAST(N'2020-12-15' AS Date), 1)
INSERT [dbo].[tbl_jobProfile] ([jp_id], [jp_name], [added_date], [jp_status]) VALUES (2, N'Python', CAST(N'2020-12-15' AS Date), 1)
INSERT [dbo].[tbl_jobProfile] ([jp_id], [jp_name], [added_date], [jp_status]) VALUES (3, N'.Net', CAST(N'2020-12-15' AS Date), 1)
INSERT [dbo].[tbl_jobProfile] ([jp_id], [jp_name], [added_date], [jp_status]) VALUES (4, N'php', CAST(N'2020-12-25' AS Date), 1)
INSERT [dbo].[tbl_jobProfile] ([jp_id], [jp_name], [added_date], [jp_status]) VALUES (5, N'SQL', CAST(N'2020-12-25' AS Date), 1)
SET IDENTITY_INSERT [dbo].[tbl_jobProfile] OFF
SET IDENTITY_INSERT [dbo].[tbl_recruiterRegistratioin] ON 

INSERT [dbo].[tbl_recruiterRegistratioin] ([recruiter_id], [compnay_name], [email], [password], [compnay_url], [contact_person], [contact_number], [address], [inserted_date], [status], [countryID], [stateID], [cityID]) VALUES (1, N'HCL Ltd', N'hr@hcl.com', N'123456', N'www.hcl.com', N'sonal', 7011254575, N'sector 12, noida,UP', CAST(N'2020-12-01' AS Date), 1, 1, 1, 1)
INSERT [dbo].[tbl_recruiterRegistratioin] ([recruiter_id], [compnay_name], [email], [password], [compnay_url], [contact_person], [contact_number], [address], [inserted_date], [status], [countryID], [stateID], [cityID]) VALUES (2, N'qualix information', N'hr@qualix.com', N'qlx13', N'www.qualix.co.in', N'priya', 9475231575, N'noida sector 14', CAST(N'2020-12-01' AS Date), 1, 1, 1, 1)
INSERT [dbo].[tbl_recruiterRegistratioin] ([recruiter_id], [compnay_name], [email], [password], [compnay_url], [contact_person], [contact_number], [address], [inserted_date], [status], [countryID], [stateID], [cityID]) VALUES (3, N'fdjoaspio', N'hfoipqh@gmail.com', N'132456', N'fdjsdoc.com', N'dsgasd', 123487, N'16489798', CAST(N'2020-12-07' AS Date), 0, 1, 1, 1)
INSERT [dbo].[tbl_recruiterRegistratioin] ([recruiter_id], [compnay_name], [email], [password], [compnay_url], [contact_person], [contact_number], [address], [inserted_date], [status], [countryID], [stateID], [cityID]) VALUES (4, N'airtel', N'hr@airtel.com', N'132465', N'www.airtel.com', N'Sangeeta', 94521253, N'Iffcco chock, gurgaon', CAST(N'2020-12-07' AS Date), 1, 1, 1, 1)
INSERT [dbo].[tbl_recruiterRegistratioin] ([recruiter_id], [compnay_name], [email], [password], [compnay_url], [contact_person], [contact_number], [address], [inserted_date], [status], [countryID], [stateID], [cityID]) VALUES (5, N'fdjoaspio', N'navneet@gmail.com', N'123456', N'fdjsdoc.com', N'dsgasd', 6489791566, N'sector 12, noida,UP', CAST(N'2020-12-07' AS Date), 0, 1, 1, 1)
INSERT [dbo].[tbl_recruiterRegistratioin] ([recruiter_id], [compnay_name], [email], [password], [compnay_url], [contact_person], [contact_number], [address], [inserted_date], [status], [countryID], [stateID], [cityID]) VALUES (6, N'fdjoaspio', N'avneesh@yahoo.com', N'admin', N'fdjsdoc.com', N'dsgasd', 56489, N'sector 12, noida,UP', CAST(N'2020-12-07' AS Date), 0, 1, 1, 1)
INSERT [dbo].[tbl_recruiterRegistratioin] ([recruiter_id], [compnay_name], [email], [password], [compnay_url], [contact_person], [contact_number], [address], [inserted_date], [status], [countryID], [stateID], [cityID]) VALUES (7, N'wipro', N'hr@wipro.com', N'123456', N'www.wipro.com', N'Rakesh', 72154215, N'Noida', CAST(N'2020-12-07' AS Date), 1, 1, 1, 1)
INSERT [dbo].[tbl_recruiterRegistratioin] ([recruiter_id], [compnay_name], [email], [password], [compnay_url], [contact_person], [contact_number], [address], [inserted_date], [status], [countryID], [stateID], [cityID]) VALUES (8, N'tecsidel india', N'hr@tecsidel.in', N'123456', N'www.tecsidel.in', N'Pradeep', 7845121254, N'Gurugram', CAST(N'2020-12-07' AS Date), 1, 1, 1, 1)
INSERT [dbo].[tbl_recruiterRegistratioin] ([recruiter_id], [compnay_name], [email], [password], [compnay_url], [contact_person], [contact_number], [address], [inserted_date], [status], [countryID], [stateID], [cityID]) VALUES (9, N'chetu india pvt ltd', N'hr@chetu.com', N'123456', N'www.chetu.com', N'pradeep', 7895154215, N'sector 62, noida,UP', CAST(N'2020-12-15' AS Date), 1, 1, 1, 1)
INSERT [dbo].[tbl_recruiterRegistratioin] ([recruiter_id], [compnay_name], [email], [password], [compnay_url], [contact_person], [contact_number], [address], [inserted_date], [status], [countryID], [stateID], [cityID]) VALUES (10, N'amazon', N'hr@amazon.in', N'123456', N'www.amazon.in', N'shreya', 7845125623, N'h45', CAST(N'2020-12-24' AS Date), 1, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[tbl_recruiterRegistratioin] OFF
SET IDENTITY_INSERT [dbo].[tbl_skills] ON 

INSERT [dbo].[tbl_skills] ([skill_id], [skill_name], [jp_id], [added_date], [skill_status]) VALUES (1, N'JAVA CORE', 1, CAST(N'2020-12-17' AS Date), 1)
INSERT [dbo].[tbl_skills] ([skill_id], [skill_name], [jp_id], [added_date], [skill_status]) VALUES (2, N'ASP.Net', 3, CAST(N'2020-12-17' AS Date), 1)
INSERT [dbo].[tbl_skills] ([skill_id], [skill_name], [jp_id], [added_date], [skill_status]) VALUES (3, N'Spring', 1, CAST(N'2020-12-17' AS Date), 1)
INSERT [dbo].[tbl_skills] ([skill_id], [skill_name], [jp_id], [added_date], [skill_status]) VALUES (4, N'oracle', 1, CAST(N'2020-12-17' AS Date), 1)
INSERT [dbo].[tbl_skills] ([skill_id], [skill_name], [jp_id], [added_date], [skill_status]) VALUES (5, N'MVC', 3, CAST(N'2020-12-17' AS Date), 1)
INSERT [dbo].[tbl_skills] ([skill_id], [skill_name], [jp_id], [added_date], [skill_status]) VALUES (6, N'SQL', 3, CAST(N'2020-12-17' AS Date), 1)
INSERT [dbo].[tbl_skills] ([skill_id], [skill_name], [jp_id], [added_date], [skill_status]) VALUES (7, N'Jquery', 3, CAST(N'2020-12-17' AS Date), 1)
INSERT [dbo].[tbl_skills] ([skill_id], [skill_name], [jp_id], [added_date], [skill_status]) VALUES (8, N'javascript', 3, CAST(N'2020-12-17' AS Date), 1)
INSERT [dbo].[tbl_skills] ([skill_id], [skill_name], [jp_id], [added_date], [skill_status]) VALUES (9, N'Angular', 3, CAST(N'2020-12-17' AS Date), 1)
INSERT [dbo].[tbl_skills] ([skill_id], [skill_name], [jp_id], [added_date], [skill_status]) VALUES (10, N'Django', 2, CAST(N'2020-12-17' AS Date), 1)
INSERT [dbo].[tbl_skills] ([skill_id], [skill_name], [jp_id], [added_date], [skill_status]) VALUES (11, N'Flask', 2, CAST(N'2020-12-17' AS Date), 1)
INSERT [dbo].[tbl_skills] ([skill_id], [skill_name], [jp_id], [added_date], [skill_status]) VALUES (12, N'Machine Learing', 2, CAST(N'2020-12-17' AS Date), 1)
INSERT [dbo].[tbl_skills] ([skill_id], [skill_name], [jp_id], [added_date], [skill_status]) VALUES (13, N'NumPy', 2, CAST(N'2020-12-17' AS Date), 1)
INSERT [dbo].[tbl_skills] ([skill_id], [skill_name], [jp_id], [added_date], [skill_status]) VALUES (14, N'JSP', 1, CAST(N'2020-12-17' AS Date), 1)
SET IDENTITY_INSERT [dbo].[tbl_skills] OFF
SET IDENTITY_INSERT [dbo].[tbl_state] ON 

INSERT [dbo].[tbl_state] ([state_id], [state_name], [countryID], [inserted_date], [status]) VALUES (1, N'Uttar Pradesh', 1, CAST(N'2020-12-13' AS Date), 1)
INSERT [dbo].[tbl_state] ([state_id], [state_name], [countryID], [inserted_date], [status]) VALUES (2, N'Bihar', 1, CAST(N'2020-12-13' AS Date), 1)
INSERT [dbo].[tbl_state] ([state_id], [state_name], [countryID], [inserted_date], [status]) VALUES (3, N'New York', 2, CAST(N'2020-12-13' AS Date), 1)
INSERT [dbo].[tbl_state] ([state_id], [state_name], [countryID], [inserted_date], [status]) VALUES (4, N'Osaka', 3, CAST(N'2020-12-14' AS Date), 1)
INSERT [dbo].[tbl_state] ([state_id], [state_name], [countryID], [inserted_date], [status]) VALUES (5, N'jk', 3, CAST(N'2020-12-14' AS Date), 0)
INSERT [dbo].[tbl_state] ([state_id], [state_name], [countryID], [inserted_date], [status]) VALUES (6, N'Kerla', 1, CAST(N'2020-12-14' AS Date), 1)
SET IDENTITY_INSERT [dbo].[tbl_state] OFF
SET IDENTITY_INSERT [dbo].[tbl_userRegistration] ON 

INSERT [dbo].[tbl_userRegistration] ([user_id], [user_name], [user_email], [user_password], [user_gender], [user_course], [inserted_date], [user_status], [user_resume], [user_image], [user_dob], [countryID], [stateID], [cityID], [jobprofileID], [user_skill]) VALUES (10, N'avneesh kumar', N'avneesh@yahoo.com', N'123456', 1, 2, CAST(N'2020-12-23' AS Date), 1, N'637443569661571847ResumeAvnish.doc', N'637443569661571847file000302.jpg', CAST(N'1995-12-07' AS Date), 1, 1, 1, 1, N'JAVA CORE,Spring,oracle')
INSERT [dbo].[tbl_userRegistration] ([user_id], [user_name], [user_email], [user_password], [user_gender], [user_course], [inserted_date], [user_status], [user_resume], [user_image], [user_dob], [countryID], [stateID], [cityID], [jobprofileID], [user_skill]) VALUES (11, N'Nikita', N'nikita@gmail.com', N'123456', 1, 8, CAST(N'2020-12-23' AS Date), 1, N'637443586990211979ResumeAvnish.doc', N'637443586990211979dosa.jpg', CAST(N'1993-06-15' AS Date), 1, 2, 2, 3, N'ASP.Net,MVC,javascript')
SET IDENTITY_INSERT [dbo].[tbl_userRegistration] OFF
ALTER TABLE [dbo].[tbl_bloodgroup] ADD  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[tbl_city] ADD  DEFAULT ((1)) FOR [city_status]
GO
ALTER TABLE [dbo].[tbl_country] ADD  DEFAULT ((1)) FOR [country_status]
GO
ALTER TABLE [dbo].[tbl_course] ADD  DEFAULT ((1)) FOR [course_status]
GO
ALTER TABLE [dbo].[tbl_jobPost] ADD  DEFAULT ((0)) FOR [job_status]
GO
ALTER TABLE [dbo].[tbl_jobProfile] ADD  DEFAULT ((1)) FOR [jp_status]
GO
ALTER TABLE [dbo].[tbl_recruiterRegistratioin] ADD  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[tbl_skills] ADD  DEFAULT ((1)) FOR [skill_status]
GO
ALTER TABLE [dbo].[tbl_state] ADD  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[tbl_userRegistration] ADD  CONSTRAINT [DF__tbl_userR__user___534D60F1]  DEFAULT ((1)) FOR [user_status]
GO
/****** Object:  StoredProcedure [dbo].[sp_admin_login]    Script Date: 25-12-2020 20:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_admin_login]
@email varchar(50),
@password varchar(50)
as
begin
select * from tbl_admin where admin_email=@email and password=@password
end
GO
/****** Object:  StoredProcedure [dbo].[sp_bloodgroup]    Script Date: 25-12-2020 20:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_bloodgroup]
@action varchar(50)=null,
@bg_id int=0,
@bg_name varchar(50)=null	
as
begin
if(@action='insert')
	begin
	insert into tbl_bloodgroup(bg_name,inserted_date)  values(@bg_name,getdate())
	end
else if(@action='update')
	begin
	update tbl_bloodgroup set bg_name=@bg_name where bg_id=@bg_id
	end
else if(@action='delete')
	begin
	update tbl_bloodgroup set status=0 where bg_id=@bg_id
	end
else if(@action='edit')
	begin
	select * from tbl_bloodgroup where bg_id=@bg_id
	end
else if(@action='select')
	begin
	select * from tbl_bloodgroup where status=1
	end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_calculateUserAge]    Script Date: 25-12-2020 20:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_calculateUserAge]
@user_id int
as
begin 
declare @dateofbirth date
Declare @currentdatetime date  
Declare @years varchar(40)  
Declare @months varchar(30)  
Declare @days varchar(30)    
set @currentdatetime =getdate()
select @dateofbirth=user_dob from tbl_userRegistration where user_id=@user_id
select @years=datediff(year,@dateofbirth ,@currentdatetime)-- To find Years  
select @months=datediff(month,@dateofbirth,@currentdatetime)-(datediff(year,@dateofbirth,@currentdatetime)*12)  
-- To Find Months  
select @days=datepart(d,@currentdatetime)-datepart(d,@dateofbirth)-- To Find Days  
select @years  +' years,   ' +@months +' months,   '+@days   +' days' asYearMonthDay

end
GO
/****** Object:  StoredProcedure [dbo].[sp_chengeRecruiterpassword]    Script Date: 25-12-2020 20:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_chengeRecruiterpassword]
@id int ,
@oldpass varchar(50),
@newpass varchar(50)
as
begin
update tbl_recruiterRegistratioin set password=@newpass where recruiter_id=@id and password=@oldpass
end
GO
/****** Object:  StoredProcedure [dbo].[sp_chengeUserpassword]    Script Date: 25-12-2020 20:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_chengeUserpassword]
@id int ,
@oldpass varchar(50),
@newpass varchar(50)
as
begin
update tbl_userRegistration set user_password=@newpass where user_id=@id and user_password=@oldpass
end
GO
/****** Object:  StoredProcedure [dbo].[sp_get_state_by_country]    Script Date: 25-12-2020 20:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_get_state_by_country]
@countryID int
as
begin
select * from tbl_state where countryID=@countryID and status=1
end
GO
/****** Object:  StoredProcedure [dbo].[sp_recruiter_login]    Script Date: 25-12-2020 20:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_recruiter_login]  
@email varchar(50),  
@password varchar(50)  
as  
begin  
select * from tbl_recruiterRegistratioin where email=@email and password=@password and status=1
end
GO
/****** Object:  StoredProcedure [dbo].[sp_recruiter_mail_check]    Script Date: 25-12-2020 20:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_recruiter_mail_check]
@email varchar(50)
as
begin
select * from tbl_recruiterRegistratioin where email=@email
end
GO
/****** Object:  StoredProcedure [dbo].[sp_state]    Script Date: 25-12-2020 20:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_state]
@state_id int=0,
@state_name varchar(50)=null,
@countryID int=0,
@action varchar(20)
as
begin
 if(@action='insert')
	begin
	insert into tbl_state(state_name,countryID,inserted_date) values(@state_name,@countryID,GETDATE())
	end
 else if(@action='update')
	begin
	update tbl_state set state_name=@state_name,countryID=@countryID where state_id=@state_id
	end
 else if(@action='delete')
     begin
	 update tbl_state set status=0 where state_id=@state_id
	 end
  else if(@action='edit')
     begin
	 select * from tbl_state where state_id=@state_id
	 end
else if(@action='select')
     begin
	 select * from tbl_state join tbl_country on tbl_state.countryID=tbl_country.country_id where status=1
	 end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_tbl_city]    Script Date: 25-12-2020 20:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_tbl_city]
@city_id int=0 ,
@city_name varchar(50)=null,
@stateID int=0,
@coutnryID int=0,
@action varchar(50)=null
as
begin
	if(@action='insert')
	begin
	insert into tbl_city(city_name,stateID,coutnryID,inserted_date) values(@city_name,@stateID,@coutnryID,GETDATE())
	end
	else if(@action='update')
	begin
	update tbl_city set city_name=@city_name, stateID=@stateID, coutnryID=@coutnryID where city_id=@city_id
	end
	else if(@action='delete')
	begin
	update tbl_city set city_status=0 where city_id=@city_id
	end
	else if(@action='edit')
	begin
	select * from tbl_city where city_id=@city_id
	end
	else if(@action='joinSelect')
	begin
	select * from tbl_city join tbl_state on tbl_city.stateID=tbl_state.state_id 
	join tbl_country on tbl_city.coutnryID=tbl_country.country_id where city_status=1
	end

end
GO
/****** Object:  StoredProcedure [dbo].[sp_tbl_city_select]    Script Date: 25-12-2020 20:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_tbl_city_select]
@state_id int
as
begin
select * from tbl_city where stateID=@state_id
end
GO
/****** Object:  StoredProcedure [dbo].[sp_tbl_country_delete]    Script Date: 25-12-2020 20:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc  [dbo].[sp_tbl_country_delete]
@country_id int
as
begin
update tbl_country set country_status=0 where country_id=@country_id
end
GO
/****** Object:  StoredProcedure [dbo].[sp_tbl_country_edit]    Script Date: 25-12-2020 20:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_tbl_country_edit]
@country_id int
as
begin
select * from tbl_country where country_id=@country_id
end
GO
/****** Object:  StoredProcedure [dbo].[sp_tbl_country_insert]    Script Date: 25-12-2020 20:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_tbl_country_insert]
@country_name varchar(50)
as
begin
insert into tbl_country(country_name,inseted_date) values(@country_name,GETDATE())
end
GO
/****** Object:  StoredProcedure [dbo].[sp_tbl_country_select]    Script Date: 25-12-2020 20:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_tbl_country_select]
as
begin
select *, convert(varchar(50),inseted_date,106) as abc from tbl_country where country_status=1
end
GO
/****** Object:  StoredProcedure [dbo].[sp_tbl_country_update]    Script Date: 25-12-2020 20:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_tbl_country_update]
@country_id int,
@country_name varchar(50)
as
begin
update tbl_country set country_name=@country_name , inseted_date=GETDATE() where country_id=@country_id
end
GO
/****** Object:  StoredProcedure [dbo].[sp_tbl_course_delete]    Script Date: 25-12-2020 20:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc  [dbo].[sp_tbl_course_delete]
@course_id int
as
begin
update tbl_course set course_status=0 where course_id=@course_id
end
GO
/****** Object:  StoredProcedure [dbo].[sp_tbl_course_edit]    Script Date: 25-12-2020 20:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_tbl_course_edit]
@course_id int
as
begin
select * from tbl_course where course_id=@course_id
end
GO
/****** Object:  StoredProcedure [dbo].[sp_tbl_course_insert]    Script Date: 25-12-2020 20:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_tbl_course_insert]
@course_name varchar(50)
as
begin
insert into tbl_course(course_name,inseted_date) values(@course_name,GETDATE())
end
GO
/****** Object:  StoredProcedure [dbo].[sp_tbl_course_select]    Script Date: 25-12-2020 20:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_tbl_course_select]
as
begin
select *, convert(varchar(50),inseted_date,106) as abc from tbl_course where course_status=1
end
GO
/****** Object:  StoredProcedure [dbo].[sp_tbl_course_update]    Script Date: 25-12-2020 20:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_tbl_course_update]
@course_id int,
@course_name varchar(50)
as
begin
update tbl_course set course_name=@course_name , inseted_date=GETDATE() where course_id=@course_id
end
GO
/****** Object:  StoredProcedure [dbo].[sp_tbl_jobPost]    Script Date: 25-12-2020 20:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_tbl_jobPost]   
@action varchar(20)=null,    
@job_id int=0,    
@company_id int=0,    
@jobProfile_id int=0,    
@min_exp int=0,    
@max_exp int=0,    
@min_salary int=0,    
@max_salary int=0,    
@vacancies int=0,    
@comment varchar(2000)=null    
as    
begin    
 if(@action='insert')    
  begin    
   insert into tbl_jobPost(company_id,jobProfile_id,min_exp,max_exp,min_salary,max_salary,vacancies,comment,added_date)    
   values(@company_id,@jobProfile_id,@min_exp,@max_exp,@min_salary,@max_salary,@vacancies,@comment,GETDATE())    
  end  
   if(@action='update')    
  begin    
   update tbl_jobPost set company_id=@company_id,jobProfile_id=@jobProfile_id,min_exp=@min_exp,max_exp=@max_exp,min_salary=@min_salary,max_salary=@max_salary,vacancies=@vacancies,comment=@comment where job_id=@job_id    
       
  end  
 else if(@action='selectAll')    
  begin    
   select * from tbl_jobPost join tbl_recruiterRegistratioin on tbl_jobPost.company_id=tbl_recruiterRegistratioin.recruiter_id    join tbl_jobProfile on tbl_jobPost.jobProfile_id=tbl_jobProfile.jp_id
  end    
 else if(@action='getApproved')    
  begin    
   select * from tbl_jobPost join tbl_recruiterRegistratioin on tbl_jobPost.company_id=tbl_recruiterRegistratioin.recruiter_id  join tbl_jobProfile on tbl_jobPost.jobProfile_id=tbl_jobProfile.jp_id where job_status=1    
  end
  else if(@action='selectbyjobtitle')    
  begin    
   select * from tbl_jobPost join tbl_recruiterRegistratioin on tbl_jobPost.company_id=tbl_recruiterRegistratioin.recruiter_id  join tbl_jobProfile on tbl_jobPost.jobProfile_id=tbl_jobProfile.jp_id where job_status=1 and jobProfile_id=@jobProfile_id    
  end
  else if(@action='search')    
  begin    
   select * from tbl_jobPost join tbl_recruiterRegistratioin on tbl_jobPost.company_id=tbl_recruiterRegistratioin.recruiter_id  join tbl_jobProfile on tbl_jobPost.jobProfile_id=tbl_jobProfile.jp_id where job_status=1 and jobProfile_id=@jobProfile_id    and max_salary>@max_salary
  end
  else if(@action='selectByCompanyID')    
  begin    
   select * from tbl_jobPost join tbl_recruiterRegistratioin on tbl_jobPost.company_id=tbl_recruiterRegistratioin.recruiter_id
   join tbl_jobProfile on tbl_jobPost.jobProfile_id=tbl_jobProfile.jp_id
   where company_id=@company_id   
  end  
  else if(@action='edit')    
  begin    
   select * from tbl_jobPost   where  job_id=@job_id  
  end  
  else if(@action='delete')    
  begin    
   delete from tbl_jobPost   where  job_id=@job_id  
  end 
  
  else if(@action='Company_email_by_jpid')    
  begin    
   select tbl_recruiterRegistratioin.email  from tbl_jobPost join tbl_recruiterRegistratioin on tbl_jobPost.company_id=tbl_recruiterRegistratioin.recruiter_id   where  job_id=@job_id  
  end 
end
GO
/****** Object:  StoredProcedure [dbo].[sp_tbl_jobPost_status_update]    Script Date: 25-12-2020 20:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_tbl_jobPost_status_update]
@job_id int
as
begin
declare @temp int
select @temp=job_status from tbl_jobPost where job_id=@job_id
	if(@temp=1)
		begin
			update tbl_jobPost set job_status=0 where job_id=@job_id
		end
	else if(@temp=0)
		begin
			update tbl_jobPost set job_status=1 where job_id=@job_id
		end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_tbl_jobProfile]    Script Date: 25-12-2020 20:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_tbl_jobProfile]
@action varchar(20)=null,
@jp_id int=0,
@jp_name varchar(50)=null
as
begin
	if(@action='insert')
	begin
	insert into tbl_jobProfile(jp_name,added_date) values(@jp_name,GETDATE())
	end
	else if(@action='update')
	begin
	update tbl_jobProfile set jp_name=@jp_name where jp_id=@jp_id
	end
	else if(@action='delete')
	begin
	update tbl_jobProfile set jp_status=0 where jp_id=@jp_id
	end
	else if(@action='edit')
	begin
	 select * from tbl_jobProfile where jp_id=@jp_id
	end
	else if(@action='get')
	begin
	 select *,convert(varchar(30),added_date,106) as abc from tbl_jobProfile where jp_status=1
	end
	
end
GO
/****** Object:  StoredProcedure [dbo].[sp_tbl_recruiterRegistratioin_delete]    Script Date: 25-12-2020 20:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_tbl_recruiterRegistratioin_delete]  
@rid int  
as  
begin  
declare @tp int
select @tp=status from tbl_recruiterRegistratioin where recruiter_id=@rid 
if(@tp=1)
begin
update tbl_recruiterRegistratioin set status=0 where recruiter_id=@rid 
end
else
begin
update tbl_recruiterRegistratioin set status=1 where recruiter_id=@rid
end
end 
GO
/****** Object:  StoredProcedure [dbo].[sp_tbl_recruiterRegistratioin_edit]    Script Date: 25-12-2020 20:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_tbl_recruiterRegistratioin_edit]
@rid int
as
begin
select * from tbl_recruiterRegistratioin where recruiter_id=@rid
end
GO
/****** Object:  StoredProcedure [dbo].[sp_tbl_recruiterRegistratioin_get]    Script Date: 25-12-2020 20:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_tbl_recruiterRegistratioin_get]    
as    
begin    
select *,convert(varchar(20),tbl_recruiterRegistratioin.inserted_date,106)rdate from tbl_recruiterRegistratioin 
join tbl_country on tbl_recruiterRegistratioin.countryID=tbl_country.country_id
join tbl_state on tbl_recruiterRegistratioin.stateID=tbl_state.state_id
join tbl_city on tbl_recruiterRegistratioin.cityID=tbl_city.city_id order by .tbl_recruiterRegistratioin.recruiter_id desc
end
GO
/****** Object:  StoredProcedure [dbo].[sp_tbl_recruiterRegistratioin_get_by_id]    Script Date: 25-12-2020 20:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_tbl_recruiterRegistratioin_get_by_id]  
@rid int  
as    
begin    
select *,convert(varchar(20),tbl_recruiterRegistratioin.inserted_date,106)rdate from tbl_recruiterRegistratioin
join tbl_country on tbl_recruiterRegistratioin.countryID=tbl_country.country_id
join tbl_state on tbl_recruiterRegistratioin.stateID=tbl_state.state_id
join tbl_city on tbl_recruiterRegistratioin.cityID=tbl_city.city_id
where tbl_recruiterRegistratioin.status=1  and recruiter_id=@rid  
end
GO
/****** Object:  StoredProcedure [dbo].[sp_tbl_recruiterRegistratioin_insert]    Script Date: 25-12-2020 20:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_tbl_recruiterRegistratioin_insert]  
@compnay_name varchar(50),  
@email varchar(50),  
@password varchar(50),  
@compnay_url varchar(50),  
@contact_person varchar(50),  
@contact_number bigint,  
@address varchar(100),
@countryID int,
@stateID int,
@cityID int
as  
begin  
insert into tbl_recruiterRegistratioin(compnay_name,email,password,compnay_url,contact_person,contact_number,address,inserted_date,countryID,stateID,cityID) values(@compnay_name,@email,@password,@compnay_url,@contact_person,@contact_number,@address,getdate(),@countryID,@stateID,@cityID)  
end
GO
/****** Object:  StoredProcedure [dbo].[sp_tbl_recruiterRegistratioin_update]    Script Date: 25-12-2020 20:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_tbl_recruiterRegistratioin_update]  
@recruiter_id int,  
@compnay_name varchar(50),  
@email varchar(50),  
@compnay_url varchar(50),  
@contact_person varchar(50),  
@contact_number bigint,  
@address varchar(100),
@countryID int,
@stateID int,
@cityID int
as  
begin  
update tbl_recruiterRegistratioin set compnay_name=@compnay_name, email=@email,compnay_url=@compnay_url,contact_person=@contact_person,contact_number=@contact_number,address=@address,countryID=@countryID,stateID=@stateID,cityID=@cityID where recruiter_id=@recruiter_id  
end
GO
/****** Object:  StoredProcedure [dbo].[sp_tbl_registration_edit]    Script Date: 25-12-2020 20:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_tbl_registration_edit]
@user_id int
as
begin
select * from tbl_userRegistration where user_id=@user_id
end
GO
/****** Object:  StoredProcedure [dbo].[sp_tbl_registration_get_by_user]    Script Date: 25-12-2020 20:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_tbl_registration_get_by_user]      
@user_id int    
as        
begin        
select *,convert(varchar(50),tbl_userRegistration.inserted_date,106) as abc from tbl_userRegistration 
join tbl_course on tbl_userRegistration.user_course=tbl_course.course_id 
join tbl_country on tbl_userRegistration.countryID=tbl_country.country_id
join tbl_state on tbl_userRegistration.stateID=tbl_state.state_id
join tbl_city on tbl_userRegistration.cityID=tbl_city.city_id
join tbl_jobProfile on tbl_userRegistration.jobprofileID=tbl_jobprofile.jp_id
  where tbl_userRegistration.user_status=1  and tbl_userRegistration.user_id=@user_id    
end
GO
/****** Object:  StoredProcedure [dbo].[sp_tbl_registration_join]    Script Date: 25-12-2020 20:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_tbl_registration_join]      
as      
begin      
select *,convert(varchar(50),inserted_date,106) as abc from tbl_userRegistration join tbl_course on tbl_userRegistration.user_course=tbl_course.course_id     
end  
GO
/****** Object:  StoredProcedure [dbo].[sp_tbl_skills]    Script Date: 25-12-2020 20:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_tbl_skills]
@skill_id int=0,
@skill_name varchar(50)=null,
@jp_id int=0,
@action varchar(30)
as
begin
	if(@action='insert')
		begin
			insert into tbl_skills(skill_name,jp_id,added_date) values(@skill_name,@jp_id,GETDATE())
		end
	else if(@action='update')
		begin
			update tbl_skills set skill_name=@skill_name,jp_id=@jp_id where skill_id=@skill_id
		end
	else if(@action='joinSelect')
		begin
			select * from tbl_skills join tbl_jobProfile on tbl_skills.jp_id=tbl_jobProfile.jp_id where skill_status=1 order by jp_name
		end
	else if(@action='get')
		begin
			select * from tbl_skills where skill_status=1
		end
		else if(@action='selectByjpid')
		begin
			select * from tbl_skills where jp_id=@jp_id and skill_status=1
		end
		else if(@action='edit')
		begin
			select * from tbl_skills where skill_id=@skill_id
		end
		else if(@action='delete')
		begin
			delete from tbl_skills where skill_id=@skill_id
		end
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_tbl_userRegistration_delete]    Script Date: 25-12-2020 20:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_tbl_userRegistration_delete]  
@uid int  
as  
begin  
 declare @tp int
 select @tp=user_status from tbl_userRegistration where user_id=@uid
 if(@tp=1)
 begin
 update tbl_userRegistration set user_status=0 where user_id=@uid 
 end
 else
 begin
 update tbl_userRegistration set user_status=1 where user_id=@uid 
 end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_tbl_userRegistration_insert]    Script Date: 25-12-2020 20:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_tbl_userRegistration_insert]  
@user_name varchar(50),  
@user_email varchar(50),  
@user_password varchar(50),  
@user_gender int,  
@user_course int,
@user_resume varchar(100),
@user_image varchar(100),
@user_dob date,
@countryID int,
@stateID INT,
@cityID INT,
@jobprofileID int,
@user_skill VARCHAR(100)
as  
begin  
insert into tbl_userRegistration(user_name,user_email,user_password,user_gender,user_course,inserted_date,user_resume,user_image,user_dob,countryID,stateID,cityID,jobprofileID,user_skill) 
values(@user_name,@user_email,@user_password,@user_gender,@user_course,GETDATE(),@user_resume,@user_image,@user_dob,@countryID,@stateID,@cityID,@jobprofileID,@user_skill)  
end
GO
/****** Object:  StoredProcedure [dbo].[sp_tbl_userRegistration_update]    Script Date: 25-12-2020 20:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_tbl_userRegistration_update]      
@user_id int,      
@user_name varchar(50),      
@user_email varchar(50),        
@user_gender int,      
@user_course int,  
@user_resume varchar(100),  
@user_image varchar(100),
@user_dob date,  
@countryID int,  
@stateID INT,  
@cityID INT,  
@jobprofileID int,  
@user_skill VARCHAR(100) 
as      
begin      
update tbl_userRegistration set user_name=@user_name,user_email=@user_email,user_gender=@user_gender,user_course=@user_course,user_resume=@user_resume,user_image=@user_image,user_dob=@user_dob,countryID=@countryID,stateID=@stateID,cityID=@cityID,jobprofileID=@jobprofileID,
user_skill=@user_skill where user_id=@user_id      
end
GO
/****** Object:  StoredProcedure [dbo].[sp_user_delete]    Script Date: 25-12-2020 20:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_user_delete]
@userid int
as
begin
delete from tbl_userRegistration where user_id=@userid
end
GO
/****** Object:  StoredProcedure [dbo].[sp_user_login]    Script Date: 25-12-2020 20:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_user_login]    
@email varchar(50),    
@password varchar(50)    
as    
begin    
select * from tbl_userRegistration where user_email=@email and user_password=@password    
end
GO
/****** Object:  StoredProcedure [dbo].[sp_user_mail_check]    Script Date: 25-12-2020 20:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_user_mail_check]
@user_email varchar(50)
as
begin
select * from tbl_userRegistration where user_email=@user_email
end
GO
USE [master]
GO
ALTER DATABASE [db_project] SET  READ_WRITE 
GO
