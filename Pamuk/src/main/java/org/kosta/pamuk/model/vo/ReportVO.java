package org.kosta.pamuk.model.vo;

public class ReportVO {
	private int recipeNo;
	private String reportContent;
	private String reportTime;
	private String recipeName;
	private String recipeThumbnail;
	private String memberId;
	public ReportVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReportVO(int recipeNo, String reportContent, String reportTime, String recipeName, String recipeThumbnail,
			String memberId) {
		super();
		this.recipeNo = recipeNo;
		this.reportContent = reportContent;
		this.reportTime = reportTime;
		this.recipeName = recipeName;
		this.recipeThumbnail = recipeThumbnail;
		this.memberId = memberId;
	}
	public int getRecipeNo() {
		return recipeNo;
	}
	public void setRecipeNo(int recipeNo) {
		this.recipeNo = recipeNo;
	}
	public String getReportContent() {
		return reportContent;
	}
	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}
	public String getReportTime() {
		return reportTime;
	}
	public void setReportTime(String reportTime) {
		this.reportTime = reportTime;
	}
	public String getRecipeName() {
		return recipeName;
	}
	public void setRecipeName(String recipeName) {
		this.recipeName = recipeName;
	}
	public String getRecipeThumbnail() {
		return recipeThumbnail;
	}
	public void setRecipeThumbnail(String recipeThumbnail) {
		this.recipeThumbnail = recipeThumbnail;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	@Override
	public String toString() {
		return "ReportVO [recipeNo=" + recipeNo + ", reportContent=" + reportContent + ", reportTime=" + reportTime
				+ ", recipeName=" + recipeName + ", recipeThumbnail=" + recipeThumbnail + ", memberId=" + memberId
				+ "]";
	}
	
	
}
