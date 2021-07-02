package org.kosta.pamuk.service;

import javax.annotation.Resource;

import org.kosta.pamuk.model.mapper.MemberMapper;
import org.kosta.pamuk.model.vo.MemberVO;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
	@Resource
	private MemberMapper memberMapper;
	/*
	 @Resource 
	 private BCryptPasswordEncoder passwordEncoder;
	 */
	
	/**
	 * 회원등록
	 * 비밀번호를 bcrypt 알고리즘으로 암호화하여 DB에 저장
	 * 회원 가입시 반드시 권한이 등록되도록 트랜잭션처리를 한다
	 */
	//@Transactional
	@Override
	public void registerMember(MemberVO memberVO){
		//String encodedPwd = passwordEncoder.encode(vo.getPassword());
		//vo.setPassword(encodedPwd);
		memberMapper.registerMember(memberVO);
		// 권한 부여, 맨 마지막 "user"는 권한명
		//Authority authority = new Authority(vo.getMemberId(), "user");
		// memberMapper.registerRole(authority);
	}

	@Override
	public MemberVO findMemberInfo(String memberId) {
		return memberMapper.findMemberInfo(memberId);
	}
	/**
	 * 이름, 이메일로 아이디 찾기
	 */
	@Override
	public MemberVO findMemberId(String name, String email) {
		return memberMapper.findMemberId(name, email);
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

	
}
