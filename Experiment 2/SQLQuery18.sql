use GlobalToyz_0433;

--查找已收货定单的定单号码以及下定单的时间
select
	Orders_0433.cOrderNo as OrderNumber,
	Orders_0433.dOrderDate as OrderDate
from Orders_0433
where Orders_0433.cOrderNo in(
	select Shipment_0433.cOrderNo
	from Shipment_0433
	where Shipment_0433.cDeliveryStatus = 'd'
);