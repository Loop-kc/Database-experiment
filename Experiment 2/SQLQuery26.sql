use GlobalToyz_0433;

-- ������ʱ���� Toys_0433 ���е�����
select *
into Toys_0433_backup
from Toys_0433
where cBrandId = (select cBrandId from ToyBrand_0433 where cBrandName = 'Largo');

-- ������ʱ���� ShoppingCart_0433 ���е�����
select *
into ShoppingCart_0433_backup
from ShoppingCart_0433
where cToyId in (select cToyId from Toys_0433 where cBrandId = (select cBrandId from ToyBrand_0433 where cBrandName = 'Largo'));

-- ������ʱ���� OrderDetails_0433 ���е�����
select *
into OrderDetails_0433_backup
from OrderDetails_0433
where cToyId in (select cToyId from Toys_0433 where cBrandId = (select cBrandId from ToyBrand_0433 where cBrandName = 'Largo'));