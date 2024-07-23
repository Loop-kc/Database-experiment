use GlobalToyz_0433;

-- 查询 Toys_0433 表中是否还有 "Largo" 牌的玩具
select * from Toys_0433
where cBrandId = (select cBrandId from ToyBrand_0433 where cBrandName = 'Largo');

-- 查询 ShoppingCart_0433 表中是否还有引用 "Largo" 牌玩具的记录
select * from ShoppingCart_0433
where cToyId in (select cToyId from Toys_0433 where cBrandId = (select cBrandId from ToyBrand_0433 where cBrandName = 'Largo'));

-- 查询 OrderDetails_0433 表中是否还有引用 "Largo" 牌玩具的记录
select * from OrderDetails_0433
where cToyId in (select cToyId from Toys_0433 where cBrandId = (select cBrandId from ToyBrand_0433 where cBrandName = 'Largo'));

-- 查询 PickOfMonth_0433 表中是否还有引用 "Largo" 牌玩具的记录
select * from PickOfMonth_0433
where cToyId in (select cToyId from Toys_0433 where cBrandId = (select cBrandId from ToyBrand_0433 where cBrandName = 'Largo'));