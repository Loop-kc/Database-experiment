use GlobalToyz_0433;
go
-- 创建存储过程 prcCharges_0433
create procedure prcCharges_0433
    @orderNo char(6)
as
begin
    -- 查询装运费用和包装费用
    select 
        cOrderNo,
        mShippingCharges as ShippingCharges,
        mGiftWrapCharges as GiftWrapCharges
    from Orders_0433
    where cOrderNo = @orderNo;
end

