select * from member
insert into RECIPE(recipe_no,member_id,recipe_name,category) values(1,'yang','name','한식');
insert into RECIPE(recipe_no,member_id,recipe_name,category) values(2,'yang','name','한식');

insert into REPORT_RECIPE(recipe_no,report_content) values (1,'음란');
insert into REPORT_RECIPE(recipe_no,report_content) values (1,'노잼');
insert into REPORT_RECIPE(recipe_no,report_content) values (2,'음란');
insert into REPORT_RECIPE(recipe_no,report_content) values (2,'노잼');
		
select count(*)
		from report_recipe
		where recipe_no=1 and report_content='음란'
		
		
create table recipe(
	recipe_no NUMBER primary key,
	member_id varchar2(100) not null,
	recipe_name varchar2(100) not null,
	write_date DATE default sysdate,
	modify_date DATE,
	category varchar2(100) not null,
	recipe_thumbnail varchar2(1000),
	hits NUMBER default 0,
	constraint fk_recipe foreign key(member_id) references member(member_id)
);