use GlobalToyz_0433;
go
--创建存储过程
create procedure CheckDailySalesStatus_0433
as
begin
    declare @currentDate datetime;
    declare @dailyTotal money;
    declare @salesStatus varchar(10);

    -- 定义游标，用于遍历每天的定单总金额
    declare sales_cursor cursor for
    select dOrderDate, sum(mTotalCost) as dailyTotal
    from Orders_0433
    group by dOrderDate;

    -- 打开游标
    open sales_cursor;

    -- 获取第一条记录
    fetch next from sales_cursor into @currentDate, @dailyTotal;

    -- 遍历游标中的每一条记录
    while @@fetch_status = 0
    begin
        -- 判断销售状态
        if @dailyTotal > 150
            set @salesStatus = 'High sales';
        else
            set @salesStatus = 'Low sales';

        -- 输出结果
        print 'Date: ' + convert(varchar, @currentDate, 23) + ', Sales Status: ' + @salesStatus + ', Total Sales: ' + convert(varchar, @dailyTotal);

        -- 获取下一条记录
        fetch next from sales_cursor into @currentDate, @dailyTotal;
    end;

    -- 关闭游标
    close sales_cursor;
    deallocate sales_cursor;
end;

