package org.kosta.pamuk.model.vo;

public class ReviewVO {
	private MemberVO memberVO;
	private RecipeVO recipeVO;
	private String reviewComment;
	private int rating;
	private String reviewDate;
	public ReviewVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReviewVO(MemberVO memberVO, RecipeVO recipeVO, String reviewComment, int rating, String reviewDate) {
		super();
		this.memberVO = memberVO;
		this.recipeVO = recipeVO;
		this.reviewComment = reviewComment;
		this.rating = rating;
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
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
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
				+ ", rating=" + rating + ", reviewDate=" + reviewDate + "]";
	}
	
	
}
