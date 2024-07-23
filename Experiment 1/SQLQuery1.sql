-- 创建数据库 CAP_0433 
create database CAP_0433
on
(
    name = CAP_0433,
    filename = 'D:\sql\CAPData_0433.mdf', -- 文件名
    size = 50MB, -- 初始存储空间大小
    maxsize = 500MB,  -- 最大存储空间大小
    filegrowth = 10MB  -- 自动增长量
);


