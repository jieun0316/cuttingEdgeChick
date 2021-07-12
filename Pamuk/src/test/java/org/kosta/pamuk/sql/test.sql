drop table member;
drop table authorities;
drop table recipe;
drop table review;

select * FROM MEMBER
DROP TABLE member CASCADE CONSTRAINTS;

select * from authorities; 

--1
create table member(
   member_id varchar2(100) primary key,
   password varchar2(100) not null,
   email varchar2(100) not null unique,
   name varchar2(100) not null,
   nick varchar2(100) not null
)

--2
create table authorities(
   member_id varchar2(100) not null,
   authority varchar2(30) not null,
   constraint fk_authorities foreign key(member_id) references member(member_id),
   constraint member_authorities primary key(member_id,authority)
)

--3
create sequence recipe_seq
create table recipe(
   recipe_no NUMBER primary key,
   member_id varchar2(100) not null,
   recipe_name varchar2(100) not null,
   write_date DATE not null,
   modify_date DATE,
   category varchar2(100) not null,
   hits NUMBER not null,
   constraint fk_recipe foreign key(member_id) references member(member_id)
)

--4
create table review(
   member_id varchar2(100) not null,
   recipe_no NUMBER not null,
   review_comment blob,
   grade NUMBER not null,
   review_date DATE not null,
   constraint fk_review_member foreign key(member_id) references member(member_id),
   constraint fk_review_recipe foreign key(recipe_no) references recipe(recipe_no),
   constraint member_review primary key(member_id,recipe_no)
)

create table recipe_content(
   recipe_no NUMBER not null,   
   step_no NUMBER not null,
   step_title varchar2(100) not null,
   content blob not null,
   image_path blob,
   constraint fk_recipe_content foreign key(recipe_no) references recipe(recipe_no),
   constraint recipe_content primary key(recipe_no,step_no)
)

create saved_recipe(
   member_id varchar2(100) not null,
   recipe_no number not null,
   saved_date DATE not null,
   constraint fk_member_saved foreign key(member_id) references member(member_id),
   constraint fk_recipe_saved foreign key(recipe_no) references recipe(recipe_no),
   constraint recipe_content primary key(member_id,recipe_no)
)

create recipe_item(
   item_name varchar2(100) not null,
   recipe_no number not null,
   qty varchar2(30),
   constraint fk_recipe_item foreign key(item_name) references item(item_name),
   constraint fk_recipe_item_recipe foreign key(recipe_no) references recipe(recipe_no),
   constraint recipe_content primary key(item_name,recipe_no)
)

---------------------------------------------------------------

create table category(
   category_name varchar2(100) primary key,
   storage_time varchar2(100)  not null
);

create table item(
   item_name varchar2(100) primary key,
   category_name varchar2(100) not null,
   constraint fk_category foreign key(category_name) references category(category_name)
);

create table storage(
   storage_no number primary key,
   member_id varchar2(100) not null,
   type varchar2(100) not null,
   location_no number not null
   constraint fk_member_storage foreign key (member_id) references member(member_id)
);
create sequence storage_seq;

create table stored_item(
   stored_item_no number primary key,
   storage_no number not null,
   item_name varchar2(100) not null,
   expiry_date date, 
   stored_date date,
   qty varchar2(30),
   constraint fk_storage_no foreign key (storage_no) references storage(storage_no),
   constraint fk_item_name foreign key (item_name) references item(item_name)
);
create sequence stored_item_seq;

select * from recipe;
select * from category;
select * from item;
select * from storage
select * from stored_item

drop table category;
drop table item;
drop table storage;
drop sequence storage_seq;
drop table stored_item;
drop sequence stored_item_seq;

<<<<<<< HEAD
SELECT rnum_view.*
FROM (
	SELECT ROWNUM as rnum, recipe_view.*
	FROM
		(SELECT r.recipe_no, m.nick, r.recipe_name, hits, r.category
		FROM RECIPE r, member m
		WHERE m.member_id = r.member_id ORDER BY recipe_no DESC)recipe_view
	)rnum_view
WHERE rnum between '1' and '6'
=======
select member_id, name, email, to_char(birth, 'yyyy-mm-dd') as birth from member where member_id='sukuon' and status=0
>>>>>>> refs/heads/WaterPunch

select * from member;
