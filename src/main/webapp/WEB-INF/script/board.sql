
select * from
member M join
memberFile F using(id)
where id='iu' and pw='iu';


select M.*, F.* 
from member M 
inner join memberFile F 
on(M.id=F.id) 
where id=#{id} and pw=#{pw}

create table files(

	fnum number(8) constraint files_fnum_pk primary key,
	num number(8) not null,
	fname varchar2(2000),
	oname varchar2(2000)

);

select fnum from files where num=55;


update /*+ bypass_ujvc */
qna Q, files F join set 
Q.title='title', Q.writer='writer', Q.contents='contents',
F.fname='aaa.png', F.oname='aaa.png'
where num=55;


update (
	select Q.title,
	Q.writer,
	Q.contents,
	F.fname
	from qna Q join files F
	on (Q.num=F.num) where Q.num=55
)
set Q.title='title', Q.writer='writer', 
Q.contents='contents', F.fname='aaa'


select * from files

commit

select * from notice


create table notice(
	num number(8),
	title varchar2(400),
	writer varchar2(400),
	contents clob,
	reg_date date,
	hit number(8),
	constraint notice_num_pk primary key (num)
);

create sequence notice_seq
start with 1
increment by 1
nomaxvalue
nocache
nocycle;

create sequence qna_seq
start with 1
increment by 1
nomaxvalue
nocache
nocycle;


create sequence memberfile_seq
start with 1
increment by 1
nomaxvalue
nocache
nocycle;


create table member(

	id varchar2(400),
	pw varchar2(400) not null,
	name varchar2(400) not null,
	email varchar2(400) not null,
	grade number(8) default 3,
	constraint member_id_pk primary key(id)
	

);

select * from member

drop table member;

delete member where id='id';

create table files(

	fnum number(8),
	num number(8),
	fname varchar2(2000),
	oname varchar2(2000),
	constraint files_fnum_pk primary key(fnum)
);

select * from notice
select * from files;
select * from qna;
select * from memberFile where id='id';
select qna_seq.nextval from dual

select * from
notice N full join
files F using(num)
where num=36;

select * from
qna Q full join
files F using(num)
where num=15;

update(

	select Q.num from
	qna Q, files F
	where Q.title='title'
	and Q.writer='writer'
	and Q.contents='contents'
	and F.fname='2.jpg'
	and F.oname='2.jpg'
)
set num=55;


commit


create table notice(
num number(8),
title varchar2(400),
writer varchar2(400),
contents clob,
reg_date date,
hit number(8),
constraint notice_num_pk primary key (num)
);

create sequence notice_seq
start with 1
nomaxvalue
nocache
nocycle;



insert into notice values (notice_seq.nextval, 'happy', 'admin', 'contents', sysdate, 0)
select count(num) from notice;
select * from notice;

create table qna(
num number(8),
title varchar2(400),
writer varchar2(400),
contents clob,
reg_date date,
hit number(8),
ref number(8),
step number(8),
depth number(8),
constraint qna_num_pk primary key (num)
);

insert into qna values(qna_seq.nextval, 'title', 'writer', null, sysdate, 0, qna_seq.currval, 0, 0)

commit



select * from
(select rownum R, N.* from
(select * from notice order by num desc) N)
where R between 1 and 10;





select * from
 		(select rownum R, M.* from
 		(select * from member M full join memberFile F using(id) where grade != 0 and
 		id like '%%' ORDER BY grade desc) M)
 			where R between 1 and 10
