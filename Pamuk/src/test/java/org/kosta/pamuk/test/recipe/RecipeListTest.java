package org.kosta.pamuk.test.recipe;

import java.util.ArrayList;

import org.junit.jupiter.api.Test;
import org.kosta.pamuk.model.mapper.RecipeMapper;
import org.kosta.pamuk.model.vo.RecipeVO;
import org.kosta.pamuk.model.vo.SavedRecipeVO;
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
	public void getBestRecipeListForMain() {
		int testCase = 5;

		// Main page Best recipe list
		if (testCase == 1) {
			System.out.println(rs.getBestRecipeListForMain());
		}

		// Main page Recent recipe list
		else if (testCase == 2) {
			System.out.println(rs.getRecentRecipeListForMain());
		}
		// Main page Recent recipe list
		else if (testCase == 3) {
			rs.deleteRecipeByRecipeNo(23);
		}
		// 검색
		else if (testCase == 4) {
			// 작성자
			//System.out.println(rm.getRecipeListByWriterCount("kove"));
			//System.out.println( rm.getRecipeListByWriter("kove") );
			
			// 아이템 검색
			//System.out.println(rm.getRecipeListByItems("설탕"));
			//System.out.println(rm.getRecipeListByItemsCount("설탕"));
			
			// 레시피 검색
			System.out.println(rm.getRecipeListByRecipes("검색"));
		} else if(testCase==5) {
			ArrayList<SavedRecipeVO> list = rm.getSavedRecipeListById("java");
			for(SavedRecipeVO srvo : list)
				System.out.println(srvo);
		}

	}
}
