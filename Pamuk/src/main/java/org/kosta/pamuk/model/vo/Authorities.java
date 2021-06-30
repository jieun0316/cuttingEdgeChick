package org.kosta.pamuk.model.vo;

public class Authorities {
	private MemberVO memberVO;
	private String authority;
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	public Authorities() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Authorities(MemberVO memberVO, String authority) {
		super();
		this.memberVO = memberVO;
		this.authority = authority;
	}
	@Override
	public String toString() {
		return "Authorities [memberVO=" + memberVO + ", authority=" + authority + "]";
	}
	
	
	
}
