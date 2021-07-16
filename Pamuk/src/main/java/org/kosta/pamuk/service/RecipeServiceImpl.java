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

		List<RecipeContentVO> recipeContentList = recipeVO.getRecipeContentList();
		List<RecipeItemVO> recipeItemList = recipeVO.getRecipeItemList();

		for (RecipeContentVO recipeContentVO : recipeContentList) {
			recipeContentVO.setRecipeNo(recipeVO.getRecipeNo());
			recipeMapper.postRecipeContent(recipeContentVO);
		}
		for (RecipeItemVO recipeItemVO : recipeItemList) {
			recipeItemVO.setRecipeNo(recipeVO.getRecipeNo());
			recipeMapper.postRecipeItem(recipeItemVO);
		}
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

	/**
	 * Main page 로 Best recipeList 받아오기
	 * 
	 * @return
	 */
	@Override
	public ArrayList<RecipeVO> getBestRecipeListForMain() {
		// TODO Auto-generated method stub
		return recipeMapper.getBestRecipeListForMain();
	}

	/**
	 * Main page 로 Recent recipeList 받아오기
	 * 
	 * @return
	 */
	@Override
	public ArrayList<RecipeVO> getRecentRecipeListForMain() {
		// TODO Auto-generated method stub
		return recipeMapper.getRecentRecipeListForMain();
	}

	/**
	 * recipe delete
	 * 
	 * @return
	 */
	@Transactional
	@Override
	public void deleteRecipeByRecipeNo(int recipeNo) {
		recipeMapper.deleteRecipeByRecipeNo(recipeNo);
		// TODO Auto-generated method stub

	}

	/**
	 * 댓글 작성
	 */
	@Override
	public void writeReview(ReviewVO reviewVO) {
		String memberId = reviewVO.getMemberVO().getMemberId();
		int recipeNo = reviewVO.getRecipeVO().getRecipeNo();
		String reviewComment = reviewVO.getReviewComment();
		int rating = reviewVO.getRating();
		recipeMapper.writeReview(memberId, recipeNo, reviewComment, rating);
	}

	@Override
	public ArrayList<ReviewVO> readReview(int recipeNo) {
		ArrayList<ReviewVO> reviewList = recipeMapper.readReview(recipeNo);

		for (int i = 0; i < reviewList.size(); i++) {
			// reviewVO별 data mapping<result column="member_id"
			// property="memberVO.memberId"/>
			String memberId = reviewList.get(i).getMemberVO().getMemberId();
			// 닉네임 찾기
			reviewList.get(i).getMemberVO().setNick(memberMapper.findMemberById(memberId).getNick());
		}
		return reviewList;
	}

	@Override
	public void updateReview(ReviewVO reviewVO) {
		String memberId = reviewVO.getMemberVO().getMemberId();
		int recipeNo = reviewVO.getRecipeVO().getRecipeNo();
		String reviewComment = reviewVO.getReviewComment();
		recipeMapper.updateReview(memberId, recipeNo, reviewComment);
	}

	@Override
	public void deleteReview(ReviewVO reviewVO) {
		String memberId = reviewVO.getMemberVO().getMemberId();
		int recipeNo = reviewVO.getRecipeVO().getRecipeNo();
		recipeMapper.deleteReview(memberId, recipeNo);
	}

	@Override
	@Transactional
	public void updateRecipeContentByRecipeNo(RecipeContentVO recipeContentVO) {
		// TODO Auto-generated method stub
		recipeMapper.updateRecipeContentByRecipeNo(recipeContentVO);
	}
	@Override
	public void deleteReviewByAdmin(String memberId, int recipeNo) {
		recipeMapper.deleteReview(memberId, recipeNo);
	}
}