use GlobalToyz_0433;
-- 基于视图查询国家代码为‘001’的收货人的姓名和他们所下订单的笔数及订单的总金额
select
    RecipientName,
    count(OrderNumber) as OrderCount,
    sum(OrderAmount) as TotalOrderAmount
from OrderSummary_0433
where
    CountryCode = '001'
group by RecipientName;
