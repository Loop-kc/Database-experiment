use GlobalToyz_0433;
go
-- 创建存储过程 prcHandlingCharges_0433
create procedure prcHandlingCharges_0433
    @orderNo char(6)
as
begin
    -- 临时变量来存储 prcCharges_0433 的结果
    declare @ShippingCharges money;
    declare @GiftWrapCharges money;

    -- 使用临时表接收结果
    declare @Charges table (
        ShippingCharges money,
        GiftWrapCharges money
    );

    insert into @Charges
    exec prcCharges_0433 @orderNo;

    -- 从临时表中读取费用
    select @ShippingCharges = ShippingCharges, @GiftWrapCharges = GiftWrapCharges
    from @Charges;

    -- 计算经营费用
    declare @HandlingCharges money;
    set @HandlingCharges = @ShippingCharges + @GiftWrapCharges;
    -- 显示经营费用
    select 
        @orderNo as OrderNo,
        @ShippingCharges as ShippingCharges,
        @GiftWrapCharges as GiftWrapCharges,
        @HandlingCharges as HandlingCharges;
end

