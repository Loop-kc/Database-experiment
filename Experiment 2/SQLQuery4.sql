use GlobalToyz_0433;

-- ¸üÐÂ PickOfMonth_0433 ±í
with MonthlySales as (
    select 
        cToyId,
        month(dOrderDate) as siMonth,
        year(dOrderDate) as iYear,
        sum(siQty) as iTotalSold
    from 
        Orders_0433 o
    join 
        OrderDetails_0433 od on o.cOrderNo = od.cOrderNo
    where dOrderDate >= '2017-05-22'
    group by 
        cToyId, month(dOrderDate), year(dOrderDate)
)
merge PickOfMonth_0433 as target
using MonthlySales as source
on 
    target.cToyId = source.cToyId and
    target.siMonth = source.siMonth and
    target.iYear = source.iYear
when matched then
    update set iTotalSold = source.iTotalSold
when not matched then
    insert (cToyId, siMonth, iYear, iTotalSold)
    values (source.cToyId, source.siMonth, source.iYear, source.iTotalSold);