use GlobalToyz_0433;

    declare @i int = 1;
    declare @maxOrderNo int;

    -- ��ȡ������󶩵���
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
        
        -- �����µĶ�����
        set @newOrderNo = right('000000' + cast(@maxOrderNo + @i as varchar(6)), 6);

        -- ������ɶ������ڣ���2017-05-22�����ڣ�
        set @newOrderDate = dateadd(day, cast(rand() * (datediff(day, '2017-05-22', getdate())) as int), '2017-05-22');

        -- ���ѡ��һ�����ﳵID
        select top 1 @newCartId = cCartId from ShoppingCart_0433 order by newid();

        -- ���ѡ��һ��������ID
        select top 1 @newShopperId = cShopperId from Shopper_0433 order by newid();

        -- ���ѡ��һ�����䷽ʽID
        select top 1 @newShippingModeId = cModeId from ShippingMode_0433 order by newid();

        -- �������������ú���Ʒ��װ����
        set @newShippingCharges = round(rand() * 10, 2);
        set @newGiftWrapCharges = round(rand() * 5, 2);

        -- ������ɶ�������״̬
        set @newOrderProcessed = case when rand() > 0.5 then 'Y' else 'N' end;

        -- ��������ܳɱ�
        set @newTotalCost = round(rand() * 100 + 50, 2);

        -- ����Ԥ���ʹ����ڣ���ΧΪ�������ں�1��7��
        set @newExpDelDate = dateadd(day, 1 + cast(rand() * 7 as int), @newOrderDate);

        -- ���붩������
        insert into Orders_0433 (cOrderNo, dOrderDate, cCartId, cShopperId, cShippingModeId, mShippingCharges, mGiftWrapCharges, cOrderProcessed, mTotalCost, dExpDelDate)
        values (@newOrderNo, @newOrderDate, @newCartId, @newShopperId, @newShippingModeId, @newShippingCharges, @newGiftWrapCharges, @newOrderProcessed, @newTotalCost, @newExpDelDate);

        -- ���ɶ�� OrderDetails ��¼
        declare @j int = 1;
        declare @maxDetails int;
        set @maxDetails = cast(rand() * 4 + 1 as int); -- ������� 1 �� 4 ֮�������

        while @j <= @maxDetails -- ÿ������������� 1 �� 4 �� OrderDetails ��¼
        begin
            -- ���ѡ��һ�����ID������
            select top 1 @newToyId = cToyId, @newToyCost = mToyRate from Toys_0433 order by newid();
            set @newQty = cast(rand() * 20 + 1 as smallint);

            -- ���������Ʒ��װ�Ͱ�װID
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

            -- ���붩����������
            insert into OrderDetails_0433 (cOrderNo, cToyId, siQty, cGiftWrap, cWrapperId, vMessage, mToyCost)
            values (@newOrderNo, @newToyId, @newQty, @newGiftWrap, @newWrapperId, @newMessage, @newToyCost * @newQty);

            set @j = @j + 1;
        end

        set @i = @i + 1;
    end


