use GlobalToyz_0433;

--查找玩具总价值大于￥50的定单的号码和玩具总价值
select cOrderNo,sum(mToyCost) as TotalValue
from OrderDetails_0433
group by cOrderNo
having sum(mToyCost) > 50;