use GlobalToyz_0433;

-- ɾ�����ﳵ�С�Largo���Ƶ����
delete from ShoppingCart_0433
where cToyId in (
    select cToyId
    from Toys_0433
    where cBrandId = (
        select cBrandId
        from ToyBrand_0433
        where cBrandName = 'Largo'
    )
);

-- ɾ�����������С�Largo���Ƶ����
delete from OrderDetails_0433
where cToyId in (
    select cToyId
    from Toys_0433
    where cBrandId = (
        select cBrandId
        from ToyBrand_0433
        where cBrandName = 'Largo'
    )
);

-- ɾ����Pick of the Month���С�Largo���Ƶ����
delete from PickOfMonth_0433
where cToyId in (
    select cToyId
    from Toys_0433
    where cBrandId = (
        select cBrandId
        from ToyBrand_0433
        where cBrandName = 'Largo'
    )
);

-- ɾ����߱��С�Largo���Ƶ����
delete from Toys_0433
where cBrandId = (
    select cBrandId
    from ToyBrand_0433
    where cBrandName = 'Largo'
);

-- ɾ��Ʒ�Ʊ��С�Largo��Ʒ��
delete from ToyBrand_0433
where cBrandName = 'Largo';


