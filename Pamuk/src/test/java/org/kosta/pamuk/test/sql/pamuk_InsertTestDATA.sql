--회원 관련 테스트 데이터
insert into MEMBER (member_id, password, email, name, nick, birth, gender) values ('java','a','a@ab.com','아이유','IU','2010-10-10', 'F');

--회원 권한 관련 테스트 데이터
insert into authorities(member_id, authority) values('sukuon', 'ROLE_MEMBER');
insert into authorities(member_id, authority) values('sukuon', 'ROLE_ADMIN');
insert into authorities(member_id, authority) values('sukuon', 'ROLE_MASTER');
select * from authorities
--카테고리
insert into CATEGORY (category_name, storage_time) values ('계란류','30');
insert into category VALUES ('채소','5일');
insert into category VALUES ('과일','5일');
insert into category values ('조미료장류/양념/가루/오일','180일');

--아이템
insert into ITEM (item_name, category_name) values ('계란', '계란류');
insert into item VALUES ('감자','채소');
insert into item VALUES ('당근','채소');
insert into item VALUES ('수박','과일');
insert into item VALUES ('딸기','과일');
insert into item VALUES ('설탕', '조미료장류/양념/가루/오일');
insert into item values ('간장', '조미료장류/양념/가루/오일');

--저장된 아이템
insert into stored_item VALUES(stored_item_seq.nextval,22,'감자','주말농장','20210701','20210730','5알');
insert into stored_item VALUES(stored_item_seq.nextval,22,'당근','주말농장','20210702','20210731','1개');
insert into stored_item VALUES(stored_item_seq.nextval,23,'수박','정윤최애','20210702','20210731','1통');
insert into stored_item VALUES(stored_item_seq.nextval,24,'딸기','지은최애','20210702','20210731','1바구니');



insert into MEMBER(member_id,password,email,name, nick, birth, gender) 
		values("scv",#{password},#{email},#{name},#{nick},to_date(#{birth}, 'yyyy-mm-dd') as birth, #{gender})
		delete from authorities;
		delete from member;
		commit
		select * from member
		select * from authorities