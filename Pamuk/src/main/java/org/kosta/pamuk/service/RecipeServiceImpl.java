package org.kosta.pamuk.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.kosta.pamuk.model.mapper.RecipeMapper;
import org.kosta.pamuk.model.vo.RecipeContentVO;
import org.kosta.pamuk.model.vo.RecipeItemVO;
import org.kosta.pamuk.model.vo.RecipeVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
/**
 * 
 * 
 *
 */
@Service
public class RecipeServiceImpl implements RecipeService {
	@Resource
	private RecipeMapper recipeMapper;
	
	/**
	 * Recipe를 Post (recipe, content, item)을 transactional하게 처리
	 * content와 item은 List로 받아서 insert
	 * @author 최인재
	 * @param RecipeVO, ArrayList<RecipeContentVO>, ArrayList<RecipeItemVO>
	 */
	@Override
	@Transactional
	public void postRecipe(RecipeVO recipeVO, ArrayList<RecipeContentVO> recipeContentList, ArrayList<RecipeItemVO> recipeItemList){
		recipeMapper.postRecipe(recipeVO);
		for(RecipeContentVO rContentVO : recipeContentList) {
			recipeMapper.postRecipeContent(rContentVO);
		}
		for(RecipeItemVO rItemVO : recipeItemList) {
			recipeMapper.postRecipeItem(rItemVO);
		}
	}
}