use CAP_0433;

--distinctȷ��ÿ���ͻ��� discnt ֵֻ����һ�Σ���ʹ�ÿͻ��ж����������500
update Customers_0433
set discnt = discnt + 2
where cid in(
	select distinct cid from Orders_0433 
	where dollars > 500
);