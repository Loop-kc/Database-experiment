use GlobalToyz_0433;

select
--���ּ�¼����Դ
	'Shopper' as Role,
	vFirstName as FirstName,
    vLastName as LastName,
    vAddress as [Address],
    cCity as City
from Shopper_0433
--�������ߺ��ջ��˵Ľ�����ϲ��������������ظ���¼
union all
select 
	'Recipient' as Role,
    vFirstName as FirstName,
    vLastName as LastName,
    vAddress as [Address],
    cCity as City
from Recipient_0433;