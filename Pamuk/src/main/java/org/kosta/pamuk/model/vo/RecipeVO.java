package org.kosta.pamuk.model.vo;

public class RecipeVO {
	private int recipeNo;
	private MemberVO memberVO;
	private String recipeName;
	private String writeDate;
	private String modifyDate;
	private String category;
	private int hits;
	
	public RecipeVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public RecipeVO(int recipeNo) {
		super();
		this.recipeNo = recipeNo;
	}


	public RecipeVO(int recipeNo, MemberVO memberVO, String recipeName, String writeDate, String modifyDate,
			String category, int hits) {
		super();
		this.recipeNo = recipeNo;
		this.memberVO = memberVO;
		this.recipeName = recipeName;
		this.writeDate = writeDate;
		this.modifyDate = modifyDate;
		this.category = category;
		this.hits = hits;
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
	@Override
	public String toString() {
		return "RecipeVO [recipeNo=" + recipeNo + ", memberVO=" + memberVO + ", recipeName=" + recipeName
				+ ", writeDate=" + writeDate + ", modifyDate=" + modifyDate + ", category=" + category + ", hits="
				+ hits + "]";
	}
	
	
}
