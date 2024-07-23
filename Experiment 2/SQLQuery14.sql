use GlobalToyz_0433;

--查找所有购物者的名字和他们的简称
select
	concat(substring(vFirstName,1,1),'.',substring(vLastName,1,1)) as Initials,
	vFirstName,
	vLastName
from Shopper_0433;