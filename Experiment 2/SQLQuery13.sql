use GlobalToyz_0433;

--查找玩具的名称和所有玩具的购物车ID。如果玩具不在购物车中，也需在结果中出现
select 
	Toys_0433.vToyName as ToyName,
	ShoppingCart_0433.cCartId as CartId
from Toys_0433
left join 
	ShoppingCart_0433 on Toys_0433.cToyId = ShoppingCart_0433.cToyId;