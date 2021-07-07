-- test sql 
-- subin
select * from MEMBER;
select * from RECIPE;
select * from RECIPE_ITEM;
select * from RECIPE_CONTENT;

-- RECIPE_ITEM 검색
select * from RECIPE_ITEM where item_name LIKE '%설%';
-- RECIPE 검색 ( recipe_name, member_id)
select * from RECIPE where recipe_name LIKE '%스시%';
-- RECIPE_CONTENT ( step_title )
select * from RECIPE_CONTENT where step_title LIKE '%만들기%';
-- RECIPE_CONTENT ( content )
select * from RECIPE_CONTENT where content LIKE '%간장%';

-- RECIPE_CONTENT 합치기
select * from RECIPE_CONTENT where(
	select 
)

