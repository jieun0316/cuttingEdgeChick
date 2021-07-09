package org.kosta.pamuk.controller;

import java.util.ArrayList;
import org.kosta.pamuk.model.mapper.ItemMapper;
import org.kosta.pamuk.model.mapper.RecipeMapper;
import org.kosta.pamuk.model.vo.MemberVO;
import org.kosta.pamuk.model.vo.PagingBean;
import org.kosta.pamuk.model.vo.RecipeVO;
import org.kosta.pamuk.service.RecipeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
/**
 * Recipe 게시판에 관련된 비즈니스 로직을 정의합니다
 */
@Controller
public class RecipeController {
	@Autowired
	RecipeService recipeService;
	@Autowired
	RecipeMapper recipeMapper;
	@Autowired
	ItemMapper itemMapper;

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
	@Secured("ROLE_MEMBER")
	@RequestMapping("recipeBoardWriteForm")
	public String recipeBoardWriteForm(Model model) {
		model.addAttribute("categoryList", itemMapper.getCategoryList());
		return "recipes/recipeBoardWriteForm.tiles";
	}
	

	@Secured("ROLE_MEMBER")
	@RequestMapping("recipeBoardWrite")
	public String recipeBoardWrite(RecipeVO recipeVO) {
		// 세션에서 세선 정보를 mvo에 넣는다
		recipeVO.setMemberVO( (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal());
		recipeService.postRecipe(recipeVO);
		return "redirect:recipeBoardList";
	}


	/**
	 * 레시피 게시판 상세보기(상세)
	 * 
	 * @return
	 */
	@RequestMapping("/recipeBoardView")
	public String recipeBoardView(int recipeNo, Model model) {
		RecipeVO recipeVO = recipeService.viewRecipeDetail(recipeNo);
		model.addAttribute("recipeVO", recipeVO);

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
	// 요청은 ajax 지만 
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
	@Secured("ROLE_MEMBER")
	@RequestMapping("deleteRecipeForm")
	public String deleteRecipeForm(int recipeNo) {
		// session 체크 해줘야함.
		return "redirect:deleteRecipeByRecipeNo?" + recipeNo;
	}
	
	@PostMapping("deleteRecipeByRecipeNo")
	public void deleteRecipeByRecipeNo(int recipeNo, Model model) {
		recipeMapper.deleteRecipeByRecipeNo(recipeNo);
	}
	
	
	
	
	
	@RequestMapping("recipeSearchRsultPage")
	public String recipeSearchRsultPage() {
		return "recipes/recipeSearchRsultPage.tiles"; 
	}
}
