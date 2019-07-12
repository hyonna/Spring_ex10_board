
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
drop table Product
select * from Product

select * from Thumbnail;
select * from product P full join Options O using(pid);
select P.*, T.num, T.oname, T.fname from product P full join Thumbnail T on(P.pid=T.pid) order by reg_date desc;

insert into options values(product_seq.nextval, 'B1562917517557', 'white');
insert into options values(product_seq.nextval, 'B1562917517557', 'red');
insert into options values(product_seq.nextval, 'T1562917629039', 'blue');
insert into options values(product_seq.nextval, 'T1562917629039', 'green');

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