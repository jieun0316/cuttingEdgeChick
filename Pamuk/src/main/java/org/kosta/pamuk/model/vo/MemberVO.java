package org.kosta.pamuk.model.vo;

public class MemberVO {
	private String memberId;
	private String password;
	private String email;
	private String name;
	private String nick;
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	
	public MemberVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MemberVO(String memberId, String password, String email, String name, String nick) {
		super();
		this.memberId = memberId;
		this.password = password;
		this.email = email;
		this.name = name;
		this.nick = nick;
	}
	@Override
	public String toString() {
		return "MemberVO [memberId=" + memberId + ", password=" + password + ", email=" + email + ", name=" + name
				+ ", nick=" + nick + "]";
	}
	
	
}
