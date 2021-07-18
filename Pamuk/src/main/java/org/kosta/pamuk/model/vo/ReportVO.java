package org.kosta.pamuk.model.vo;

public class ReportVO {
	private int recipeNo;
	private String reportContent;

	public ReportVO() {
		super();
	}

	public ReportVO(int recipeNo, String reportContent) {
		super();
		this.recipeNo = recipeNo;
		this.reportContent = reportContent;
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

	@Override
	public String toString() {
		return "ReportVO [recipeNo=" + recipeNo + ", reportContent=" + reportContent + "]";
	}

}
