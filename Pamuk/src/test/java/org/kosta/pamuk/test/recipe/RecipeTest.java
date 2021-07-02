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
public class RecipeTest {
	@Autowired
	RecipeMapper rm;

	@Autowired
	RecipeService rs;

	@Test
	public void postRecipe() {
		int testCase = 5;

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
			recipeContentVO.setContent("양념간장에 삶은 계란을 넣으세요");
			recipeContentVO.setImagePath("");
			recipeContentVO.setRecipeVO(new RecipeVO(3));
			recipeContentVO.setStepNo(3);
			recipeContentVO.setStepTitle("계란장 만들기");
			rm.postRecipeContent(recipeContentVO);
		}
		
		// recipe item Insert Test
		else if (testCase == 3) {
			RecipeItemVO recipeItemVO = new RecipeItemVO();
			recipeItemVO.setItemName("설탕");
			recipeItemVO.setQty("5큰술");
			recipeItemVO.setRecipeVO(new RecipeVO(3));
			rm.postRecipeItem(recipeItemVO);
		}
		
		//select Count Test
		else if(testCase==4) {
			System.out.println(rm.getTotalRecipeCount());
			System.out.println(rm.getContentCountByRecipeNo(3));
			System.out.println(rm.getItemCountByRecipeNo(3));
			System.out.println(rm.getRecipeCountByCategory("한식"));
		}
		
		//select Detail Test
		else if(testCase==5) {
			//System.out.println(rm.getRecipeDetailByRecipeNo(3));
			/*ArrayList<RecipeItemVO> rItemList = rm.getRecipeItemListByRecipeNo(3);
			for (RecipeItemVO rItem : rItemList) {
				System.out.println(rItem);
			}*/
			
			/*
			ArrayList<RecipeContentVO> rContentList = rm.getRecipeContentListByRecipeNoOrderByStepNo(3);
			for (RecipeContentVO rContent : rContentList) {
				System.out.println(rContent);
			}*/
			
			ArrayList<RecipeVO> rList = rm.getRecipeListByCategory(1, 2, "한식");
			//rm.getAllRecipeListByRowNumber(1, 2);
					
			for (RecipeVO r : rList) {
				System.out.println(r);
			}
		}
		
		

	}
}
