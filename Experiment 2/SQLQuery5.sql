use GlobalToyz_0433;

--查找属于California和Florida州的顾客的名、姓和emailID
select vFirstName,vLastName,vEmailId 
from Shopper_0433
where cState in ('California', 'Florida');