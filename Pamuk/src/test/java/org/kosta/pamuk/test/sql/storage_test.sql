create table member(
	member_id varchar2(100) primary key,
	password varchar2(100) not null,
	email varchar2(100) not null unique,
	name varchar2(100) not null,
	nick varchar2(100) not null,
	status NUMBER default 0,
	birth DATE not null
)
INSERT INTO member VALUES ('java','a','java@email.com','아이유','자바',0,'19930316')

create table storage(
   storage_no number primary key,
   member_id varchar2(100) not null,
   type varchar2(100) not null,
   location_no number not null,
   constraint fk_storage foreign key(member_id) references member(member_id)
);
create sequence storage_seq;
INSERT INTO storage VALUES (storage_seq.nextval, 'java', '냉장', 1)
DELETE FROM storage WHERE member_id='java'
select * from member;
select * from storage;
delete from STORAGE
select * from STORED_ITEM;
select * from item; 
select * from category; 

---정윤-------------------------------------------
insert into storage values (1, 'java','냉장')
------------------------------------------------
insert into category VALUES ('채소','5일');
insert into category VALUES ('과일','5일');
insert into category VALUES ('유제품','6일');
insert into category VALUES ('어패류','7일');
insert into category VALUES ('육류','15일');
insert into category VALUES ('양념','30일');
insert into category VALUES ('소스','60일');
insert into category VALUES ('즉석식품','50일');
insert into category VALUES ('기타','30일');

--
--

insert into item VALUES ('감자','채소');
insert into item VALUES ('브로콜리','채소');
insert into item VALUES ('당근','채소');
insert into item VALUES ('수박','과일');
insert into item VALUES ('딸기','과일');
insert into stored_item VALUES(stored_item_seq.nextval,1,'감자','주말농장','20210701','20210730','5알');
insert into stored_item VALUES(stored_item_seq.nextval,1,'브로콜리','주말농장','20210701','20210730','5개');
insert into stored_item VALUES(stored_item_seq.nextval,1,'수박','정윤최애','20210705','20210730','2개');
delete from stored_item where stored_item_no =2;

--
insert into stored_item VALUES(stored_item_seq.nextval,22,'당근','주말농장','20210702','20210731','1개');
insert into stored_item VALUES(stored_item_seq.nextval,23,'수박','정윤최애','20210702','20210731','1통');
insert into stored_item VALUES(stored_item_seq.nextval,24,'딸기','지은최애','20210702','20210731','1바구니');

update STORED_ITEM set QTY = '8알' , STORED_DATE='20210705', EXPIRY_DATE='20210830' where STORAGE_NO=1; 	
-------------------------------------------------


