package org.kosta.pamuk.model.vo;

public class StorageVO {
	private int storageNo;
	private MemberVO memberVO;
	private String type;
	private int locationNo;
	
	public StorageVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public StorageVO(int storageNo, MemberVO memberVO, String type, int locationNo) {
		super();
		this.storageNo = storageNo;
		this.memberVO = memberVO;
		this.type = type;
		this.locationNo = locationNo;
	}

	public int getStorageNo() {
		return storageNo;
	}

	public void setStorageNo(int storageNo) {
		this.storageNo = storageNo;
	}

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getLocationNo() {
		return locationNo;
	}

	public void setLocationNo(int locationNo) {
		this.locationNo = locationNo;
	}

	@Override
	public String toString() {
		return "StorageVO [storageNo=" + storageNo + ", memberVO=" + memberVO + ", type=" + type + ", locationNo="
				+ locationNo + "]";
	}
	
	
}
