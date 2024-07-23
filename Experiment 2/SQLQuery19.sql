use GlobalToyz_0433;

-- ����һ�ݻ��� OrderDetails_0433 �ı������� cOrderNo ������߳ɱ�����¼�� cOrderNo ��������
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
