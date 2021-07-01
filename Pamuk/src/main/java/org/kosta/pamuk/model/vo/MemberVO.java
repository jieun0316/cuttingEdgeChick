package org.kosta.pamuk.model.vo;

public class MemberVO {
	private String memberId;
	private String password;
	private String email;
	private String name;
	private String nick;
	private int status;
	private String birth;
	private String gender;
	
	public MemberVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	public MemberVO(String memberId, String password, String email, String name, String nick, int status,
			String birth, String gender) {
		super();
		this.memberId = memberId;
		this.password = password;
		this.email = email;
		this.name = name;
		this.nick = nick;
		this.status = status;
		this.birth = birth;
		this.gender = gender;
	}


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
	
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	
	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	@Override
	public String toString() {
		return "MemberVO [memberId=" + memberId + ", password=" + password + ", email=" + email + ", name=" + name
				+ ", nick=" + nick + ", status=" + status + ", birth=" + birth + ", gender=" + gender + "]";
	}
	
	
	
	
}
