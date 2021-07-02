package org.kosta.pamuk.service;

import org.kosta.pamuk.model.vo.MemberVO;

public interface MemberService {
	public void registerMember(MemberVO memberVO);
	public MemberVO findMemberInfo(String memberId);
	public MemberVO findMemberId(String name, String email);
	public MemberVO findMemberPassword(String memberId, String name, String email);
	public MemberVO identifyMemberPassword(String memberId, String password);
	public void updateMemberPassword(String password, String MemberId);
	public void updateNick(String memberId, String nick);
}
