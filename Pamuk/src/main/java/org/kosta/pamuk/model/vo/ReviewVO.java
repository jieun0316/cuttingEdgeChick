package org.kosta.pamuk.model.vo;

public class ReviewVO {
	private MemberVO memberVO;
	private RecipeVO recipeVO;
	private String reviewComment;
	private int grade;
	private String reviewDate;
	public ReviewVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReviewVO(MemberVO memberVO, RecipeVO recipeVO, String reviewComment, int grade, String reviewDate) {
		super();
		this.memberVO = memberVO;
		this.recipeVO = recipeVO;
		this.reviewComment = reviewComment;
		this.grade = grade;
		this.reviewDate = reviewDate;
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
	public String getReviewComment() {
		return reviewComment;
	}
	public void setReviewComment(String reviewComment) {
		this.reviewComment = reviewComment;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public String getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}
	@Override
	public String toString() {
		return "ReviewVO [memberVO=" + memberVO + ", recipeVO=" + recipeVO + ", reviewComment=" + reviewComment
				+ ", grade=" + grade + ", reviewDate=" + reviewDate + "]";
	}
	
	
}
