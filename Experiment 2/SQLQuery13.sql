use GlobalToyz_0433;

--������ߵ����ƺ�������ߵĹ��ﳵID�������߲��ڹ��ﳵ�У�Ҳ���ڽ���г���
select 
	Toys_0433.vToyName as ToyName,
	ShoppingCart_0433.cCartId as CartId
from Toys_0433
left join 
	ShoppingCart_0433 on Toys_0433.cToyId = ShoppingCart_0433.cToyId;