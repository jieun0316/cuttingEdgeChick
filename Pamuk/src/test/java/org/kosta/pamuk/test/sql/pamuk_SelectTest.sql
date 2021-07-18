select * from MEMBER;
select * from RECIPE;
select * from RECIPE_ITEM;
select * from SAVED_RECIPE;
select * from RECIPE_CONTENT;
select * from authorities;
select * from review

delete from SAVED_RECIPE

truncate table review

SELECT M.name, M.nick, A.authority FROM member M, authorities A	WHERE M.member_id=A.member_id;
select count(*) from member where member_id='aa'

SELECT  x.* 
FROM (
SELECT ROWNUM rn, r.recipe_no, m.nick, r.recipe_name, to_char(r.write_date,'YYYY-MM-DD') as write_date, r.category
FROM RECIPE r, member m
WHERE m.member_id = r.member_id and category='한식' ORDER BY recipe_no DESC)
x WHERE rn BETWEEN 1 AND 2


   select r.recipe_no, r.recipe_name, r.recipe_thumbnail, r.category, TO_CHAR(r.write_date, 'YYYY.MM.DD') as write_date
   from RECIPE r 
   where r.recipe_name LIKE '%' || '딸기' || '%' 
   
   union
   
   select r.recipe_no, r.recipe_name, r.recipe_thumbnail, r.category, TO_CHAR(r.write_date, 'YYYY.MM.DD') as write_date
   from RECIPE r, RECIPE_CONTENT rc
   where r.recipe_no = rc.recipe_no and 
   		(rc.step_title LIKE '%' || '딸기' || '%' 
	 	OR rc.content LIKE '%' || '딸기' || '%' )
	 	
	 	
	 	
	 	
	 select r.recipe_no, r.recipe_name, r.recipe_thumbnail, r.category, TO_CHAR(r.write_date, 'YYYY.MM.DD') as write_date
   from RECIPE r, RECIPE_CONTENT rc
   where r.recipe_no = rc.recipe_no 
   AND 
   (r.recipe_name LIKE '%' || '딸기' || '%' 
   OR 
   rc.step_title LIKE '%' || '딸기' || '%' 
   OR 
   rc.content LIKE '%' || '딸기' || '%' )
	  

select * from recipe
select member_id, recipe_no, review_comment, rating, to_char(review_date, 'yyyy-mm-dd hh24:mi') as review_date from review where recipe_no='6' order by review_date asc;


select * from member;
select * from authorities;
select * from review where recipe_no='6'

update review set review_comment='인재야 사랑한다!' where member_id='sukuon' and recipe_no='6'




select sr.recipe_no, m.nick, r.recipe_name, r.hits, r.category, r.recipe_thumbnail
from saved_recipe sr, recipe r, member m
where sr.recipe_no = r.recipe_no and r.member_id = m.member_id
	and sr.member_id='java'
order by sr.saved_date



SELECT rnum_view.*
      FROM 
         SELECT ROWNUM as rnum, recipe_view.*
         FROM (
	            SELECT r.recipe_no, m.nick, r.recipe_name, hits, r.category, r.recipe_thumbnail, avg(re.rating)
	            FROM RECIPE r, member m, review re
	            WHERE m.member_id = r.member_id 
	            	and re.recipe_no(+) = r.recipe_no
            	group by r.recipe_no, m.nick, r.recipe_name, hits, r.category, r.recipe_thumbnail
	        	ORDER BY r.recipe_no DESC
            )recipe_view
      )rnum_view
WHERE rnum between 1 and 4



select r.recipe_no, r.category, avg(re.rating) from review re,  recipe r where re.recipe_no(+) = r.recipe_no and r.category='한식'




SELECT rnum_view.*
		FROM (
			SELECT ROWNUM as rnum, recipe_view.*
			FROM
				(SELECT r.recipe_no, m.nick, r.recipe_name, hits, r.category, r.recipe_thumbnail,  avg(re.rating)
				FROM RECIPE r, member m, review re
				WHERE m.member_id = r.member_id and re.recipe_no(+) = r.recipe_no
				group by r.recipe_no 
				ORDER BY recipe_no DESC
				)recipe_view
			)rnum_view
		WHERE rnum between 1 and 4
		
		
		
		
		SELECT rnum_view.*
		FROM (
			SELECT ROWNUM as rnum, recipe_view.*
			FROM
				(SELECT r.recipe_no, m.nick, r.recipe_name, hits, r.category, r.recipe_thumbnail,  avg(re.rating) as rating
				FROM RECIPE r, member m,  review re
				WHERE m.member_id = r.member_id
				 and re.recipe_no(+) = r.recipe_no
				 and category='한식'
				 group by r.recipe_no, m.nick, r.recipe_name, hits, r.category, r.recipe_thumbnail
				 ORDER BY recipe_no DESC)recipe_view
			)rnum_view
		WHERE rnum between '1' and' 1'
		
		SELECT rnum_view.*
      FROM (
         SELECT ROWNUM as rnum, recipe_view.*
         FROM
            (SELECT r.recipe_no, m.nick, r.recipe_name, hits, r.category, r.recipe_thumbnail,  to_char(write_date, 'yyyy-mm-dd hh24:mi') as write_date, avg(re.rating) as rating
               FROM RECIPE r, member m, review re
               WHERE m.member_id = r.member_id 
                  and re.recipe_no(+) = r.recipe_no
               group by r.recipe_no, m.nick, r.recipe_name, hits, r.category, r.recipe_thumbnail, write_date
              ORDER BY r.recipe_no DESC
            )recipe_view
         )rnum_view
		WHERE rnum between '1' and '9'
		
		SELECT r.recipe_no, m.nick, r.recipe_name, hits, r.category, r.recipe_thumbnail, to_char(write_date, 'yyyy-mm-dd hh24:mi') as write_date, avg(re.rating) as rating
               FROM RECIPE r, member m, review re
               WHERE m.member_id = r.member_id 
                  and re.recipe_no = r.recipe_no and sysdate - write_date <= 30 
               group by r.recipe_no, m.nick, r.recipe_name, hits, r.category, r.recipe_thumbnail, write_date

select au.authority, m.member_id, m.email, m.nick, to_char(m.birth, 'yyyy-mm-dd') as birth
		from member m, authorities au
		where m.member_id = au.member_id and m.member_id not in (select member_id
		from AUTHORITIES where authority= 'ROLE_STARCHEF' or authority= 'ROLE_ADMIN' or
		authority='ROLE_MASTER')
              ORDER BY hits, rating DESC
