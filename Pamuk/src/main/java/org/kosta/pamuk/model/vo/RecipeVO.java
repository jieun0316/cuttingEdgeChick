package org.kosta.pamuk.model.vo;

import java.util.List;

public class RecipeVO {
	private int recipeNo;
	private MemberVO memberVO;
	private String recipeName;
	private String writeDate;
	private String modifyDate;
	private String category;
	private int hits;
	private List<RecipeContentVO> recipeContentList;
	private List<RecipeItemVO> recipeItemList;
	private String recipeThumbnail;

	
	public RecipeVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public RecipeVO(int recipeNo) {
		super();
		this.recipeNo = recipeNo;
	}


	public RecipeVO(int recipeNo, MemberVO memberVO, String recipeName, String writeDate, String modifyDate,
			String category, int hits, List<RecipeContentVO> recipeContentList, List<RecipeItemVO> recipeItemList,
			String recipeThumbnail) {
		super();
		this.recipeNo = recipeNo;
		this.memberVO = memberVO;
		this.recipeName = recipeName;
		this.writeDate = writeDate;
		this.modifyDate = modifyDate;
		this.category = category;
		this.hits = hits;
		this.recipeContentList = recipeContentList;
		this.recipeItemList = recipeItemList;
		this.recipeThumbnail = recipeThumbnail;
	}


	public int getRecipeNo() {
		return recipeNo;
	}


	public void setRecipeNo(int recipeNo) {
		this.recipeNo = recipeNo;
	}


	public MemberVO getMemberVO() {
		return memberVO;
	}


	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}


	public String getRecipeName() {
		return recipeName;
	}


	public void setRecipeName(String recipeName) {
		this.recipeName = recipeName;
	}


	public String getWriteDate() {
		return writeDate;
	}


	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}


	public String getModifyDate() {
		return modifyDate;
	}


	public void setModifyDate(String modifyDate) {
		this.modifyDate = modifyDate;
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}


	public int getHits() {
		return hits;
	}


	public void setHits(int hits) {
		this.hits = hits;
	}


	public List<RecipeContentVO> getRecipeContentList() {
		return recipeContentList;
	}


	public void setRecipeContentList(List<RecipeContentVO> recipeContentList) {
		this.recipeContentList = recipeContentList;
	}


	public List<RecipeItemVO> getRecipeItemList() {
		return recipeItemList;
	}


	public void setRecipeItemList(List<RecipeItemVO> recipeItemList) {
		this.recipeItemList = recipeItemList;
	}

	public String getRecipeThumbnail() {
		return recipeThumbnail;
	}


	public void setRecipeThumbnail(String recipeThumbnail) {
		this.recipeThumbnail = recipeThumbnail;
	}


	@Override
	public String toString() {
		return "RecipeVO [recipeNo=" + recipeNo + ", memberVO=" + memberVO + ", recipeName=" + recipeName
				+ ", writeDate=" + writeDate + ", modifyDate=" + modifyDate + ", category=" + category + ", hits="
				+ hits + ", recipeContentList=" + recipeContentList + ", recipeItemList=" + recipeItemList
				+ ", recipeThumbnail=" + recipeThumbnail + "]";
	}




	
	
	


	
	
}
