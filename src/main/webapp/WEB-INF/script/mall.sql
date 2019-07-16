
-------------------------------------- 제품
CREATE TABLE Product
(
    Pid              VARCHAR2(400)    NOT NULL, 
    Category         VARCHAR2(100)    NULL, 
    title            VARCHAR2(400)    NULL, 
    price            NUMBER(8)        NULL, 
    subContents      VARCHAR2(400)    NULL, 
    mainContents     CLOB             NULL, 
    amount           NUMBER(8)        NULL, 
    reg_date         DATE             NULL, 
    CONSTRAINT PRODUCT_PID_PK PRIMARY KEY (Pid)
);

CREATE SEQUENCE product_SEQ
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOCYCLE
NOCACHE

delete Product
delete Product where category='T';
select * from Product

select * from Thumbnail;
select * from product P full join Options O using(pid);
select P.*, T.num, T.oname, T.fname from product P full join Thumbnail T on(P.pid=T.pid) order by reg_date desc;

insert into options values(product_seq.nextval, 'T1562925026034', 'white');
insert into options values(product_seq.nextval, 'T1562925026034', 'red');
insert into options values(product_seq.nextval, 'T1562925026034', 'blue');
insert into options values(product_seq.nextval, 'T1562925026034', 'green');

select count(pid) from product where title like '%%';


commit

------------------------------------- 옵션

CREATE TABLE Options
(
    num         NUMBER(8)        NOT NULL, 
    Pid         VARCHAR2(400)    NULL, 
    Contents    VARCHAR2(400)    NULL, 
    CONSTRAINT OPTIONS_NUM_PK PRIMARY KEY (num),
    CONSTRAINT OPTIONS_PID_FK FOREIGN KEY (Pid) REFERENCES Product (Pid)
    ON DELETE CASCADE
);


CREATE SEQUENCE Options_SEQ
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOCYCLE
NOCACHE

drop table Options;

-------------------------------------- 파일

CREATE TABLE Thumbnail
(
    num      NUMBER(8)        NOT NULL, 
    Pid      VARCHAR2(400)    NULL, 
    fname    VARCHAR2(400)    NULL, 
    oname    VARCHAR2(400)    NULL, 
    CONSTRAINT THUMBNAIL_PK PRIMARY KEY (num),
    CONSTRAINT THUMBNAIL_PID_FK FOREIGN KEY (Pid) REFERENCES Product (Pid)
    ON DELETE CASCADE
)


CREATE SEQUENCE Thumbnail_SEQ
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOCYCLE
NOCACHE

------------------------------------------


commit

select * from OPTIONS


		select C.num, P.title, O.contents, C.amount, P.price 
		from cart C inner join product P
		on (C.pid=P.pid)
		inner Join options O
		on (C.options=O.num)
		where C.id = 'iu'


-------------------------------------- 장바구니

CREATE TABLE cart
(
	num    NUMBER(8), 
    id      VARCHAR2(400), 
    Pid      VARCHAR2(400), 
    options	 NUMBER(8),
    amount    NUMBER(8), 
    CONSTRAINT cart_num_PK PRIMARY KEY (num),
    CONSTRAINT cart_PID_FK FOREIGN KEY (Pid) REFERENCES Product (Pid) ON DELETE CASCADE,
    CONSTRAINT cart_ID_FK FOREIGN KEY (id) REFERENCES member (id) ON DELETE CASCADE
    
)

select * from cart
drop table cart
commit

delete cart where id='iu';

update cart set amount=2 where num=34 and id='iu'

delete cart where num in (34, 35);



-------------------------------------- qna


create table productqna
(
	pid 		varchar2(400),
	num 		number(8),
	title 		varchar2(400),
	writer 		varchar2(400),
	contents 	clob,
	reg_date 	date,
	hit 		number(8),
	ref 		number(8),
	step 		number(8),
	depth 		number(8),
	constraint productqna_num_pk primary key (num)
);

insert into productqna values('B1562924732078', product_seq.nextval, 'title1', 'writer1', 'contents1', sysdate, 0, product_seq.currval, 0, 0)

select * from productqna where pid='T1562925026034';
select * from seq

delete productqna where num=46

commit

select * from
(select rownum R, P.* from
(select num, title, writer, reg_date, hit from productqna order by num desc) P)
where R between 1 and 10


select contents from productqna where num=50

select * from
	(select rownum R, P.* from
	(select * from productqna where pid='T1562925026034'
	order by ref desc, step asc) P)
	where R between 1 and 10
