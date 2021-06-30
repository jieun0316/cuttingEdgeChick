package org.kosta.pamuk.model.vo;

public class RecipeItemVO extends ItemVO {
	private ItemVO itemVO;
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

	public RecipeItemVO(ItemVO itemVO, RecipeVO recipeVO, String qty) {
		super();
		this.itemVO = itemVO;
		this.recipeVO = recipeVO;
		this.qty = qty;
	}

	public ItemVO getItemVO() {
		return itemVO;
	}

	public void setItemVO(ItemVO itemVO) {
		this.itemVO = itemVO;
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
		return "RecipeItemVO [itemVO=" + itemVO + ", recipeVO=" + recipeVO + ", qty=" + qty + "]";
	}
	
	
}
