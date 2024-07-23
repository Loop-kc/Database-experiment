use CAP_0433;
go

-- ������ͼ order_month_summary_0433
create view order_month_summary_0433 as
select
    month,
    sum(qty) as total_qty,
    sum(dollars) as total_dollars
from Orders_0433 group by month;
go

-- ��ѯ��һ���ȸ����·ݵĶ����������ܽ��
select
    month,
    total_qty,
    total_dollars
from order_month_summary_0433
where month in ('Jan', 'Feb', 'Mar');
