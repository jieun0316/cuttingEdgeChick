package org.kosta.pamuk.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.kosta.pamuk.model.vo.RecipeContentVO;
import org.kosta.pamuk.model.vo.RecipeItemVO;
import org.kosta.pamuk.model.vo.RecipeVO;

public interface RecipeService {
	void postRecipe(RecipeVO vo, ArrayList<RecipeContentVO> recipeContentList, ArrayList<RecipeItemVO> recipeItemList);
	ArrayList<RecipeVO> getAllRecipeListByRowNumber(int startRowNumber,int endRowNumber);
	/**
	 * recipeNo로 recipeDetail를 map로 반환
	 * @author 최인재
	 * @param recipeNo
	 * @return HashMap (recipeDetailVO, recipeItemVOList, recipeContentVOList)
	 */
	HashMap<String, Object> viewRecipeDetail(int recipeNo);
}