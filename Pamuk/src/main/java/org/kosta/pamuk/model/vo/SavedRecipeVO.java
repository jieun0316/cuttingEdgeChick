package org.kosta.pamuk.model.vo;

import java.util.List;

public class SavedRecipeVO extends RecipeVO {
	private MemberVO savedMemberVO;
	private String savedDate;
	
	public SavedRecipeVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SavedRecipeVO(MemberVO savedMemberVO, String savedDate) {
		super();
		this.savedMemberVO = savedMemberVO;
		this.savedDate = savedDate;
	}
	
	public SavedRecipeVO(int recipeNo, MemberVO savedMemberVO, String savedDate) {
		super(recipeNo);
		this.savedMemberVO = savedMemberVO;
		this.savedDate = savedDate;
	}
	
	public SavedRecipeVO(int recipeNo, MemberVO memberVO, String recipeName, String writeDate, String modifyDate,
			String category, int hits, List<RecipeContentVO> recipeContentList, List<RecipeItemVO> recipeItemList,
			String recipeThumbnail, MemberVO savedMemberVO, String savedDate) {
		super(recipeNo, memberVO, recipeName, writeDate, modifyDate, category, hits, recipeContentList, recipeItemList, recipeThumbnail);
		this.savedMemberVO = savedMemberVO;
		this.savedDate = savedDate;
	}

	public MemberVO getSavedMemberVO() {
		return savedMemberVO;
	}

	public void setSavedMemberVO(MemberVO savedMemberVO) {
		this.savedMemberVO = savedMemberVO;
	}

	public String getSavedDate() {
		return savedDate;
	}

	public void setSavedDate(String savedDate) {
		this.savedDate = savedDate;
	}

	@Override
	public String toString() {
		return "SavedRecipeVO ["+ super.toString() +", savedMemberVO=" + savedMemberVO + ", savedDate=" + savedDate + "]";
	}
	
	

	
	
	
}
