use GlobalToyz_0433;

--��������ܼ�ֵ���ڣ�50�Ķ����ĺ��������ܼ�ֵ
select cOrderNo,sum(mToyCost) as TotalValue
from OrderDetails_0433
group by cOrderNo
having sum(mToyCost) > 50;