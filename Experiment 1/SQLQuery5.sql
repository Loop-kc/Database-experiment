use CAP_0433;

-- 创建Orders_Jan_0433表
create table Orders_Jan_0433
(
	Ordno char(4),
    month char(3) check(month in('Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec')),
    cid char(4),
    aid char(3),
    pid char(3),
    qty int,
    dollars numeric(10,2),
    primary key(Ordno),
    foreign key (cid) references Customers_0433(cid),
    foreign key (aid) references Agents_0433(Aid),
    foreign key (pid) references Products_0433(Pid)
);

--复制
insert into Orders_Jan_0433 (Ordno, month, cid, aid, pid, qty, dollars)
select Ordno, month, cid, aid, pid, qty, dollars from Orders_0433
where month = 'Jan';