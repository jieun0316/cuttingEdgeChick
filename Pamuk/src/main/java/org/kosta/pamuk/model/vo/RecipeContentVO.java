package org.kosta.pamuk.model.vo;

public class RecipeContentVO {
	private int recipeNo;
	private int stepNo;
	private String stepTitle;
	private String content;
	private String imagePath;

	public RecipeContentVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	

	public RecipeContentVO(int recipeNo, int stepNo, String stepTitle, String content, String imagePath) {
		super();
		this.recipeNo = recipeNo;
		this.stepNo = stepNo;
		this.stepTitle = stepTitle;
		this.content = content;
		this.imagePath = imagePath;
	}



	public int getRecipeNo() {
		return recipeNo;
	}

	public void setRecipeNo(int recipeNo) {
		this.recipeNo = recipeNo;
	}

	public int getStepNo() {
		return stepNo;
	}

	public void setStepNo(int stepNo) {
		this.stepNo = stepNo;
	}

	public String getStepTitle() {
		return stepTitle;
	}

	public void setStepTitle(String stepTitle) {
		this.stepTitle = stepTitle;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	@Override
	public String toString() {
		return "RecipeContentVO [stepNo=" + stepNo + ", stepTitle=" + stepTitle + ", content=" + content
				+ ", imagePath=" + imagePath + "]";
	}

}
