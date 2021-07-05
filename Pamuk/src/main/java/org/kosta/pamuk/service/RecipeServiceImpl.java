package org.kosta.pamuk.service;

import java.util.ArrayList;
import java.util.HashMap;

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
	/**
	 * Recipe List 불러오기
	 * @author 조수빈
	 * @param int startRowNumber, int endRowNumber
	 */
	@Override
	public ArrayList<RecipeVO> getAllRecipeListByRowNumber(int startRowNumber, int endRowNumber) {
		// TODO Auto-generated method stub
		return recipeMapper.getAllRecipeListByRowNumber(startRowNumber, endRowNumber);
	}
	
	/**
	 * recipeNo로 recipeDetail를 map로 반환
	 * @author 최인재
	 * @param recipeNo
	 * @return HashMap (recipeDetailVO, recipeItemVOList, recipeContentVOList)
	 */
	@Override
	public HashMap<String, Object> viewRecipeDetail(int recipeNo) {
		HashMap<String, Object> recipeDetailMap = new HashMap<String,Object>();
		
		RecipeVO recipeVO = recipeMapper.getRecipeDetailByRecipeNo(recipeNo);
		ArrayList<RecipeItemVO> recipeItemVOList = recipeMapper.getRecipeItemListByRecipeNo(recipeNo);
		ArrayList<RecipeContentVO> recipeContentVOList = recipeMapper.getRecipeContentListByRecipeNoOrderByStepNo(recipeNo);
		
		recipeDetailMap.put("recipeVO", recipeVO);
		recipeDetailMap.put("recipeItemVOList", recipeItemVOList);
		recipeDetailMap.put("recipeContentVOList",recipeContentVOList);
		
		return recipeDetailMap;
	}
}