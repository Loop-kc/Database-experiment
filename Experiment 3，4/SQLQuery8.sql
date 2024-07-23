--创建用户
use GlobalToyz_0433;
-- 创建登录名
create login user_0433 with password = '123456';
-- 创建数据库用户
create user user_0433 for login user_0433;
go

-- 创建视图，仅包含2017年以前的订单数据
create view OrdersBefore2017_0433 as
select * from Orders_0433
where dOrderDate < '2017-01-01';
go

-- 授予用户访问视图的权限
grant select on OrdersBefore2017_0433 to user_0433;
-- 拒绝用户访问Orders_0433表的权限
deny select on Orders_0433 to user_0433;



