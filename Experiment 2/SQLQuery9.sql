use GlobalToyz_0433;

--����2016�������������������ҡ�Pick of the Month����ߵ�ǰ������ߵ�ID��
select top 5 cToyId from PickOfMonth_0433
where iYear = 2016
group by cToyId
order by sum(iTotalSold) desc;