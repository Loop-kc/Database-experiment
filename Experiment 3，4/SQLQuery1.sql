use GlobalToyz_0433;
go
-- �����洢���� prcCharges_0433
create procedure prcCharges_0433
    @orderNo char(6)
as
begin
    -- ��ѯװ�˷��úͰ�װ����
    select 
        cOrderNo,
        mShippingCharges as ShippingCharges,
        mGiftWrapCharges as GiftWrapCharges
    from Orders_0433
    where cOrderNo = @orderNo;
end

