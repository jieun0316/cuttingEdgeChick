package org.kosta.pamuk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Recipe 게시판에 관련된 비즈니스 로직을 정의합니다
 * 
 *
 */
@Controller
public class RecipeController {
	/**
	 * 레시피 게시판 목록 보기
	 * @return
	 */
	@RequestMapping("recipeBoardList")
	public String recipeBoardList() {
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
	public String recipeBoardView() {
		return "recipes/recipeBoardView.tiles";
	}
}
