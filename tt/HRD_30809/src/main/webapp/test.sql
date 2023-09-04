create table pizza(
	pcode char(4) primary key,
	pname varchar2(30),
	cost number(7)
)

insert into pizza values ('AA01','고르곤졸라피자',6000);
insert into pizza values ('AA02','치즈피자',6500);
insert into pizza values ('AA03','페퍼로니피자',7000);
insert into pizza values ('AA04','콤비네이션피자',7500);
insert into pizza values ('AA05','고구마피자',6000);
insert into pizza values ('AA06','포테이토피자',7000);
insert into pizza values ('AA07','불고기피자',8000);
insert into pizza values ('AA08','나폴리피자',8000);

create table shop(
	scode char(4) primary key,
	sname varchar(20)
)

select b.saleno,c.scode,c.sname,TO_CHAR(B.saledate,'yyyy-mm-dd') saledate,a.pcode,a.pname,b.amount,TO_CHAR(a.cost * b.amount,'999,999,999') cost
from pizza a,salelist b,shop c where a.pcode = b.pcode and b.scode = c.scode ORDER by 1

select s.scode,s.sname,TO_CHAR(sum(l.amount * p.cost),'999,999,999,999') cost from shop s, salelist l,pizza p WHERE l.scode = s.scode and p.pcode = l.pcode GROUP BY s.scode,s.sname ORDER by 1

insert into shop values ('S001','강남점');
insert into shop values ('S002','강서점');
insert into shop values ('S003','강동점');
insert into shop values ('S004','영동점');
insert into shop values ('S005','시청점');
insert into shop values ('S006','인천점');

create table salelist(
	saleno number(7) primary key,
	scode char(4),
	saledate date,
	pcode char(4),
	amount number(5),
	CONSTRAINT salelist_scode_fk FOREIGN KEY(scode) REFERENCES shop(scode),
	CONSTRAINT salelist_pcode_fk FOREIGN KEY(pcode) REFERENCES pizza(pcode)
)


select p.pcode,p.pname,TO_CHAR(sum(l.amount * p.cost),'999,999,999,999') cost from shop s, salelist l,pizza p WHERE l.scode = s.scode and p.pcode = l.pcode GROUP BY p.pcode,p.pname ORDER by 1















insert into salelist values('100001', 'S001', to_date('2018-12-02', 'yyyy-mm-dd'), 'AA01', 50);
insert into salelist values('100002', 'S001', to_date('2018-12-02', 'yyyy-mm-dd'), 'AA02', 30);
insert into salelist values('100003', 'S001', to_date('2018-12-02', 'yyyy-mm-dd'), 'AA03', 20);
insert into salelist values('100004', 'S001', to_date('2018-12-02', 'yyyy-mm-dd'), 'AA04', 50);
insert into salelist values('100005', 'S003', to_date('2018-12-03', 'yyyy-mm-dd'), 'AA01', 40);
insert into salelist values('100006', 'S003', to_date('2018-12-03', 'yyyy-mm-dd'), 'AA02', 60);
insert into salelist values('100007', 'S003', to_date('2018-12-03', 'yyyy-mm-dd'), 'AA04', 60);
insert into salelist values('100008', 'S003', to_date('2018-12-04', 'yyyy-mm-dd'), 'AA05', 70);
insert into salelist values('100009', 'S005', to_date('2018-12-02', 'yyyy-mm-dd'), 'AA01', 80);
insert into salelist values('100010', 'S005', to_date('2018-12-02', 'yyyy-mm-dd'), 'AA03', 30);
insert into salelist values('100011', 'S005', to_date('2018-12-02', 'yyyy-mm-dd'), 'AA04', 40);
insert into salelist values('100012', 'S005', to_date('2018-12-02', 'yyyy-mm-dd'), 'AA05', 50);
insert into salelist values('100013', 'S004', to_date('2018-12-04', 'yyyy-mm-dd'), 'AA01', 30);
insert into salelist values('100014', 'S004', to_date('2018-12-04', 'yyyy-mm-dd'), 'AA02', 20);
insert into salelist values('100015', 'S004', to_date('2018-12-04', 'yyyy-mm-dd'), 'AA06', 50);

commit




