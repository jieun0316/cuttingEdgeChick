-- test sql 
-- subin
select * from MEMBER;
select * from RECIPE;
select * from RECIPE_ITEM;
select * from RECIPE_CONTENT;

-- 레시피 검색
select * from RECIPE_ITEM where item_name LIKE '%설%';
-- RECIPE 검색 ( recipe_name )
select * from RECIPE where recipe_name LIKE '%스시%';
-- RECIPE_CONTENT ( step_title )
select * from RECIPE_CONTENT where step_title LIKE '%만들기%';
-- RECIPE_CONTENT ( content )
select * from RECIPE_CONTENT where content LIKE '%간장%';


-- 작성자 검색
-- RECIPE (member_id )
select * from RECIPE where member_id IN ('java')

-- RECIPE_CONTENT 합치기

-- MAIN page BEST Recipe 
select recipe_no ,recipe_name, category, hits from recipe order by hits desc;
TO_CHAR(mydate, 'YYYY.MM.DD')
-- MAIN page Recent Recipe
select recipe_no ,recipe_name, category, TO_CHAR(write_date, 'YYYY.MM.DD') as write_date from recipe order by write_date desc

delete from recipe where recipe_no='21';


-- member 닉네임으로 검색
SELECT  x.* 
FROM (
SELECT ROWNUM rn, r.recipe_no, m.nick, m.member_id, r.recipe_name, to_char(r.write_date,'YYYY-MM-DD') as write_date, r.category
FROM RECIPE r, member m
WHERE r.member_id = m.member_id AND m.nick = 'kove' ORDER BY recipe_no DESC)
x WHERE rn BETWEEN 1 AND 2


