package org.kosta.pamuk.model.vo;

public class CategoryVO {
	private String categoryName;
	private String storageTime;
		public CategoryVO() {
		super();
		// TODO Auto-generated constructor stub
	}
		
	
	public CategoryVO(String categoryName) {
			super();
			this.categoryName = categoryName;
		}


	public CategoryVO(String categoryName, String storageTime) {
		super();
		this.categoryName = categoryName;
		this.storageTime = storageTime;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getStorageTime() {
		return storageTime;
	}
	public void setStorageTime(String storageTime) {
		this.storageTime = storageTime;
	}
	@Override
	public String toString() {
		return "CategoryVO [categoryName=" + categoryName + ", storageTime=" + storageTime + "]";
	}
	
}
