use GlobalToyz_0433;
-- ����û�а�װ��������ߵ�����
select 
    vToyName as ToyName
from Toys_0433 
where cToyId in (
		select distinct cToyId 
        from OrderDetails_0433 
        where cGiftWrap = 'N'
);