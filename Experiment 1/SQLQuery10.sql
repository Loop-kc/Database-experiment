use CAP_0433;
go

-- 创建视图 order_month_summary_0433
create view order_month_summary_0433 as
select
    month,
    sum(qty) as total_qty,
    sum(dollars) as total_dollars
from Orders_0433 group by month;
go

-- 查询第一季度各个月份的订单总量和总金额
select
    month,
    total_qty,
    total_dollars
from order_month_summary_0433
where month in ('Jan', 'Feb', 'Mar');
