use GlobalToyz_0433;
-- ������ͼ��ѯ���Ҵ���Ϊ��001�����ջ��˵��������������¶����ı������������ܽ��
select
    RecipientName,
    count(OrderNumber) as OrderCount,
    sum(OrderAmount) as TotalOrderAmount
from OrderSummary_0433
where
    CountryCode = '001'
group by RecipientName;
