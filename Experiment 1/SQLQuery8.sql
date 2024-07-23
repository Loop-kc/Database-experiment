use CAP_0433;

declare @i int = 1;
declare @max int = 5000;
declare @ordno int = (select isnull(max(cast(Ordno as int)), 1000) from Orders_0433) + 1; -- 订单编号初始值，根据现有最大值计算
declare @month char(3);
declare @cid char(4);
declare @aid char(3);
declare @pid char(3);
declare @qty int;
declare @dollars numeric(10, 2);
declare @months table (name char(3));
insert into @months values ('Jan'), ('Feb'), ('Mar'), ('Apr'), ('May'), ('Jun'), ('Jul'), ('Aug'), ('Sep'), ('Oct'), ('Nov'), ('Dec');


while @i <= 5000
begin
	-- 生成订单编号
	set @Ordno = right('0000' + cast(@i + 1000 as varchar(4)),4);

	-- 随机选择一个月份(从 @months 表变量中随机选择一个月份，并将其赋值给 @month 变量)
    select top 1 @month = name from @months order by newid();
    
    -- 随机选择一个客户ID
    select top 1 @cid = cid from Customers_0433 order by newid();
    
    -- 随机选择一个代理ID
    select top 1 @aid = Aid from Agents_0433 order by newid();
    
    -- 随机选择一个产品ID
    select top 1 @pid = Pid from Products_0433 order by newid();
    
    -- 生成随机数量
	set @qty = cast(rand() * 1600 + 400 as int); -- 随机生成400到2000之间的数量

    -- 计算金额
    select @dollars = @qty * price from Products_0433 where Pid = @pid;
    
    -- 插入记录到Orders_0433表中
    insert into Orders_0433 (Ordno, month, cid, aid, pid, qty, dollars)
    values (@ordno, @month, @cid, @aid, @pid, @qty, @dollars);
    
	-- 递增订单编号
    set @OrdNo = @OrdNo + 1;

    -- 增加循环计数器
    set @i = @i + 1;
end
