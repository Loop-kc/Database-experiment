use GlobalToyz_0433;

-- ���Ҵ���û���¹������Ĺ˿�
select
    Shopper_0433.cShopperId,
    Shopper_0433.vFirstName,
    Shopper_0433.vLastName
from Shopper_0433 
left join
    Orders_0433 on Shopper_0433.cShopperId = Orders_0433.cShopperId
where Orders_0433.cShopperId is null;