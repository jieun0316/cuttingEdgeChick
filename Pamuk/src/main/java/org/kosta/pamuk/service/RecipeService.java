package org.kosta.pamuk.service;

import java.util.ArrayList;

import org.kosta.pamuk.model.vo.RecipeVO;
import org.kosta.pamuk.model.vo.ReviewVO;

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
	 * @return
	 */
	ArrayList<RecipeVO> getRecipeListByCategory(int startRowNumber,int endRowNumber, String category);
	
	void writeReview(ReviewVO reviewVO);
	ArrayList<ReviewVO> readReview(int recipeNo);
}