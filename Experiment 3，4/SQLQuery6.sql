use GlobalToyz_0433;
go
-- 定义视图，包括订单的编号、时间、金额以及收货人的姓名、国家代码和国家名称
create view OrderSummary_0433 as
select
    o.cOrderNo as OrderNumber,
    o.dOrderDate as OrderDate,
    o.mTotalCost as OrderAmount,
    r.vFirstName + ' ' + r.vLastName as RecipientName,
    r.cCountryId as CountryCode,
    c.cCountry as CountryName
from Orders_0433 o
join 
    Recipient_0433 r on o.cOrderNo = r.cOrderNo
join 
    Country_0433 c on r.cCountryId = c.cCountryId;

