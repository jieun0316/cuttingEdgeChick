package org.kosta.pamuk.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.kosta.pamuk.model.vo.RecipeContentVO;
import org.kosta.pamuk.model.vo.RecipeItemVO;
import org.kosta.pamuk.model.vo.RecipeVO;

public interface RecipeService {
	ArrayList<RecipeVO> getAllRecipeListByRowNumber(int startRowNumber,int endRowNumber);
	/**
	 * recipeNo로 recipeDetail를 map로 반환
	 * @author 최인재
	 * @param recipeNo
	 * @return RecipeVO (recipeDetailVO, recipeItemVOList, recipeContentVOList)
	 */
	RecipeVO viewRecipeDetail(int recipeNo);
	void postRecipe(RecipeVO recipeVO);
}