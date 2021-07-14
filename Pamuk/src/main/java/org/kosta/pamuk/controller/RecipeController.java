package org.kosta.pamuk.controller;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.kosta.pamuk.model.mapper.ItemMapper;
import org.kosta.pamuk.model.mapper.RecipeMapper;
import org.kosta.pamuk.model.vo.MemberVO;
import org.kosta.pamuk.model.vo.PagingBean;
import org.kosta.pamuk.model.vo.RecipeContentVO;
import org.kosta.pamuk.model.vo.RecipeVO;
import org.kosta.pamuk.model.vo.ReviewVO;
import org.kosta.pamuk.service.RecipeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

/**
 * Recipe 게시판에 관련된 비즈니스 로직을 정의합니다
 */
@Controller
@RequestMapping("recipe")
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
	public String recipeBoardWrite(
			RecipeVO recipeVO,
			@RequestParam("recipeThumbnailImg") MultipartFile recipeThumbnailImg,
			@RequestParam("recipeStepImgs") MultipartFile[] recipeStepImgs,
			HttpServletRequest request
			) throws IOException {
		 
		//1. 섬네일 등록
		//저장될 경로
		String filePath = request.getServletContext().getRealPath("upload/");
		//파일명
        String originalFile = recipeThumbnailImg.getOriginalFilename();
        //파일명 중 확장자만 추출                                                //lastIndexOf(".") - 뒤에 있는 . 의 index번호
		String originalFileExtension = originalFile.substring(originalFile.lastIndexOf("."));
		//저장될 파일명 - 파일명이 같은 사진이 있을 수 있으므로 파일명 변경
		String savedFileName = UUID.randomUUID() + originalFileExtension;
		
		File file = new File(filePath + savedFileName);
        //파일 저장
		recipeThumbnailImg.transferTo(file);
		
		recipeVO.setRecipeThumbnail(savedFileName);
		
		//2. step별 이미지 등록
		List<RecipeContentVO> recipeContentList = recipeVO.getRecipeContentList();
		for(int i=0; i<recipeContentList.size(); i++) {
			MultipartFile recipeStepImg = recipeStepImgs[i];
			//파일명
			originalFile = recipeStepImg.getOriginalFilename();
	        //파일명 중 확장자만 추출                                                //lastIndexOf(".") - 뒤에 있는 . 의 index번호
			originalFileExtension = originalFile.substring(originalFile.lastIndexOf("."));
			//저장될 파일명 - 파일명이 같은 사진이 있을 수 있으므로 파일명 변경
			savedFileName = UUID.randomUUID() + originalFileExtension;
			
			file = new File(filePath + savedFileName);
			
			recipeStepImg.transferTo(file);
			recipeVO.getRecipeContentList().get(i).setImagePath(savedFileName);
		}
		
		// 세션에서 세선 정보를 mvo에 넣는다
		recipeVO.setMemberVO( (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal());
		System.out.println(recipeVO);
		recipeService.postRecipe(recipeVO);
		
		return "redirect:recipeBoardList";
	}

	/**
	 * 레시피 게시판 상세보기(상세)
	 * 리뷰 리스트
	 * @return
	 */
	@RequestMapping("recipeBoardView")
	public String recipeBoardView(int recipeNo, Model model) {
		RecipeVO recipeVO = recipeService.viewRecipeDetail(recipeNo);
		ArrayList<ReviewVO> reviewList = recipeService.readReview(recipeNo);
		
		model.addAttribute("recipeVO", recipeVO);
		model.addAttribute("reviewList", reviewList);
		return "recipes/recipeBoardView.tiles";
	}

	/**
	 * 카테고리별 게시판 목록 받아오기
	 * 
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
	 * 
	 * @param category, model
	 * @return
	 */
	@RequestMapping("recipeCountByCategory")
	@ResponseBody
	public int recipeCountByCategory(String category, Model model) {
		int totalRecipeCount;
		if (category.equals("전체")) { // 전체보기
			totalRecipeCount = recipeMapper.getTotalRecipeCount();
		} else { // 카테고리별 보기이면
			totalRecipeCount = recipeMapper.getRecipeCountByCategory(category);
		}
		model.addAttribute("totalRecipeCount", totalRecipeCount);
		return totalRecipeCount;
	}

	/**
	 * 카테고리별 게시판 목록 받아오기 (Ajax 사용) ajax 적용하는 jsp로 return 되도록 작성
	 * 
	 * @param category, pageNo, model
	 * @return
	 */
	@RequestMapping("recipeListByCategoryAjax")
	// 이렇게 처리하면(jsp를 넘겨줌, responseBody가 아니면) 동기 형식의 ajax
	public String recipeListByCategoryAjax(String category, String pageNo, Model model) {
		int totalRecipeCount;
		if (category.equals("전체")) { // 전체보기
			totalRecipeCount = recipeMapper.getTotalRecipeCount();
		} else { // 카테고리별 보기이면
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
		if (category.equals("전체")) { // 전체보기
			recipeList = recipeService.getAllRecipeListByRowNumber(pagingBean.getStartRowNumber(),
					pagingBean.getEndRowNumber());
		} else { // 카테고리별 보기이면
			recipeList = recipeService.getRecipeListByCategory(pagingBean.getStartRowNumber(),
					pagingBean.getEndRowNumber(), category);
		}
		model.addAttribute("recipeList", recipeList);
		model.addAttribute("pagingBean", pagingBean);
		// System.out.println(recipeList);
		return "recipes/recipeListAjax";
	}
	
	 // 댓글 작성
	@Secured("ROLE_MEMBER")
	@PostMapping("writeReview")
	public String postReview(ReviewVO reviewVO) {
		reviewVO.setMemberVO( (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal());	
		//System.out.println(reviewVO);
		recipeService.writeReview(reviewVO);
		return  "redirect:/recipe/recipeBoardView?recipeNo="+reviewVO.getRecipeVO().getRecipeNo();
	}

	@RequestMapping("postReviewAjax")
	public String postReviewAjax() {
		return null;
	}
		
	/**
	 * 권한 check 후 레시피 게시글 삭제로 이동
	 * @param recipeNo
	 * @return
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping("deleteRecipeForm")
	public String deleteRecipeForm(int recipeNo) {
		// session 체크 해줘야함.
		// System.out.println("deleteRecipeForm");
		return "redirect:deleteRecipeByRecipeNo?recipeNo=" + recipeNo;
	}
	@Secured("ROLE_MEMBER")
	@RequestMapping("deleteRecipeByRecipeNo")
	public String deleteRecipeByRecipeNo(int recipeNo, Model model) {
		// System.out.println("deleteRecipeByRecipeNo");
		recipeMapper.deleteRecipeByRecipeNo(recipeNo);
		return "redirect:recipeBoardList";
	}
	/**
	 * 검색 결과 보여주는 page !
	 * 검색조건 (레시피, 식재료, 작성자)
	 * @param keyword
	 * @return
	 */
	@RequestMapping("recipeSearchResultPage")
	public String recipeSearchRsultPage(String keyword, Model model) {
		model.addAttribute("keyword", keyword);
		// 레시피
		ArrayList<RecipeVO> ResultByRecipes =  recipeMapper.getRecipeListByRecipes(keyword);
		int ResultByRecipesCount = recipeMapper.getRecipeListByRecipesCount(keyword);
		model.addAttribute("ResultByRecipesCount", ResultByRecipesCount);
		model.addAttribute("ResultByRecipes", ResultByRecipes);
		
		// 식재료
		ArrayList<RecipeVO> ResultByItems =  recipeMapper.getRecipeListByItems(keyword);
		int ResultByItemsCount = recipeMapper.getRecipeListByItemsCount(keyword);
		model.addAttribute("ResultByItemsCount", ResultByItemsCount);
		model.addAttribute("ResultByItems", ResultByItems);
		
		// 작성자
		ArrayList<RecipeVO> ResultByWriter =  recipeMapper.getRecipeListByWriter(keyword);
		int ResultByWriterCount = recipeMapper.getRecipeListByWriterCount(keyword);
		model.addAttribute("ResultByWriterCount", ResultByWriterCount);
		model.addAttribute("ResultByWriter", ResultByWriter);
		
		
		return "recipes/recipeSearchResultPage.tiles"; 
	}
}
