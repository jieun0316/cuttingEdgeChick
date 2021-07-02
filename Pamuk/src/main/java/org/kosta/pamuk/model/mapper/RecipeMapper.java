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
	
	//detail 조회 관련
	ArrayList<RecipeVO> getAllRecipeListByRowNumber(int startRowNumber,int endRowNumber);
	ArrayList<RecipeVO> getRecipeListByCategory(int startRowNumber,int endRowNumber, String category);
	RecipeVO getRecipeDetailByRecipeNo(int recipeNo);
	ArrayList<RecipeItemVO> getRecipeItemListByRecipeNo(int recipeNo);
	ArrayList<RecipeContentVO> getRecipeContentListByRecipeNoOrderByStepNo(int recipeNo);

	//recipe 검색 조회 관련
}
