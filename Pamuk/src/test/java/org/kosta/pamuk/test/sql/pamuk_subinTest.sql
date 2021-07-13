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
select * from RECIPE r, member m where r.member_id = m.member_id AND m.nick IN ('kove')
select count(*) from RECIPE r, member m where r.member_id = m.member_id AND m.nick IN ('kove')

-- RECIPE_CONTENT 합치기

-- 식재료 검색
select count(*) from RECIPE_ITEM where item_name IN ('설탕')
-- join 사용
select r.recipe_no ,r.recipe_name, r.category, ri.item_name, TO_CHAR(r.write_date, 'YYYY.MM.DD') as write_date
from RECIPE r, RECIPE_ITEM ri
where r.recipe_no = ri.recipe_no AND ri.item_name IN ('사과')

-- 레시피 카운트
select count(*)
from 
(
	select DISTINCT r.recipe_no ,r.recipe_name, r.category, TO_CHAR(r.write_date, 'YYYY.MM.DD') as write_date
	from RECIPE r, RECIPE_CONTENT rc
	where r.recipe_no = rc.recipe_no AND (r.recipe_name LIKE '%' || '계란' || '%' OR rc.step_title LIKE '%' || '계란' || '%' OR rc.content LIKE '%' || '계란' || '%' )
)

select DISTINCT count(*)
from RECIPE r, RECIPE_CONTENT rc
where r.recipe_no = rc.recipe_no AND (r.recipe_name LIKE '%' || '계란' || '%' OR rc.step_title LIKE '%' || '계란' || '%' OR rc.content LIKE '%' || '계란' || '%' )

-- 레시피 검색
select DISTINCT r.recipe_no ,r.recipe_name, r.category, TO_CHAR(r.write_date, 'YYYY.MM.DD') as write_date
from RECIPE r, RECIPE_CONTENT rc
where r.recipe_no = rc.recipe_no AND (r.recipe_name LIKE '%' || '스시' || '%' OR rc.step_title LIKE '%' || '스시' || '%' OR rc.content LIKE '%' || '스시' || '%' )


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


