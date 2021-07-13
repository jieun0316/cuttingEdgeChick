package org.kosta.pamuk.model.vo;

public class RecipeItemVO extends ItemVO {
	private int recipeNo;
	private String qty;
	
	public RecipeItemVO() {
		super();
	}

	public RecipeItemVO(int recipeNo, String itemName, String qty) {
		super.setItemName(itemName);
		this.qty = qty;
	}
	
	public RecipeItemVO(int recipeNo, String itemName, CategoryVO categoryVO, String qty) {
		super(itemName, categoryVO);
		this.qty = qty;
	}
	
	

	public int getRecipeNo() {
		return recipeNo;
	}

	public void setRecipeNo(int recipeNo) {
		this.recipeNo = recipeNo;
	}

	public String getQty() {
		return qty;
	}

	public void setQty(String qty) {
		this.qty = qty;
	}

	@Override
	public String toString() {
		return "RecipeItemVO [recipeNo=" + recipeNo + ", itemName="+ super.getItemName()  + ", qty=" + qty + "]";
	}


}
