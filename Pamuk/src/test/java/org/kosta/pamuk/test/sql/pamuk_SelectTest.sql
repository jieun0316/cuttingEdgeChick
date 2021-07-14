select * from MEMBER;
select * from RECIPE;
select * from RECIPE_ITEM;

select * from RECIPE_CONTENT;
select * from authorities;
select * from review

SELECT M.name, M.nick, A.authority FROM member M, authorities A	WHERE M.member_id=A.member_id;
select count(*) from member where member_id='aa'

SELECT  x.* 
FROM (
SELECT ROWNUM rn, r.recipe_no, m.nick, r.recipe_name, to_char(r.write_date,'YYYY-MM-DD') as write_date, r.category
FROM RECIPE r, member m
WHERE m.member_id = r.member_id and category='한식' ORDER BY recipe_no DESC)
x WHERE rn BETWEEN 1 AND 2

select * from recipe
select member_id, recipe_no, review_comment, rating, to_char(review_date, 'yyyy-mm-dd hh24:mi') as review_date from review where recipe_no='6' order by review_date asc;