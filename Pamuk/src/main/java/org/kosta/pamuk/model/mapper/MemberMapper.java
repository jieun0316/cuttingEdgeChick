package org.kosta.pamuk.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.pamuk.model.vo.AuthoritiesVO;
import org.kosta.pamuk.model.vo.MemberVO;
@Mapper
public interface MemberMapper {
	//회원가입
	void registerMember(MemberVO memberVO);
	void registerRole(AuthoritiesVO authority);
	//멤버정보 조회
	MemberVO findMemberInfo(String memberId);
	//아이디 찾기
	MemberVO findMemberId(String name, String email, String birth);
	//비밀번호 찾기
	MemberVO findMemberPassword(String memberId, String name, String email);
	//비밀번호 확인 (비밀번호 수정, 회원정보 수정 전에 사용, 세션으로 아이디 값을 받아온다)
	MemberVO identifyMemberPassword(String memberId, String password);
	//비밀번호 수정 (세션으로 아이디 값을 받아온다)
	void updateMemberPassword(String password, String memberId);
	//닉네임 변경
	void updateNick(String memberId, String nick);
	// Ajax 아이디 중복확인
	int idCheck(String memberId);
	
	MemberVO findMemberById(String memberId);
	List<AuthoritiesVO> selectAuthorityById(String memberId);
	
	//관리자 관련
	//권한 박탈
	List<MemberVO> adminList();
	void disaccreditAdmin(String memberId);
	//권한 부여
	List<MemberVO> findMemberAll();
	List<MemberVO> findMemberByNick(String nick);
	void authorizeAdmin(String memberId);
}
