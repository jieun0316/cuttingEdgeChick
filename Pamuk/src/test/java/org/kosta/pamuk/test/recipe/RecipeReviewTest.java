package org.kosta.pamuk.test.recipe;

import org.junit.jupiter.api.Test;
import org.kosta.pamuk.model.mapper.RecipeMapper;
import org.kosta.pamuk.model.vo.ReportVO;
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
	@Autowired
	RecipeMapper rm;
	@Test
	void test() {
		/*
		ReviewVO reviewVO = new ReviewVO();
		MemberVO memberVO = new MemberVO();
		RecipeVO recipeVO = new RecipeVO();
		memberVO.setMemberId("sukuon");
		recipeVO.setRecipeNo(6);
		String reviewComment = "인재야 사랑한다고 진짜루";
		//int rating = 5;
		
		reviewVO.setMemberVO(memberVO);
		reviewVO.setRecipeVO(recipeVO);
		reviewVO.setReviewComment(reviewComment);
		//reviewVO.setRating(rating);
		//rs.writeReview(reviewVO);
		rs.updateReview(reviewVO);

		System.out.println(rs.readReview(6));
		*/
		//System.out.println(rm.countReview(6));
		//System.out.println(rs.getBestRecipeListForMain());
		/*ReportVO reportVO = new ReportVO();
		reportVO.setRecipeNo(6);
		reportVO.setReportContent("홍보");
		rs.reportRecipe(reportVO);*/
		ReportVO reportVO = new ReportVO();
		reportVO.setRecipeNo(6);
		reportVO.setReportContent("기타");
		rs.reportRecipe(reportVO);
		System.out.println(rs.reportedRecipeList());
		
	}

}
