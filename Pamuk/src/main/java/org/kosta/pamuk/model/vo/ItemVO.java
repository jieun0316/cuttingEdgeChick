package org.kosta.pamuk.model.vo;

/**
 * Item에 관련된 VO
 * @author 최인재
 *
 */
public class ItemVO {
	private String itemName;
	private CategoryVO categoryVO;
	
	public ItemVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	public ItemVO(String itemName) {
		super();
		this.itemName = itemName;
	}


	public ItemVO(String itemName, CategoryVO categoryVO) {
		super();
		this.itemName = itemName;
		this.categoryVO = categoryVO;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public CategoryVO getCategoryVO() {
		return categoryVO;
	}

	public void setCategoryVO(CategoryVO categoryVO) {
		this.categoryVO = categoryVO;
	}

	@Override
	public String toString() {
		return "ItemVO [itemName=" + itemName + ", categoryVO=" + categoryVO + "]";
	}
	
	
	
}
