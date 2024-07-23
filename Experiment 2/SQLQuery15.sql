use GlobalToyz_0433;

--查找所有玩具的平均价格，并舍入到整数
select 
	cast(round(avg(mToyRate),0) as int) as AveragePrice
from Toys_0433;