use GlobalToyz_0433;
go
--�����洢����
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

    -- �����α꣬���ڱ���ÿ�������ߵĶ�����Ϣ
    declare shopper_cursor cursor for
    select s.cShopperId, s.vFirstName, s.vLastName, s.vAddress, o.cOrderNo, o.dOrderDate, o.mTotalCost
    from Shopper_0433 s
    left join Orders_0433 o on s.cShopperId = o.cShopperId
    order by s.cShopperId, o.dOrderDate;

    -- ���α�
    open shopper_cursor;

    -- ��ȡ��һ����¼
    fetch next from shopper_cursor into @shopperId, @firstName, @lastName, @address, @orderNo, @orderDate, @totalCost;

    -- ��ʼ���������洢��ǰ������ID
    declare @currentShopperId char(6);
    set @currentShopperId = '';

    -- �����α��е�ÿһ����¼
    while @@fetch_status = 0
    begin
        -- ��������¹����ߣ���ӡ��������Ϣ
        if @currentShopperId <> @shopperId
        begin
            -- ���µ�ǰ������ID
            set @currentShopperId = @shopperId;

            -- ��ӡ��������Ϣ
            print '������ID: ' + @shopperId + '    ����������: ' + @firstName + ' ' + @lastName;
            print '�����˵�ַ: ' + @address;
        end

        -- ��ӡ������Ϣ
        if @orderNo is not null
        begin
            print '  ������: ' + @orderNo + '    ����ʱ��: ' + convert(varchar, @orderDate, 23) + '    �������: ' + convert(varchar, @totalCost);
        end
        else
        begin
            print '  û�ж�����¼';
        end

        -- ��ȡ��һ����¼
        fetch next from shopper_cursor into @shopperId, @firstName, @lastName, @address, @orderNo, @orderDate, @totalCost;
    end

    -- �ر��α�
    close shopper_cursor;
    deallocate shopper_cursor;
end;

