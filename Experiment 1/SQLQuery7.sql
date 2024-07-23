use CAP_0433;

--distinct确保每个客户的 discnt 值只增加一次，即使该客户有多个订单金额超过500
update Customers_0433
set discnt = discnt + 2
where cid in(
	select distinct cid from Orders_0433 
	where dollars > 500
);