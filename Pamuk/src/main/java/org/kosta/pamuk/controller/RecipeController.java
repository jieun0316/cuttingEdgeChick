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
import org.springframework.web.bind.annotation.ResponseBody;

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
	 * 
	 * @return
	 */
	@RequestMapping("recipeBoardList")
	public String recipeBoardList(Model model, String pageNo) {
		// totalRecipeCount
		int totalRecipeCount = recipeMapper.getTotalRecipeCount();
		model.addAttribute("totalRecipeCount", totalRecipeCount);

		// paging
		PagingBean pagingBean = null;
		if (pageNo == null) {
			pagingBean = new PagingBean(totalRecipeCount);
		} else {
			pagingBean = new PagingBean(totalRecipeCount, Integer.parseInt(pageNo));
		}

		// view All Recipe List
		ArrayList<RecipeVO> recipeList = recipeService.getAllRecipeListByRowNumber(pagingBean.getStartRowNumber(),
				pagingBean.getEndRowNumber());
		model.addAttribute("recipeList", recipeList);
		model.addAttribute("pagingBean", pagingBean);
		return "recipes/recipeBoardList.tiles";
	}

	/**
	 * 레시피 게시판 등록폼(상세)
	 * 
	 * @return
	 */
	@RequestMapping("recipeBoardWrite")
	public String recipeBoardWrite() {
		return "recipes/recipeBoardWrite.tiles";
	}

	/**
	 * 레시피 게시판 상세보기(상세)
	 * 
	 * @return
	 */
	@RequestMapping("recipeBoardView")
	public String recipeBoardView(int recipeNo, Model model) {
		HashMap<String, Object> recipeDetailMap = recipeService.viewRecipeDetail(recipeNo);
		model.addAttribute("paramMap", recipeDetailMap);

		return "recipes/recipeBoardView.tiles";
	}
	/**
	 * 카테고리별 게시판 목록 받아오기
	 * @param category, pageNo, model
	 * @return
	 */
	@RequestMapping("recipeListByCategory")
	public String recipeListByCategory(String category, String pageNo, Model model) {
		// totalRecipeCount
		int totalRecipeCount = recipeMapper.getRecipeCountByCategory(category);
		model.addAttribute("totalRecipeCount", totalRecipeCount);

		// paging
		PagingBean pagingBean = null;
		if (pageNo == null) {
			pagingBean = new PagingBean(totalRecipeCount);
		} else {
			pagingBean = new PagingBean(totalRecipeCount, Integer.parseInt(pageNo));
		}

		// view All Recipe List
		ArrayList<RecipeVO> recipeList = recipeService.getRecipeListByCategory(pagingBean.getStartRowNumber(),
				pagingBean.getEndRowNumber(), category);
		model.addAttribute("recipeList", recipeList);
		model.addAttribute("pagingBean", pagingBean);
		return "recipes/recipeBoardList.tiles";
	}
	
	/**
	 * 카테고리별 카테고리별 레시피 글 갯수 받아오기
	 * @param category, model
	 * @return
	 */
	@RequestMapping("recipeCountByCategory")
	@ResponseBody
	public int recipeCountByCategory(String category, Model model) {
		int totalRecipeCount;
		if(category.equals("전체")) { // 전체보기
			totalRecipeCount = recipeMapper.getTotalRecipeCount();
		}else { // 카테고리별 보기이면
			totalRecipeCount = recipeMapper.getRecipeCountByCategory(category);
		}
		model.addAttribute("totalRecipeCount", totalRecipeCount);
		return totalRecipeCount;
	}
	
	/**
	 * 카테고리별 게시판 목록 받아오기 (Ajax 사용)
	 * ajax 적용하는 jsp로 return 되도록 작성
	 * @param category, pageNo, model
	 * @return
	 */
	@RequestMapping("recipeListByCategoryAjax")
	public String recipeListByCategoryAjax(String category, String pageNo, Model model) {
		int totalRecipeCount;
		if(category.equals("전체")) { // 전체보기
			totalRecipeCount = recipeMapper.getTotalRecipeCount();
		}else { // 카테고리별 보기이면
			totalRecipeCount = recipeMapper.getRecipeCountByCategory(category);
		}
		model.addAttribute("totalRecipeCount", totalRecipeCount);

		// paging
		PagingBean pagingBean = null;
		if (pageNo == null) {
			pagingBean = new PagingBean(totalRecipeCount);
		} else {
			pagingBean = new PagingBean(totalRecipeCount, Integer.parseInt(pageNo));
		}

		// 레시피 목록 보기
		ArrayList<RecipeVO> recipeList = null;
		if(category.equals("전체")) { // 전체보기
			recipeList = recipeService.getAllRecipeListByRowNumber(pagingBean.getStartRowNumber(),
					pagingBean.getEndRowNumber());
		}else { // 카테고리별 보기이면
			recipeList = recipeService.getRecipeListByCategory(pagingBean.getStartRowNumber(),
					pagingBean.getEndRowNumber(), category);
		}
		model.addAttribute("recipeList", recipeList);
		model.addAttribute("pagingBean", pagingBean);
		// System.out.println(recipeList);
		return "recipes/recipeListAjax";
	}
}
