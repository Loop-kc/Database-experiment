use GlobalToyz_0433;

-- 查找从来没有下过订单的顾客
select
    Shopper_0433.cShopperId,
    Shopper_0433.vFirstName,
    Shopper_0433.vLastName
from Shopper_0433 
left join
    Orders_0433 on Shopper_0433.cShopperId = Orders_0433.cShopperId
where Orders_0433.cShopperId is null;