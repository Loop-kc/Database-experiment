use GlobalToyz_0433;

-- 查找一份基于 OrderDetails_0433 的报表，包括 cOrderNo 和总玩具成本，记录以 cOrderNo 升序排列
select
    od.cOrderNo,
    od.cToyId,
    od.mToyCost,
    total.TotalToyCost
from OrderDetails_0433 od
join (
    select 
        cOrderNo, 
        sum(mToyCost) as TotalToyCost
    from OrderDetails_0433
    group by cOrderNo
) total on od.cOrderNo = total.cOrderNo
order by od.cOrderNo;
