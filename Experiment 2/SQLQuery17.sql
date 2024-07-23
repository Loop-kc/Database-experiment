use GlobalToyz_0433;
-- 查找没有包装的所有玩具的名称
select 
    vToyName as ToyName
from Toys_0433 
where cToyId in (
		select distinct cToyId 
        from OrderDetails_0433 
        where cGiftWrap = 'N'
);