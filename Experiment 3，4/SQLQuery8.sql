--�����û�
use GlobalToyz_0433;
-- ������¼��
create login user_0433 with password = '123456';
-- �������ݿ��û�
create user user_0433 for login user_0433;
go

-- ������ͼ��������2017����ǰ�Ķ�������
create view OrdersBefore2017_0433 as
select * from Orders_0433
where dOrderDate < '2017-01-01';
go

-- �����û�������ͼ��Ȩ��
grant select on OrdersBefore2017_0433 to user_0433;
-- �ܾ��û�����Orders_0433���Ȩ��
deny select on Orders_0433 to user_0433;



