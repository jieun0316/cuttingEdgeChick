package org.kosta.pamuk.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.kosta.pamuk.model.vo.RecipeContentVO;
import org.kosta.pamuk.model.vo.RecipeItemVO;
import org.kosta.pamuk.model.vo.RecipeVO;

public interface RecipeService {
	/**
	 * Recipe를 Post (recipe, content, item)을 transactional하게 처리
	 * content와 item은 List로 받아서 insert
	 * @author 최인재
	 * @param RecipeVO, ArrayList<RecipeContentVO>, ArrayList<RecipeItemVO>
	 */
	void postRecipe(RecipeVO recipeVO);
	/**
	 * Recipe List 불러오기
	 * @author 조수빈
	 * @param int startRowNumber, int endRowNumber
	 */
	ArrayList<RecipeVO> getAllRecipeListByRowNumber(int startRowNumber,int endRowNumber);
	/**
	 * recipeNo로 recipeDetail를 map로 반환
	 * @author 최인재
	 * @param recipeNo
	 * @return RecipeVO (recipeDetailVO, recipeItemVOList, recipeContentVOList)
	 */
	RecipeVO viewRecipeDetail(int recipeNo);
	/**
	 * category로 recipeList 받아오기
	 * @param startRowNumber
	 * @param endRowNumber
	 * @param category
	 * @author 조수빈
	 * @return
	 */
	ArrayList<RecipeVO> getRecipeListByCategory(int startRowNumber,int endRowNumber, String category);
	/**
	 * main page 의 Best Recipe List 불러오기
	 * @author 조수빈
	 * @return
	 */
	ArrayList<RecipeVO> getBestRecipeListForMain();
	/**
	 * main page 의 Recent Recipe List 불러오기
	 * @author 조수빈
	 * @return
	 */
	ArrayList<RecipeVO> getRecentRecipeListForMain();
	
}