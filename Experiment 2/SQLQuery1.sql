/*      Install GlobalToyz_0433 database             */
set nocount on
USE master

declare @dttm varchar(55)
select @dttm = convert(varchar, getdate(), 113)
raiserror('Starting installation of GlobalToyz_0433 Database at %s ....', 1, 1, @dttm) with nowait
GO

if exists (select * from sysdatabases where name='GlobalToyz_0433')
begin
  raiserror('Dropping existing GlobalToyz_0433 database ....', 0, 1)
  DROP database GlobalToyz_0433
end
GO

CHECKPOINT
go

raiserror('Creating GlobalToyz_0433 database....', 0, 1)
go
CREATE DATABASE GlobalToyz_0433
GO

CHECKPOINT
GO

USE GlobalToyz_0433
GO

if db_name() <> 'GlobalToyz_0433'
   raiserror('Error in installToy.SQL, ''USE GlobalToyz_0433'' failed!  Killing the SPID now.', 22, 127) with log
GO

-- 设置数据库选项
ALTER DATABASE GlobalToyz_0433 SET RECOVERY SIMPLE
ALTER DATABASE GlobalToyz_0433 SET READ_WRITE
checkpoint