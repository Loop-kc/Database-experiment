use GlobalToyz_0433;

-- ����������ߵ����ơ��̱�����ࣨ����ʹ�ñ�����
select 
    Toys_0433.vToyName as ToyName,
    ToyBrand_0433.cBrandName as Brand,
    Category_0433.cCategory as Category
from 
    Toys_0433
join 
    ToyBrand_0433 on Toys_0433.cBrandId = ToyBrand_0433.cBrandId
join 
    Category_0433 on Toys_0433.cCategoryId = Category_0433.cCategoryId;