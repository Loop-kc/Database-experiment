use CAP_0433;

--创建Customers_0433
create table Customers_0433
(
	cid char(4),
	cname varchar(10),
	city varchar(10),
	discnt numeric(4,2) check(discnt between 0 and 30),
	primary key (cid)
);
insert into Customers_0433 (cid, cname, city, discnt) values
('C001', 'TipTop', 'Duluth', 10.00),
('C002', 'Basics', 'Dallas', 12.00),
('C003', 'Allied', 'Dallas', 8.00),
('C004', 'ACME', 'Duluth', 8.00),
('C005', 'Oriental', 'Kyoto', 6.00),
('C006', 'ACME', 'Kyoto', 0.00),
('C433', '***', 'Changsha', 20.00);

--创建Products_0433
create table Products_0433
(
	Pid char(3),
	pname varchar(10),
	city varchar(10),
	quantity int,
	price numeric(10,2) not null,
	primary key (Pid)
);
insert into Products_0433 (Pid, pname, city, quantity, price) values
('P01', 'comb', 'Dallas', 111400, 0.50),
('P02', 'brush', 'Newark', 203000, 0.50),
('P03', 'razor', 'Duluth', 150600, 1.00),
('P04', 'Pen', 'Duluth', 125300, 1.00),
('P05', 'pencil', 'Dallas', 221400, 1.00),
('P06', 'folder', 'Dallas', 123100, 2.00),
('P07', 'case', 'Newark', 100500, 1.00);

--创建Agents_0433
create table Agents_0433
(
	Aid char(3),
	aname varchar(10),
	city varchar(10),
	[percent] tinyint,
	primary key(Aid)
);
insert into Agents_0433 (Aid, aname, city, [percent]) values
('A01', 'smith', 'New York', 6),
('A02', 'Jones', 'Newark', 6),
('A03', 'Brown', 'Tokyo', 7),
('A04', 'Gray', 'New York', 6),
('A05', 'Otasi', 'Duluth', 5),
('A06', 'Smith', 'Dallas', 5),
('A33', '刘澎', 'Changsha', 10);

--创建Orders_0433
create table Orders_0433
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
	foreign key (pid) references Products_0433(Pid),
);
insert into Orders_0433 (Ordno, month, cid, aid, pid, qty, dollars) values
('1011', 'Jan', 'C001', 'A01', 'P01', 1000, 450.00),
('1012', 'Jan', 'C001', 'A01', 'P01', 1000, 450.00),
('1019', 'Feb', 'C001', 'A02', 'P02', 400, 180.00),
('1017', 'Feb', 'C001', 'A06', 'P03', 600, 540.00),
('1018', 'Feb', 'C001', 'A03', 'P04', 600, 540.00),
('1023', 'Mar', 'C001', 'A04', 'P05', 500, 450.00),
('1022', 'Mar', 'C001', 'A05', 'P06', 400, 720.00),
('1025', 'Apr', 'C001', 'A05', 'P07', 800, 720.00),
('1013', 'Jan', 'C002', 'A03', 'P03', 1000, 880.00),
('1026', 'May', 'C002', 'A05', 'P03', 800, 704.00),
('1015', 'Jan', 'C003', 'A03', 'P05', 1200, 1104.00),
('1014', 'Jan', 'C003', 'A03', 'P05', 1200, 1104.00),
('1021', 'Feb', 'C004', 'A06', 'P01', 1000, 460.00),
('1016', 'Jan', 'C004', 'A01', 'P01', 1000, 500.00),
('1020', 'Feb', 'C005', 'A03', 'P07', 600, 600.00),
('1024', 'Mar', 'C006', 'A06', 'P01', 800, 400.00);

