package org.kosta.pamuk.model.vo;

public class StoredItemVO extends ItemVO {
	private int storedItemNo;
	private StorageVO storageVO;
	private String itemMemo;
	private String expiryDate;
	private String storedDate;
	private String qty;
	

	public StoredItemVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public StoredItemVO(String itemName, CategoryVO categoryVO, int storedItemNo, StorageVO storageVO, ItemVO itemVO, String itemMemo, String expiryDate,
			String storedDate, String qty) {
		super(itemName, categoryVO);
		this.storedItemNo = storedItemNo;
		this.storageVO = storageVO;
		this.itemMemo = itemMemo;
		this.expiryDate = expiryDate;
		this.storedDate = storedDate;
		this.qty = qty;
	}
	public int getStoredItemNo() {
		return storedItemNo;
	}
	public void setStoredItemNo(int storedItemNo) {
		this.storedItemNo = storedItemNo;
	}
	public StorageVO getStorageVO() {
		return storageVO;
	}
	public void setStorageVO(StorageVO storageVO) {
		this.storageVO = storageVO;
	}
	
	public String getItemMemo() {
		return itemMemo;
	}
	public void setItemMemo(String itemMemo) {
		this.itemMemo = itemMemo;
	}
	public String getExpiryDate() {
		return expiryDate;
	}
	public void setExpiryDate(String expiryDate) {
		this.expiryDate = expiryDate;
	}
	public String getStoredDate() {
		return storedDate;
	}
	public void setStoredDate(String storedDate) {
		this.storedDate = storedDate;
	}
	public String getQty() {
		return qty;
	}
	public void setQty(String qty) {
		this.qty = qty;
	}

	@Override
	public String toString() {
		return "StoredItemVO [" + super.toString() +"storedItemNo=" + storedItemNo + ", storageVO=" + storageVO + ", itemMemo=" + itemMemo
				+ ", expiryDate=" + expiryDate + ", storedDate=" + storedDate + ", qty=" + qty + "]";
	}

	
}
