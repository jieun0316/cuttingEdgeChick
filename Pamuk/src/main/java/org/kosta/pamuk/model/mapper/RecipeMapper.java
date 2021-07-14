package org.kosta.pamuk.model.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.pamuk.model.vo.RecipeContentVO;
import org.kosta.pamuk.model.vo.RecipeItemVO;
import org.kosta.pamuk.model.vo.RecipeVO;

@Mapper
public interface RecipeMapper {
	//post 관련
	void postRecipe(RecipeVO recipeVO);
	void postRecipeContent(RecipeContentVO recipeContentVO);
	void postRecipeItem(RecipeItemVO recipeItemVO);
	
	//count 조회 관련
	int getTotalRecipeCount();
	int getRecipeCountByCategory(String category);
	int getContentCountByRecipeNo(int recipeNo);
	int getItemCountByRecipeNo(int recipeNo);
	int getRecipeListByWriterCount(String keyword);
	int getRecipeListByItemsCount(String keyword);
	int getRecipeListByRecipesCount(String keyword);
	
	//detail 조회 관련
	ArrayList<RecipeVO> getAllRecipeListByRowNumber(int startRowNumber,int endRowNumber);
	ArrayList<RecipeVO> getRecipeListByCategory(int startRowNumber,int endRowNumber, String category);
	RecipeVO getRecipeDetailByRecipeNo(int recipeNo);
	ArrayList<RecipeItemVO> getRecipeItemListByRecipeNo(int recipeNo);
	ArrayList<RecipeContentVO> getRecipeContentListByRecipeNoOrderByStepNo(int recipeNo);

	//recipe 삭제 관련
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
}
