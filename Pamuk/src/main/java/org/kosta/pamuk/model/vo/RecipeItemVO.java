package org.kosta.pamuk.model.vo;

public class RecipeItemVO extends ItemVO {
	private RecipeVO recipeVO;
	private String qty;
	
	public RecipeItemVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RecipeItemVO(String itemName, CategoryVO categoryVO) {
		super(itemName, categoryVO);
		// TODO Auto-generated constructor stub
	}


	public RecipeItemVO(String itemName, CategoryVO categoryVO, RecipeVO recipeVO, String qty) {
		super(itemName, categoryVO);
		this.recipeVO = recipeVO;
		this.qty = qty;
	}

	public RecipeVO getRecipeVO() {
		return recipeVO;
	}

	public void setRecipeVO(RecipeVO recipeVO) {
		this.recipeVO = recipeVO;
	}

	public String getQty() {
		return qty;
	}

	public void setQty(String qty) {
		this.qty = qty;
	}

	@Override
	public String toString() {
		return "RecipeItemVO [" + super.toString() + "recipeVO=" + recipeVO + ", qty=" + qty + "]";
	}


	
	
}
