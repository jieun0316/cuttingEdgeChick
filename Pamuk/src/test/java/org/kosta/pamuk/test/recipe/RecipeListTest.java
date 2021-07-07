package org.kosta.pamuk.test.recipe;

import java.util.ArrayList;

import org.junit.jupiter.api.Test;
import org.kosta.pamuk.model.mapper.RecipeMapper;
import org.kosta.pamuk.model.vo.CategoryVO;
import org.kosta.pamuk.model.vo.MemberVO;
import org.kosta.pamuk.model.vo.RecipeContentVO;
import org.kosta.pamuk.model.vo.RecipeItemVO;
import org.kosta.pamuk.model.vo.RecipeVO;
import org.kosta.pamuk.service.RecipeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class RecipeListTest {
	@Autowired
	RecipeMapper rm;

	@Autowired
	RecipeService rs;

	@Test
	public void postRecipe() {
		int testCase = 1;

		// recipe Insert test
		if (testCase == 1) {
			RecipeVO recipeVO = new RecipeVO();
			MemberVO memberVO = new MemberVO();
			memberVO.setMemberId("java");
			recipeVO.setMemberVO(memberVO);
			recipeVO.setCategory("일식");
			recipeVO.setRecipeName("후토마끼");
			rm.postRecipe(recipeVO);
			System.out.println(recipeVO);
		}

		// recipe content Insert Test
		else if (testCase == 2) {
			
		}


	}
}
