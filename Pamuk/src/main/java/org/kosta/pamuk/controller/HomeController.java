package org.kosta.pamuk.controller;

import java.util.ArrayList;

import org.kosta.pamuk.model.mapper.ItemMapper;
import org.kosta.pamuk.model.mapper.RecipeMapper;
import org.kosta.pamuk.model.vo.RecipeVO;
import org.kosta.pamuk.service.RecipeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	// 메인페이지
	@Autowired
	RecipeService recipeService;
	@Autowired
	RecipeMapper recipeMapper;
	@Autowired
	ItemMapper itemMapper;

	@RequestMapping(value = { "/", "home" })
	public String home(Model model) {
		// Best Recipes
		ArrayList<RecipeVO> BestRecipeList = recipeService.getBestRecipeListForMain();
		model.addAttribute("BestRecipeList", BestRecipeList);

		// Recent Recipes
		ArrayList<RecipeVO> RecentRecipeList = recipeService.getRecentRecipeListForMain();
		//System.out.println(RecentRecipeList);
		model.addAttribute("RecentRecipeList", RecentRecipeList);
		return "home.tiles";
	}

	/*
	 * 로그인 하였으나 권한이 없는 요청을 하였을 경우 보여지는 페이지를 지정 <security:access-denied-handler
	 * error-page="/accessDeniedView"/>
	 */
	@RequestMapping("accessDeniedView")
	public String accessDeniedView() {
		System.out.println("denied");
		return "auth/accessDeniedView.tiles";
	}
}
