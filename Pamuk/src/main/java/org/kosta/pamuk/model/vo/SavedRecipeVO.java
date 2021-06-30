package org.kosta.pamuk.model.vo;

public class SavedRecipeVO {
	private MemberVO memberVO;
	private RecipeVO recipeVO;
	private String savedDate;
	
	public SavedRecipeVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SavedRecipeVO(MemberVO memberVO, RecipeVO recipeVO, String savedDate) {
		super();
		this.memberVO = memberVO;
		this.recipeVO = recipeVO;
		this.savedDate = savedDate;
	}

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

	public RecipeVO getRecipeVO() {
		return recipeVO;
	}

	public void setRecipeVO(RecipeVO recipeVO) {
		this.recipeVO = recipeVO;
	}

	public String getSavedDate() {
		return savedDate;
	}

	public void setSavedDate(String savedDate) {
		this.savedDate = savedDate;
	}

	@Override
	public String toString() {
		return "SavedRecipeVO [memberVO=" + memberVO + ", recipeVO=" + recipeVO + ", savedDate=" + savedDate + "]";
	}
	
	
}
