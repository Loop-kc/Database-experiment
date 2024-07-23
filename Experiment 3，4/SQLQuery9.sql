use GlobalToyz_0433;

-- 修改 ShoppingCart_0433 表结构，添加 Status 字段
alter table ShoppingCart_0433
add Status tinyint;
go
--创建存储过程用于产生新订单号
create procedure GenerateNewOrderNo_0433
as
begin
    declare @newOrderNo char(6);
    select @newOrderNo = right('000000' + cast(isnull(max(cOrderNo), 0) + 1 as varchar(6)), 6)
    from Orders_0433;
    return @newOrderNo;
end;
go
--创建过程实现购物者确认订单的事务
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

    -- 开始事务
    begin transaction;

    -- 产生新的订单号
    exec @orderNo = GenerateNewOrderNo_0433;

    -- 将订单号，当前日期，购物车ID和购物者ID加入Orders表
    insert into Orders_0433 (cOrderNo, dOrderDate, cCartId, cShopperId)
    values (@orderNo, @currentDate, @cartId, @shopperId);

    -- 遍历购物车中状态为1的玩具
    declare toy_cursor cursor for
    select cToyId, siQty
    from ShoppingCart_0433
    where cCartId = @cartId and Status = 1;

    open toy_cursor;
    fetch next from toy_cursor into @toyId, @qty;

    while @@fetch_status = 0
    begin
        -- 获取玩具的单价
        select @toyRate = mToyRate from Toys_0433 where cToyId = @toyId;

        -- 计算玩具成本
        set @toyCost = @qty * @toyRate;

        -- 将订单号，玩具ID和数量加入OrderDetail表
        insert into OrderDetails_0433 (cOrderNo, cToyId, siQty, mToyCost)
        values (@orderNo, @toyId, @qty, @toyCost);

        -- 更新玩具库存数量
        update Toys_0433
        set siToyQoh = siToyQoh - @qty
        where cToyId = @toyId;

        fetch next from toy_cursor into @toyId, @qty;
    end;

    close toy_cursor;
    deallocate toy_cursor;

    -- 从ShoppingCart_0433表中删除本次已购买的玩具
    delete from ShoppingCart_0433
    where cCartId = @cartId and Status = 1;

    -- 提交事务
    commit transaction;
end;

-- 添加模拟数据到ShoppingCart_0433
insert into ShoppingCart_0433 (cCartId, cToyId, siQty, Status)
values
('000001', '000001', 2, 1),
('000001', '000002', 1, 0),
('000002', '000003', 3, 1),
('000002', '000004', 1, 0);