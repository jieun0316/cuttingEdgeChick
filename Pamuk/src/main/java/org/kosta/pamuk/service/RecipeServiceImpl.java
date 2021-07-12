package org.kosta.pamuk.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.pamuk.model.mapper.MemberMapper;
import org.kosta.pamuk.model.mapper.RecipeMapper;
import org.kosta.pamuk.model.vo.RecipeContentVO;
import org.kosta.pamuk.model.vo.RecipeItemVO;
import org.kosta.pamuk.model.vo.RecipeVO;
import org.kosta.pamuk.model.vo.ReviewVO;
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
	@Resource
	private MemberMapper memberMapper;
	/**
	 * Recipe List 불러오기
	 * 
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
	 * 
	 * @author 최인재
	 * @param recipeNo
	 * @return RecipeVO
	 */
	@Override
	public RecipeVO viewRecipeDetail(int recipeNo) {

		RecipeVO recipeVO = recipeMapper.getRecipeDetailByRecipeNo(recipeNo);
		ArrayList<RecipeItemVO> recipeItemList = recipeMapper.getRecipeItemListByRecipeNo(recipeNo);
		ArrayList<RecipeContentVO> recipeContentList = recipeMapper
				.getRecipeContentListByRecipeNoOrderByStepNo(recipeNo);
		recipeVO.setRecipeItemList(recipeItemList);
		recipeVO.setRecipeContentList(recipeContentList);

		return recipeVO;
	}

	/**
	 * Recipe를 Post (recipe, content, item)을 transactional하게 처리 content와 item은 List로
	 * 받아서 insert
	 * 
	 * @author 최인재
	 * @param RecipeVO, ArrayList<RecipeContentVO>, ArrayList<RecipeItemVO>
	 */
	@Transactional
	@Override
	public void postRecipe(RecipeVO recipeVO) {
		recipeMapper.postRecipe(recipeVO);
		System.out.println(recipeVO);

		List<RecipeContentVO> recipeContentList = recipeVO.getRecipeContentList();

		for (RecipeContentVO recipeContentVO : recipeContentList) {
			recipeContentVO.setRecipeNo(recipeVO.getRecipeNo());
			System.out.println(recipeContentVO);
			recipeMapper.postRecipeContent(recipeContentVO);
		}

		/*
		 * List<RecipeItemVO> recipeItemList = recipeVO.getRecipeItemList();
		 * for(RecipeItemVO recipeItemVO : recipeItemList) {
		 * recipeMapper.postRecipeItem(recipeItemVO); }
		 */
	}

	/**
	 * category로 recipeList 받아오기
	 * 
	 * @param startRowNumber
	 * @param endRowNumber
	 * @param category
	 * @return
	 */
	@Override
	public ArrayList<RecipeVO> getRecipeListByCategory(int startRowNumber, int endRowNumber, String category) {
		// TODO Auto-generated method stub
		return recipeMapper.getRecipeListByCategory(startRowNumber, endRowNumber, category);
	}

	@Override
	public void writeReview(ReviewVO reviewVO) {
		String memberId = reviewVO.getMemberVO().getMemberId();
		int recipeNo = reviewVO.getRecipeVO().getRecipeNo();
		String reviewComment = reviewVO.getReviewComment();
		int grade = reviewVO.getRating();
		recipeMapper.writeReview(memberId, recipeNo, reviewComment, grade);
	}

	@Override
	public ArrayList<ReviewVO> readReview(int recipeNo) {
		ArrayList<ReviewVO> reviewList = recipeMapper.readReview(recipeNo);
		
		for(int i=0;i<reviewList.size();i++) {
			// reviewVO별 data mapping<result column="member_id" property="memberVO.memberId"/>
			String memberId=reviewList.get(i).getMemberVO().getMemberId();
			//닉네임 찾기
			reviewList.get(i).getMemberVO().setNick(memberMapper.findMemberById(memberId).getNick());
		}
		return reviewList;
	}
}