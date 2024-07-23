use GlobalToyz_0433;

select
--区分记录的来源
	'Shopper' as Role,
	vFirstName as FirstName,
    vLastName as LastName,
    vAddress as [Address],
    cCity as City
from Shopper_0433
--将购买者和收货人的结果集合并，并保留所有重复记录
union all
select 
	'Recipient' as Role,
    vFirstName as FirstName,
    vLastName as LastName,
    vAddress as [Address],
    cCity as City
from Recipient_0433;