package org.kosta.pamuk.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.pamuk.model.mapper.MemberMapper;
import org.kosta.pamuk.model.vo.AuthoritiesVO;
import org.kosta.pamuk.model.vo.MemberVO;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class MemberServiceImpl implements MemberService {
	@Resource
	private MemberMapper memberMapper;

	@Resource
	private BCryptPasswordEncoder passwordEncoder;

	/**
	 * 회원등록 비밀번호를 bcrypt 알고리즘으로 암호화하여 DB에 저장 회원 가입시 반드시 권한이 등록되도록 트랜잭션처리를 한다
	 */
	@Transactional
	@Override
	public void registerMember(MemberVO memberVO) {
		String encodedPwd = passwordEncoder.encode(memberVO.getPassword()); // MemberVO에서 받아온 패스워드를 인코딩(암호화)
		memberVO.setPassword(encodedPwd);
		System.out.println("Service" + memberVO);
		memberMapper.registerMember(memberVO);
		// 권한 부여, 맨 마지막 "user"는 권한명
		AuthoritiesVO authority = new AuthoritiesVO(memberVO.getMemberId(), "ROLE_MEMBER");
		memberMapper.registerRole(authority);
		System.out.println("registerMember: " + memberVO + " " + authority);
	}

	@Override
	public MemberVO findMemberInfo(String memberId) {
		return memberMapper.findMemberInfo(memberId);
	}

	/**
	 * 이름, 이메일로 아이디 찾기
	 */
	@Override
	public MemberVO findMemberId(String name, String email, String birth) {
		return memberMapper.findMemberId(name, email, birth);
	}

	/**
	 * 아이디, 이름, 이메일로 패스워드 찾기
	 */
	@Override
	public MemberVO findMemberPassword(String memberId, String name, String email) {
		return memberMapper.findMemberPassword(memberId, name, email);
	}

	/**
	 * 비밀번호 수정 전 비밀번호 확인
	 */
	@Override
	public MemberVO identifyMemberPassword(String memberId, String password) {
		return memberMapper.identifyMemberPassword(memberId, password);
	}

	/**
	 * 비밀번호 수정
	 */
	@Override
	public void updateMemberPassword(String password, String memberId) {
		memberMapper.updateMemberPassword(password, memberId);
	}

	@Override
	public void updateNick(String memberId, String nick) {
		memberMapper.updateNick(memberId, nick);
	}

	@Override
	public MemberVO findMemberById(String memberId) {
		return memberMapper.findMemberById(memberId);
	}

	@Override
	public List<AuthoritiesVO> selectAuthorityById(String memberId) {
		return memberMapper.selectAuthorityById(memberId);
	}

	@Override
	public String idCheck(String memberId) {
		int count = memberMapper.idCheck(memberId);
		return (count == 0) ? "ok" : "fail";
	}

	@Override
	public String nickCheck(String memberNick) {
		int count = memberMapper.nickCheck(memberNick);
		return (count == 0) ? "ok" : "fail";
	}

	@Override
	public List<MemberVO> adminList() {
		return memberMapper.adminList();
	}

	@Override
	public void disaccreditAdmin(String memberId) {
		memberMapper.disaccreditAdmin(memberId);
	}

	@Override
	public List<MemberVO> findMemberByNick(String nick) {
		return memberMapper.findMemberByNick(nick);
	}

	@Override
	public List<MemberVO> findMemberAll() {
		return memberMapper.findMemberAll();
	}

	@Override
	public void authorizeAdmin(String memberId) {
		memberMapper.authorizeAdmin(memberId);
	}

	public void updateMemberInfo(MemberVO memberVO) {
		MemberVO mvo = memberMapper.findMemberById(memberVO.getMemberId());
		System.out.println(mvo);
		mvo.setNick(memberVO.getNick());
		memberMapper.updateNick(mvo.getMemberId(),mvo.getNick());
	}

//	@Transactional
	@Override
	public void quitMember(String memberId) {
		System.out.println(memberId);
		// 1. member_status를 변경한다.(->1)
		memberMapper.updateMemberStatus(memberId);
		// 2. 관련 role을 제거한다.(->quit)
		memberMapper.updateAuthority(memberId);
	}

	@Override
	public void authorizeStarChef(String memberId) {
		memberMapper.authorizeStarChef(memberId);
	}

	@Override
	public List<MemberVO> findMemberAllForAdmin() {
		return memberMapper.findMemberAllForAdmin();
	}

	@Override
	public List<MemberVO> starChefList() {
		return memberMapper.starChefList();
	}

	@Override
	public void disaccreditStarChef(String memberId) {
		memberMapper.disaccreditStarChef(memberId);
	}

}
