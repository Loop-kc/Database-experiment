use GlobalToyz_0433;
go
--创建存储过程
create procedure GenerateShopperOrderReport_0433
as
begin
    declare @shopperId char(6);
    declare @firstName varchar(20);
    declare @lastName varchar(20);
    declare @address varchar(40);
    declare @orderNo char(6);
    declare @orderDate datetime;
    declare @totalCost money;

    -- 定义游标，用于遍历每个购物者的订单信息
    declare shopper_cursor cursor for
    select s.cShopperId, s.vFirstName, s.vLastName, s.vAddress, o.cOrderNo, o.dOrderDate, o.mTotalCost
    from Shopper_0433 s
    left join Orders_0433 o on s.cShopperId = o.cShopperId
    order by s.cShopperId, o.dOrderDate;

    -- 打开游标
    open shopper_cursor;

    -- 获取第一条记录
    fetch next from shopper_cursor into @shopperId, @firstName, @lastName, @address, @orderNo, @orderDate, @totalCost;

    -- 初始化变量，存储当前购物者ID
    declare @currentShopperId char(6);
    set @currentShopperId = '';

    -- 遍历游标中的每一条记录
    while @@fetch_status = 0
    begin
        -- 如果遇到新购物者，打印购物者信息
        if @currentShopperId <> @shopperId
        begin
            -- 更新当前购物者ID
            set @currentShopperId = @shopperId;

            -- 打印购物者信息
            print '购货人ID: ' + @shopperId + '    购货人姓名: ' + @firstName + ' ' + @lastName;
            print '购货人地址: ' + @address;
        end

        -- 打印订单信息
        if @orderNo is not null
        begin
            print '  定单号: ' + @orderNo + '    定单时间: ' + convert(varchar, @orderDate, 23) + '    定单金额: ' + convert(varchar, @totalCost);
        end
        else
        begin
            print '  没有订单记录';
        end

        -- 获取下一条记录
        fetch next from shopper_cursor into @shopperId, @firstName, @lastName, @address, @orderNo, @orderDate, @totalCost;
    end

    -- 关闭游标
    close shopper_cursor;
    deallocate shopper_cursor;
end;

