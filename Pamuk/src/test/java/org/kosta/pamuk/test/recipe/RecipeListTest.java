package org.kosta.pamuk.test.recipe;

import org.junit.jupiter.api.Test;
import org.kosta.pamuk.model.mapper.RecipeMapper;
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
		int testCase = 3;

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

	}
}
