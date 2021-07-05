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
select * from STORED_ITEM;
