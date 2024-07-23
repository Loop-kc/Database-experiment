use GlobalToyz_0433;
go
--�����洢����
create procedure CheckDailySalesStatus_0433
as
begin
    declare @currentDate datetime;
    declare @dailyTotal money;
    declare @salesStatus varchar(10);

    -- �����α꣬���ڱ���ÿ��Ķ����ܽ��
    declare sales_cursor cursor for
    select dOrderDate, sum(mTotalCost) as dailyTotal
    from Orders_0433
    group by dOrderDate;

    -- ���α�
    open sales_cursor;

    -- ��ȡ��һ����¼
    fetch next from sales_cursor into @currentDate, @dailyTotal;

    -- �����α��е�ÿһ����¼
    while @@fetch_status = 0
    begin
        -- �ж�����״̬
        if @dailyTotal > 150
            set @salesStatus = 'High sales';
        else
            set @salesStatus = 'Low sales';

        -- ������
        print 'Date: ' + convert(varchar, @currentDate, 23) + ', Sales Status: ' + @salesStatus + ', Total Sales: ' + convert(varchar, @dailyTotal);

        -- ��ȡ��һ����¼
        fetch next from sales_cursor into @currentDate, @dailyTotal;
    end;

    -- �ر��α�
    close sales_cursor;
    deallocate sales_cursor;
end;

