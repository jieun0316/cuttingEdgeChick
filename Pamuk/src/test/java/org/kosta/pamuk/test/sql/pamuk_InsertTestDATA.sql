--회원 관련 테스트 데이터
insert into MEMBER (member_id, password, email, name, nick, birth, gender) values ('java','a','a@ab.com','아이유','IU','2010-10-10', 'F');

--카테고리
insert into CATEGORY (category_name, storage_time) values ('계란류','30');

--아이템
insert into ITEM (item_name, category_name) values ('계란', '계란류');