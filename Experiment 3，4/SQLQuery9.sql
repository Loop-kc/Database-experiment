use GlobalToyz_0433;

-- �޸� ShoppingCart_0433 ��ṹ����� Status �ֶ�
alter table ShoppingCart_0433
add Status tinyint;
go
--�����洢�������ڲ����¶�����
create procedure GenerateNewOrderNo_0433
as
begin
    declare @newOrderNo char(6);
    select @newOrderNo = right('000000' + cast(isnull(max(cOrderNo), 0) + 1 as varchar(6)), 6)
    from Orders_0433;
    return @newOrderNo;
end;
go
--��������ʵ�ֹ�����ȷ�϶���������
create procedure ConfirmOrder_0433
    @cartId char(6),
    @shopperId char(6)
as
begin
    declare @orderNo char(6);
    declare @currentDate datetime;
    declare @toyId char(6);
    declare @qty int;
    declare @toyRate money;
    declare @toyCost money;

    set @currentDate = getdate();

    -- ��ʼ����
    begin transaction;

    -- �����µĶ�����
    exec @orderNo = GenerateNewOrderNo_0433;

    -- �������ţ���ǰ���ڣ����ﳵID�͹�����ID����Orders��
    insert into Orders_0433 (cOrderNo, dOrderDate, cCartId, cShopperId)
    values (@orderNo, @currentDate, @cartId, @shopperId);

    -- �������ﳵ��״̬Ϊ1�����
    declare toy_cursor cursor for
    select cToyId, siQty
    from ShoppingCart_0433
    where cCartId = @cartId and Status = 1;

    open toy_cursor;
    fetch next from toy_cursor into @toyId, @qty;

    while @@fetch_status = 0
    begin
        -- ��ȡ��ߵĵ���
        select @toyRate = mToyRate from Toys_0433 where cToyId = @toyId;

        -- ������߳ɱ�
        set @toyCost = @qty * @toyRate;

        -- �������ţ����ID����������OrderDetail��
        insert into OrderDetails_0433 (cOrderNo, cToyId, siQty, mToyCost)
        values (@orderNo, @toyId, @qty, @toyCost);

        -- ������߿������
        update Toys_0433
        set siToyQoh = siToyQoh - @qty
        where cToyId = @toyId;

        fetch next from toy_cursor into @toyId, @qty;
    end;

    close toy_cursor;
    deallocate toy_cursor;

    -- ��ShoppingCart_0433����ɾ�������ѹ�������
    delete from ShoppingCart_0433
    where cCartId = @cartId and Status = 1;

    -- �ύ����
    commit transaction;
end;

-- ���ģ�����ݵ�ShoppingCart_0433
insert into ShoppingCart_0433 (cCartId, cToyId, siQty, Status)
values
('000001', '000001', 2, 1),
('000001', '000002', 1, 0),
('000002', '000003', 3, 1),
('000002', '000004', 1, 0);