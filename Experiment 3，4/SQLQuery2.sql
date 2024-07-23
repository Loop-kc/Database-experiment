use GlobalToyz_0433;
go
-- �����洢���� prcHandlingCharges_0433
create procedure prcHandlingCharges_0433
    @orderNo char(6)
as
begin
    -- ��ʱ�������洢 prcCharges_0433 �Ľ��
    declare @ShippingCharges money;
    declare @GiftWrapCharges money;

    -- ʹ����ʱ����ս��
    declare @Charges table (
        ShippingCharges money,
        GiftWrapCharges money
    );

    insert into @Charges
    exec prcCharges_0433 @orderNo;

    -- ����ʱ���ж�ȡ����
    select @ShippingCharges = ShippingCharges, @GiftWrapCharges = GiftWrapCharges
    from @Charges;

    -- ���㾭Ӫ����
    declare @HandlingCharges money;
    set @HandlingCharges = @ShippingCharges + @GiftWrapCharges;
    -- ��ʾ��Ӫ����
    select 
        @orderNo as OrderNo,
        @ShippingCharges as ShippingCharges,
        @GiftWrapCharges as GiftWrapCharges,
        @HandlingCharges as HandlingCharges;
end

