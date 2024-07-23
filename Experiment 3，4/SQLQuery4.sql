use GlobalToyz_0433;
go

-- 创建审计表 Audit_Orders_0433
create table Audit_Orders_0433 (
    AuditID int identity(1,1) primary key,
    OrderNo char(6),
    OperationType varchar(10),
    Operator varchar(50),
    OperationTime datetime,
    BeforeChange xml,
    AfterChange xml
);
go
use GlobalToyz_0433;
go

-- 创建插入操作触发器
create trigger trg_Insert_Orders_0433
on Orders_0433
after insert
as
begin
    declare @Operator varchar(50) = suser_sname();
    declare @OperationTime datetime = getdate();
    declare @OperationType varchar(10) = 'INSERT';

    insert into Audit_Orders_0433 (OrderNo, OperationType, Operator, OperationTime, BeforeChange, AfterChange)
    select
        i.cOrderNo,
        @OperationType,
        @Operator,
        @OperationTime,
        null,
        (select * from inserted i for xml path('Order'), elements, type)
    from inserted i;
end;
go

-- 创建更新操作触发器
create trigger trg_Update_Orders_0433
on Orders_0433
after update
as
begin
    declare @Operator varchar(50) = suser_sname();
    declare @OperationTime datetime = getdate();
    declare @OperationType varchar(10) = 'UPDATE';

    insert into Audit_Orders_0433 (OrderNo, OperationType, Operator, OperationTime, BeforeChange, AfterChange)
    select
        i.cOrderNo,
        @OperationType,
        @Operator,
        @OperationTime,
        (select * from deleted d where d.cOrderNo = i.cOrderNo for xml path('Order'), elements, type),
        (select * from inserted i for xml path('Order'), elements, type)
    from inserted i;
end;
go

-- 创建删除操作触发器
create trigger trg_Delete_Orders_0433
on Orders_0433
after delete
as
begin
    declare @Operator varchar(50) = suser_sname();
    declare @OperationTime datetime = getdate();
    declare @OperationType varchar(10) = 'DELETE';

    insert into Audit_Orders_0433 (OrderNo, OperationType, Operator, OperationTime, BeforeChange, AfterChange)
    select
        d.cOrderNo,
        @OperationType,
        @Operator,
        @OperationTime,
        (select * from deleted d for xml path('Order'), elements, type),
        null
    from deleted d;
end;
go
