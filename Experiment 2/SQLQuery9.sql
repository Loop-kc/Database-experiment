use GlobalToyz_0433;

--根据2016年的玩具销售总数，查找“Pick of the Month”玩具的前五名玩具的ID。
select top 5 cToyId from PickOfMonth_0433
where iYear = 2016
group by cToyId
order by sum(iTotalSold) desc;