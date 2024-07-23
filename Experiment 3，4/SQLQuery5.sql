use GlobalToyz_0433;

-- ������ͳ�ƹ�������Ʒ������
select 
    s.cCity as City,
    tb.cBrandName as BrandName,
    count(*) as PurchaseCount
from Orders_0433 o
join 
    OrderDetails_0433 od on o.cOrderNo = od.cOrderNo
join 
    Toys_0433 t on od.cToyId = t.cToyId
join 
    ToyBrand_0433 tb on t.cBrandId = tb.cBrandId
join 
    Shopper_0433 s on o.cShopperId = s.cShopperId
group by 
    s.cCity, tb.cBrandName
order by 
    s.cCity, PurchaseCount desc;
