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
	@RequestMapping(value={"/","home"})
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
}
