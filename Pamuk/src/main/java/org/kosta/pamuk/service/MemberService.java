package org.kosta.pamuk.service;

import java.util.List;

import org.kosta.pamuk.model.vo.AuthoritiesVO;
import org.kosta.pamuk.model.vo.MemberVO;

public interface MemberService {
	public void registerMember(MemberVO memberVO);

	public MemberVO findMemberInfo(String memberId);

	public MemberVO findMemberId(String name, String email, String birth);

	public MemberVO findMemberPassword(String memberId, String name, String email);

	public MemberVO identifyMemberPassword(String memberId, String password);

	public void updateMemberPassword(String password, String MemberId);

	public void updateNick(String memberId, String nick);

	public MemberVO findMemberById(String memberId);

	List<AuthoritiesVO> selectAuthorityById(String memberId);

	String idCheck(String memberId);

	public void updateMemberInfo(MemberVO memberVO);
}
