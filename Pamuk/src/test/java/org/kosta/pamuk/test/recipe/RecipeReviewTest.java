package org.kosta.pamuk.test.recipe;

import org.junit.jupiter.api.Test;
import org.kosta.pamuk.service.MemberService;
import org.kosta.pamuk.service.RecipeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
@SpringBootTest
class RecipeReviewTest {
	@Autowired
	RecipeService rs;
	@Autowired
	MemberService ms;
	@Test
	void test() {
		/*
		ReviewVO reviewVO = new ReviewVO();
		MemberVO memberVO = new MemberVO();
		RecipeVO recipeVO = new RecipeVO();
		memberVO.setMemberId("yang");
		recipeVO.setRecipeNo(6);
		String reviewComment = "집에서 만들기 정말 쉬워요";
		int rating = 5;
		
		reviewVO.setMemberVO(memberVO);
		reviewVO.setRecipeVO(recipeVO);
		reviewVO.setReviewComment(reviewComment);
		reviewVO.setRating(rating);
		rs.writeReview(reviewVO);
		*/

		
		System.out.println(rs.readReview(6));
	}

}
