use GlobalToyz_0433;

--�������й����ߵ����ֺ����ǵļ��
select
	concat(substring(vFirstName,1,1),'.',substring(vLastName,1,1)) as Initials,
	vFirstName,
	vLastName
from Shopper_0433;