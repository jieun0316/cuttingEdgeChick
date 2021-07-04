select * from MEMBER;
select * from RECIPE;
select * from RECIPE_ITEM;
select * from RECIPE_CONTENT;





SELECT  x.* 
FROM (
SELECT ROWNUM rn, r.recipe_no, m.nick, r.recipe_name, to_char(r.write_date,'YYYY-MM-DD') as write_date, r.category
FROM RECIPE r, member m
WHERE m.member_id = r.member_id and category='한식' ORDER BY recipe_no DESC)
x WHERE rn BETWEEN 1 AND 2