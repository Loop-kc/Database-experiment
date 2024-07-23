use GlobalToyz_0433;

-- 创建临时表备份 Toys_0433 表中的数据
select *
into Toys_0433_backup
from Toys_0433
where cBrandId = (select cBrandId from ToyBrand_0433 where cBrandName = 'Largo');

-- 创建临时表备份 ShoppingCart_0433 表中的数据
select *
into ShoppingCart_0433_backup
from ShoppingCart_0433
where cToyId in (select cToyId from Toys_0433 where cBrandId = (select cBrandId from ToyBrand_0433 where cBrandName = 'Largo'));

-- 创建临时表备份 OrderDetails_0433 表中的数据
select *
into OrderDetails_0433_backup
from OrderDetails_0433
where cToyId in (select cToyId from Toys_0433 where cBrandId = (select cBrandId from ToyBrand_0433 where cBrandName = 'Largo'));