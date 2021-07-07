package org.kosta.pamuk.model.vo;

public class RecipeItemVO extends ItemVO {
	private String qty;
	
	public RecipeItemVO() {
		super();
	}

	public RecipeItemVO(String itemName, String qty) {
		super.setItemName(itemName);
		this.qty = qty;
	}
	
	public RecipeItemVO(String itemName, CategoryVO categoryVO, String qty) {
		super(itemName, categoryVO);
		this.qty = qty;
	}

	public String getQty() {
		return qty;
	}

	public void setQty(String qty) {
		this.qty = qty;
	}

	@Override
	public String toString() {
		return super.toString() + "RecipeItemVO [qty=" + qty + "]";
	}
}
