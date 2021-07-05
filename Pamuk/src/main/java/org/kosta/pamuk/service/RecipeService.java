package org.kosta.pamuk.service;

import java.util.ArrayList;

import org.kosta.pamuk.model.vo.RecipeContentVO;
import org.kosta.pamuk.model.vo.RecipeItemVO;
import org.kosta.pamuk.model.vo.RecipeVO;
import org.springframework.transaction.annotation.Transactional;

public interface RecipeService {
	void postRecipe(RecipeVO vo, ArrayList<RecipeContentVO> recipeContentList, ArrayList<RecipeItemVO> recipeItemList);

}