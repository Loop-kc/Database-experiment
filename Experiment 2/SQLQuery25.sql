use GlobalToyz_0433;

-- ��ѯ Toys_0433 �����Ƿ��� "Largo" �Ƶ����
select * from Toys_0433
where cBrandId = (select cBrandId from ToyBrand_0433 where cBrandName = 'Largo');

-- ��ѯ ShoppingCart_0433 �����Ƿ������� "Largo" ����ߵļ�¼
select * from ShoppingCart_0433
where cToyId in (select cToyId from Toys_0433 where cBrandId = (select cBrandId from ToyBrand_0433 where cBrandName = 'Largo'));

-- ��ѯ OrderDetails_0433 �����Ƿ������� "Largo" ����ߵļ�¼
select * from OrderDetails_0433
where cToyId in (select cToyId from Toys_0433 where cBrandId = (select cBrandId from ToyBrand_0433 where cBrandName = 'Largo'));

-- ��ѯ PickOfMonth_0433 �����Ƿ������� "Largo" ����ߵļ�¼
select * from PickOfMonth_0433
where cToyId in (select cToyId from Toys_0433 where cBrandId = (select cBrandId from ToyBrand_0433 where cBrandName = 'Largo'));