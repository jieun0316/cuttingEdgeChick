package org.kosta.pamuk.test.recipe;

import org.junit.jupiter.api.Test;
import org.kosta.pamuk.model.mapper.RecipeMapper;
import org.kosta.pamuk.model.vo.CategoryVO;
import org.kosta.pamuk.model.vo.ItemVO;
import org.kosta.pamuk.model.vo.MemberVO;
import org.kosta.pamuk.model.vo.RecipeContentVO;
import org.kosta.pamuk.model.vo.RecipeItemVO;
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
		int testCase = 3;

		// recipe Insert test
		if (testCase == 1) {
			RecipeVO recipeVO = new RecipeVO();
			MemberVO memberVO = new MemberVO();
			memberVO.setMemberId("java");
			recipeVO.setMemberVO(memberVO);
			recipeVO.setCategory("한식");
			recipeVO.setRecipeName("계란장");
			rm.postRecipe(recipeVO);
			System.out.println(recipeVO);
		}

		// recipe content Insert Test
		else if (testCase == 2) {
			RecipeContentVO recipeContentVO = new RecipeContentVO();
			recipeContentVO.setContent("계란을 15분간 삶으세요");
			recipeContentVO.setImagePath("");
			recipeContentVO.setRecipeVO(new RecipeVO(3));
			recipeContentVO.setStepNo(1);
			recipeContentVO.setStepTitle("계란 삶기");
			rm.postRecipeContent(recipeContentVO);
		}
		
		// recipe item Insert Test
		else if (testCase == 3) {
			RecipeItemVO recipeItemVO = new RecipeItemVO();
			recipeItemVO.setCategoryVO(new CategoryVO("계란류"));
			recipeItemVO.setItemName("계란");
			recipeItemVO.setQty("10");
			recipeItemVO.setRecipeVO(new RecipeVO(3));
			rm.postRecipeItem(recipeItemVO);
		}

	}
}
