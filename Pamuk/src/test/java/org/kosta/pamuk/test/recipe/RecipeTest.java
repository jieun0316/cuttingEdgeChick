package org.kosta.pamuk.test.recipe;

import org.junit.jupiter.api.Test;
import org.kosta.pamuk.model.mapper.RecipeMapper;
import org.kosta.pamuk.model.vo.MemberVO;
import org.kosta.pamuk.model.vo.RecipeVO;
import org.kosta.pamuk.service.RecipeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class RecipeTest {
	@Autowired
	RecipeMapper rm;
	
	@Autowired
	RecipeService rs;
	
	@Test
	public void postRecipe() {
		RecipeVO recipeVO = new RecipeVO();
		MemberVO memberVO = new MemberVO();
		memberVO.setMemberId("java");
		recipeVO.setMemberVO(memberVO);
		recipeVO.setCategory("한식");
		recipeVO.setRecipeName("계란장");
		rs.postRecipe(recipeVO);
		System.out.println(recipeVO);
	}
}
