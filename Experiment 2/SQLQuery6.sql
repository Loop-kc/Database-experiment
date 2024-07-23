use GlobalToyz_0433;

--查找定单号码、顾客ID，定单的总价值，并以定单的总价值的升序排列
select cOrderNo,cShopperId,mTotalCost
from Orders_0433
order by 'mTotalCost';