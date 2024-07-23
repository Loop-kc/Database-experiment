use GlobalToyz_0433;

-- 删除购物车中“Largo”牌的玩具
delete from ShoppingCart_0433
where cToyId in (
    select cToyId
    from Toys_0433
    where cBrandId = (
        select cBrandId
        from ToyBrand_0433
        where cBrandName = 'Largo'
    )
);

-- 删除订单详情中“Largo”牌的玩具
delete from OrderDetails_0433
where cToyId in (
    select cToyId
    from Toys_0433
    where cBrandId = (
        select cBrandId
        from ToyBrand_0433
        where cBrandName = 'Largo'
    )
);

-- 删除“Pick of the Month”中“Largo”牌的玩具
delete from PickOfMonth_0433
where cToyId in (
    select cToyId
    from Toys_0433
    where cBrandId = (
        select cBrandId
        from ToyBrand_0433
        where cBrandName = 'Largo'
    )
);

-- 删除玩具表中“Largo”牌的玩具
delete from Toys_0433
where cBrandId = (
    select cBrandId
    from ToyBrand_0433
    where cBrandName = 'Largo'
);

-- 删除品牌表中“Largo”品牌
delete from ToyBrand_0433
where cBrandName = 'Largo';


