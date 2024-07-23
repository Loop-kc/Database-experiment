use CAP_0433;

declare @i int = 1;
declare @max int = 5000;
declare @ordno int = (select isnull(max(cast(Ordno as int)), 1000) from Orders_0433) + 1; -- ������ų�ʼֵ�������������ֵ����
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
	-- ���ɶ������
	set @Ordno = right('0000' + cast(@i + 1000 as varchar(4)),4);

	-- ���ѡ��һ���·�(�� @months ����������ѡ��һ���·ݣ������丳ֵ�� @month ����)
    select top 1 @month = name from @months order by newid();
    
    -- ���ѡ��һ���ͻ�ID
    select top 1 @cid = cid from Customers_0433 order by newid();
    
    -- ���ѡ��һ������ID
    select top 1 @aid = Aid from Agents_0433 order by newid();
    
    -- ���ѡ��һ����ƷID
    select top 1 @pid = Pid from Products_0433 order by newid();
    
    -- �����������
	set @qty = cast(rand() * 1600 + 400 as int); -- �������400��2000֮�������

    -- ������
    select @dollars = @qty * price from Products_0433 where Pid = @pid;
    
    -- �����¼��Orders_0433����
    insert into Orders_0433 (Ordno, month, cid, aid, pid, qty, dollars)
    values (@ordno, @month, @cid, @aid, @pid, @qty, @dollars);
    
	-- �����������
    set @OrdNo = @OrdNo + 1;

    -- ����ѭ��������
    set @i = @i + 1;
end
