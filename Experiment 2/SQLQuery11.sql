use GlobalToyz_0433;

-- ���Ұ�������װ����Ϣ�ı���
select 
    cOrderNo as OrderNumber, 
    dShipmentDate as ShipmentDate, 
    dActualDeliveryDate as ActualDeliveryDate,
    datediff(day, dShipmentDate, dActualDeliveryDate) as DaysInTransit
from 
    Shipment_0433
where
    dShipmentDate is not null and dActualDeliveryDate is not null;