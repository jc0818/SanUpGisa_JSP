create table tbl_product_01(
	pcode varchar2(10) primary key,
	name varchar2(20),
	cost number(10)
)

create table tbl_shop_01(
	scode varchar2(10) primary key,
	sname varchar2(20)
)

create table tbl_salelist_01(
	saleno number(10) primary key,
	pcode varchar2(10) not null,
	saledate date,
	scode varchar2(10) not null,
	amount number(10)
)

insert into tbl_product_01 values('AA01','아메리카노',3000);
insert into tbl_product_01 values('AA02','에스프레소',3500);
insert into tbl_product_01 values('AA03','카페라떼',4000);
insert into tbl_product_01 values('AA04','카라멜마끼',4500);
insert into tbl_product_01 values('AA05','카푸치노',5000);
insert into tbl_product_01 values('AA06','초코롤',6000);
insert into tbl_product_01 values('AA07','녹차롤',6500);
insert into tbl_product_01 values('AA08','망고쥬스',7000);
insert into tbl_product_01 values('AA09','핫초코',2500);

insert into tbl_shop_01 values('S001','강남점');
insert into tbl_shop_01 values('S002','강서점');
insert into tbl_shop_01 values('S003','강동점');
insert into tbl_shop_01 values('S004','강북점');
insert into tbl_shop_01 values('S005','동대문점');
insert into tbl_shop_01 values('S006','인천점');

insert into tbl_salelist_01 values(100001,'AA01',TO_DATE('2018-09-02','YYYY-MM-DD'),'S001',50);

insert into tbl_salelist_01 values(100002,'AA03',TO_DATE('2018-09-02','YYYY-MM-DD'),'S002',40);
insert into tbl_salelist_01 values(100003,'AA04',TO_DATE('2018-09-02','YYYY-MM-DD'),'S002',20);
insert into tbl_salelist_01 values(100004,'AA04',TO_DATE('2018-09-02','YYYY-MM-DD'),'S001',30);
insert into tbl_salelist_01 values(100005,'AA05',TO_DATE('2018-09-02','YYYY-MM-DD'),'S004',40);
insert into tbl_salelist_01 values(100006,'AA03',TO_DATE('2018-09-02','YYYY-MM-DD'),'S004',30);
insert into tbl_salelist_01 values(100007,'AA01',TO_DATE('2018-09-02','YYYY-MM-DD'),'S003',40);
insert into tbl_salelist_01 values(100008,'AA04',TO_DATE('2018-09-02','YYYY-MM-DD'),'S004',10);
insert into tbl_salelist_01 values(100009,'AA01',TO_DATE('2018-09-02','YYYY-MM-DD'),'S003',20);
insert into tbl_salelist_01 values(100010,'AA05',TO_DATE('2018-09-02','YYYY-MM-DD'),'S003',30);
insert into tbl_salelist_01 values(100011,'AA01',TO_DATE('2018-09-02','YYYY-MM-DD'),'S001',40);
insert into tbl_salelist_01 values(100012,'AA03',TO_DATE('2018-09-02','YYYY-MM-DD'),'S002',50);
insert into tbl_salelist_01 values(100013,'AA04',TO_DATE('2018-09-02','YYYY-MM-DD'),'S002',50);
insert into tbl_salelist_01 values(100014,'AA05',TO_DATE('2018-09-02','YYYY-MM-DD'),'S004',20);
insert into tbl_salelist_01 values(100015,'AA01',TO_DATE('2018-09-02','YYYY-MM-DD'),'S003',30);


select * from tbl_salelist_01;

select tsl.saleno,tp.pcode,tsl.saledate,ts.scode,tp.name,tsl.amount,TO_CHAR(SUM(tp.cost * tsl.amount),'999,999,999,999') cost from tbl_product_01 tp INNER JOIN tbl_salelist_01 tsl ON tp.pcode = tsl.pcode INNER JOIN tbl_shop_01 ts ON tsl.scode = ts.scode GROUP BY tsl.saleno,tp.pcode,tsl.saledate,ts.scode,tp.name,tsl.amount,cost ORDER BY 1

select tsl.scode,ts.sname,TO_CHAR(SUM(tp.cost * tsl.amount),'999,999,999,999') cost from  tbl_salelist_01 tsl INNER JOIN tbl_product_01 tp ON tsl.pcode = tp.pcode INNER JOIN tbl_shop_01 ts ON tsl.scode = ts.scode GROUP BY tsl.scode,ts.sname,cost ORDER BY 1

	


