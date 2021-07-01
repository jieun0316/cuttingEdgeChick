package org.kosta.pamuk.service;

import javax.annotation.Resource;

import org.kosta.pamuk.model.mapper.RecipeMapper;
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
	
	@Override
	@Transactional
	public void postRecipe(RecipeVO vo){
		recipeMapper.postRecipe(vo);
	}
}