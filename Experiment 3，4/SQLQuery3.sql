use GlobalToyz_0433;
go
-- ���������� tr_UpdateToyStock_0433
create trigger tr_UpdateToyStock_0433
on OrderDetails_0433
after insert
as
begin
    -- ���� Toys_0433 ���еĿ������
    update Toys_0433
    set Toys_0433.siToyQoh = Toys_0433.siToyQoh - inserted .siQty
    from Toys_0433 
    join inserted  on Toys_0433.cToyId = inserted .cToyId
end

