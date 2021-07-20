package org.kosta.pamuk.model.mapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.pamuk.model.vo.RecipeContentVO;
import org.kosta.pamuk.model.vo.RecipeItemVO;
import org.kosta.pamuk.model.vo.RecipeVO;
import org.kosta.pamuk.model.vo.ReportVO;
import org.kosta.pamuk.model.vo.ReviewVO;
import org.kosta.pamuk.model.vo.SavedRecipeVO;

@Mapper
public interface RecipeMapper {
	// post 관련
	void postRecipe(RecipeVO recipeVO);

	void postRecipeContent(RecipeContentVO recipeContentVO);

	void postRecipeItem(RecipeItemVO recipeItemVO);

	// count 조회 관련
	int getTotalRecipeCount();

	int getRecipeCountByCategory(String category);

	int getContentCountByRecipeNo(int recipeNo);

	int getItemCountByRecipeNo(int recipeNo);

	int getRecipeListByWriterCount(String keyword);

	int getRecipeListByItemsCount(String keyword);

	int getRecipeListByRecipesCount(String keyword);

	// detail 조회 관련
	ArrayList<RecipeVO> getAllRecipeListByRowNumber(int startRowNumber, int endRowNumber);

	ArrayList<RecipeVO> getRecipeListByCategory(int startRowNumber, int endRowNumber, String category);

	RecipeVO getRecipeDetailByRecipeNo(int recipeNo);

	ArrayList<RecipeItemVO> getRecipeItemListByRecipeNo(int recipeNo);

	ArrayList<RecipeContentVO> getRecipeContentListByRecipeNoOrderByStepNo(int recipeNo);

	RecipeContentVO getRecipeStepContentListByRecipeNo(int recipeNo, int stepNo);

	// recipe 삭제 관련
	void deleteRecipeByRecipeNo(int recipeNo);

	void deleteRecipeItemByRecipeNoAndRecipeItem(String recipeItem, int recipeNo);

	void deleteRecipeItemByRecipeNo(int recipeNo);

	void deleteLastRecipeContentByRecipeNo(int recipeNo);

	// main page 에서 recipe 조회 관련
	ArrayList<RecipeVO> getBestRecipeListForMain();

	ArrayList<RecipeVO> getRecentRecipeListForMain();

	// recipe 검색 관련
	ArrayList<RecipeVO> getRecipeListByWriter(String keyword);

	ArrayList<RecipeVO> getRecipeListByItems(String keyword);

	ArrayList<RecipeVO> getRecipeListByRecipes(String keyword);

	// recipe update(수정) 관련
	void updateRecipeContentByRecipeNo(RecipeContentVO recipeContentVO);

	// review 관련
	void writeReview(String memberId, int recipeNo, String reviewComment, int rating);

	ArrayList<ReviewVO> readReview(int recipeNo);

	void updateReview(String memberId, int recipeNo, String reviewComment);

	void deleteReview(String memberId, int recipeNo);
	ReviewVO readEachReview(String memberId, int recipeNo);
	int countReview(int recipeNo);

	// recipe save 저장
	void saveRecipe(SavedRecipeVO savedRecipeVO);

	void deleteSavedRecipe(SavedRecipeVO savedRecipeVO);

	int isSavedRecipe(String memberId, int recipeNo);

	ArrayList<SavedRecipeVO> getSavedRecipeListById(String id);

	// 신고 글 관련
	/**
	 * 기존 신고글을 조회합니다.
	 * 
	 * @param recipe_no
	 * @param report_content
	 * @return
	 */
	ArrayList<ReportVO> reportedRecipeList();

	/**
	 * 신고글을 등록합니다.
	 * 
	 * @param recipe_no
	 * @param report_content
	 */
	void reportRecipe(int recipeNo, String reportContent);
	//냉장고 재료와 겹치는 식재료 사용하는 레시피 찾기 - 레시피 번호와 필요한 총 식재료 갯수, 그 중 회원이 가지고 있는 갯수, 일치율 반환 
		List<Map<String, Object>> getMatchingRecipeNoAndCount(String id);
		//컨트롤러에서 for문을 사용하는 대신 레시피번호 리스트 배열 파라미터로 넘겨 myBatis에서 처리
		List <RecipeVO> getMatchingRecipeListByRecipeNo(List<Integer> matchingRecipeNoList);
}
