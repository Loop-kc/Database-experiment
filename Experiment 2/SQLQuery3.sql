use GlobalToyz_0433;

    declare @i int = 1;
    declare @maxOrderNo int;

    -- 获取现有最大订单号
    select @maxOrderNo = isnull(max(cast(cOrderNo as int)), 1000) from Orders_0433;

    while @i <= 1000
    begin
        declare @newOrderNo char(6);
        declare @newOrderDate datetime;
        declare @newCartId char(6);
        declare @newShopperId char(6);
        declare @newShippingModeId char(2);
        declare @newShippingCharges money;
        declare @newGiftWrapCharges money;
        declare @newOrderProcessed char(1);
        declare @newTotalCost money;
        declare @newExpDelDate datetime;
        declare @newToyId char(6);
        declare @newQty smallint;
        declare @newToyCost money;
        declare @newGiftWrap char(1);
        declare @newWrapperId char(3);
        declare @newMessage varchar(256);
        
        -- 生成新的订单号
        set @newOrderNo = right('000000' + cast(@maxOrderNo + @i as varchar(6)), 6);

        -- 随机生成订单日期（从2017-05-22到现在）
        set @newOrderDate = dateadd(day, cast(rand() * (datediff(day, '2017-05-22', getdate())) as int), '2017-05-22');

        -- 随机选择一个购物车ID
        select top 1 @newCartId = cCartId from ShoppingCart_0433 order by newid();

        -- 随机选择一个购物者ID
        select top 1 @newShopperId = cShopperId from Shopper_0433 order by newid();

        -- 随机选择一个运输方式ID
        select top 1 @newShippingModeId = cModeId from ShippingMode_0433 order by newid();

        -- 随机生成运输费用和礼品包装费用
        set @newShippingCharges = round(rand() * 10, 2);
        set @newGiftWrapCharges = round(rand() * 5, 2);

        -- 随机生成订单处理状态
        set @newOrderProcessed = case when rand() > 0.5 then 'Y' else 'N' end;

        -- 随机生成总成本
        set @newTotalCost = round(rand() * 100 + 50, 2);

        -- 计算预计送达日期，范围为订单日期后1到7天
        set @newExpDelDate = dateadd(day, 1 + cast(rand() * 7 as int), @newOrderDate);

        -- 插入订单数据
        insert into Orders_0433 (cOrderNo, dOrderDate, cCartId, cShopperId, cShippingModeId, mShippingCharges, mGiftWrapCharges, cOrderProcessed, mTotalCost, dExpDelDate)
        values (@newOrderNo, @newOrderDate, @newCartId, @newShopperId, @newShippingModeId, @newShippingCharges, @newGiftWrapCharges, @newOrderProcessed, @newTotalCost, @newExpDelDate);

        -- 生成多个 OrderDetails 记录
        declare @j int = 1;
        declare @maxDetails int;
        set @maxDetails = cast(rand() * 4 + 1 as int); -- 随机生成 1 到 4 之间的数字

        while @j <= @maxDetails -- 每个订单生成随机 1 到 4 个 OrderDetails 记录
        begin
            -- 随机选择一个玩具ID和数量
            select top 1 @newToyId = cToyId, @newToyCost = mToyRate from Toys_0433 order by newid();
            set @newQty = cast(rand() * 20 + 1 as smallint);

            -- 随机生成礼品包装和包装ID
            set @newGiftWrap = case when rand() > 0.5 then 'Y' else 'N' end;
            if @newGiftWrap = 'N'
            begin
                set @newWrapperId = NULL;
                set @newMessage = NULL;
            end
            else
            begin
                select top 1 @newWrapperId = cWrapperId from Wrapper_0433 order by newid();
                set @newMessage = 'Gift Message ' + cast(@i as varchar(10));
            end

            -- 插入订单详情数据
            insert into OrderDetails_0433 (cOrderNo, cToyId, siQty, cGiftWrap, cWrapperId, vMessage, mToyCost)
            values (@newOrderNo, @newToyId, @newQty, @newGiftWrap, @newWrapperId, @newMessage, @newToyCost * @newQty);

            set @j = @j + 1;
        end

        set @i = @i + 1;
    end


