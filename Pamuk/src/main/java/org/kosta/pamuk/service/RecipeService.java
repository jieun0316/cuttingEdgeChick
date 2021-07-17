package org.kosta.pamuk.service;

import java.util.ArrayList;

import org.kosta.pamuk.model.vo.RecipeContentVO;
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
	/**
	 * recipe 삭제
	 * @author 조수빈
	 * @param recipeNo
	 */
	void deleteRecipeByRecipeNo(int recipeNo);
	/**
	 * recipe update (수정)
	 * @author 조수빈
	 * @param recipeContentVO
	 */
	void updateRecipeContentByRecipeNo(RecipeContentVO recipeContentVO);
	/**
	 * 리뷰 등록
	 * @author 김수권
	 * @param reviewVO
	 */
	void writeReview(ReviewVO reviewVO); 
	/**
	 * 리뷰 조회
	 * @author 김수권
	 * @param reviewVO
	 */
	ArrayList<ReviewVO> readReview(int recipeNo);
	/**
	 * 리뷰 업데이트(수정)
	 * @author 조수빈
	 * @param reviewVO
	 */
	void updateReview(ReviewVO reviewVO);
	/**
	 * 리뷰 삭제
	 * @author 김수권
	 * @param reviewVO
	 */
	void deleteReview(ReviewVO reviewVO);
}