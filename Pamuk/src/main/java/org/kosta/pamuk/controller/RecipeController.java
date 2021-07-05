package org.kosta.pamuk.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.kosta.pamuk.model.mapper.RecipeMapper;
import org.kosta.pamuk.model.vo.PagingBean;
import org.kosta.pamuk.model.vo.RecipeVO;
import org.kosta.pamuk.service.RecipeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Recipe 게시판에 관련된 비즈니스 로직을 정의합니다
 * 
 *
 */
@Controller
public class RecipeController {
	@Autowired
	RecipeService recipeService;
	@Autowired
	RecipeMapper recipeMapper;
	/**
	 * 레시피 게시판 목록 보기
	 * @return
	 */
	@RequestMapping("recipeBoardList")
	public String recipeBoardList(Model model,String pageNo) {
		//totalRecipeCount
		int totalRecipeCount = recipeMapper.getTotalRecipeCount();
		model.addAttribute("totalRecipeCount", totalRecipeCount);
		
		// paging
		PagingBean pagingBean = null;
		if(pageNo==null) {
			pagingBean=new PagingBean(totalRecipeCount);
		} else {
			pagingBean=new PagingBean(totalRecipeCount,Integer.parseInt(pageNo));
		}		
		
		//view All Recipe List
		ArrayList<RecipeVO> recipeList = recipeMapper.getAllRecipeListByRowNumber( pagingBean.getStartRowNumber(),pagingBean.getEndRowNumber());
		model.addAttribute("recipeList",recipeList);
		model.addAttribute("pagingBean", pagingBean);
		return "recipes/recipeBoardList.tiles";
	}
	
	/**
	 * 레시피 게시판 등록폼(상세)
	 * @return
	 */
	@RequestMapping("recipeBoardWrite")
	public String recipeBoardWrite() {
		return "recipes/recipeBoardWrite.tiles";
	}

	/**
	 * 레시피 게시판 상세보기(상세)
	 * @return
	 */
	@RequestMapping("recipeBoardView")
	public String recipeBoardView(int recipeNo, Model model) {
		HashMap<String,Object>recipeDetailMap = recipeService.viewRecipeDetail(recipeNo);
		model.addAttribute("paramMap", recipeDetailMap);
		
		return "recipes/recipeBoardView.tiles";
	}
}
