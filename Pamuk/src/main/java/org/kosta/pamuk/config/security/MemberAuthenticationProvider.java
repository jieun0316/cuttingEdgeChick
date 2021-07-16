package org.kosta.pamuk.config.security;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.pamuk.model.vo.AuthoritiesVO;
import org.kosta.pamuk.model.vo.MemberVO;
import org.kosta.pamuk.service.MemberService;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;
@Component
public class MemberAuthenticationProvider implements AuthenticationProvider {
	@Resource
	private MemberService memberService;
	@Resource 
	private BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		if(!supports(authentication.getClass())) {
			return null;
		}
		String memberId = authentication.getName();
		MemberVO member = memberService.findMemberById(memberId);
		if(member == null) {
			throw new UsernameNotFoundException("입력하신 아이디가 존재하지 않습니다");
		}
		String password=(String)authentication.getCredentials();
		if(!passwordEncoder.matches(password, member.getPassword())) {
			throw new BadCredentialsException("비밀번호가 일치하지 않습니다. 다시한번 확인해주세요");
		}
		List<AuthoritiesVO> list = memberService.selectAuthorityById(memberId);
		if(list.size() == 0) {
			throw new UsernameNotFoundException("아무 권한이 없습니다");
		}
		List<SimpleGrantedAuthority> authorities = new ArrayList<SimpleGrantedAuthority>();
		for(AuthoritiesVO au : list) {
			authorities.add(new SimpleGrantedAuthority(au.getAuthority()));
		}
		Authentication auth = new UsernamePasswordAuthenticationToken(member, password, authorities);
		return auth;
	}
	@Override
	public boolean supports(Class<?> authentication) {
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}
	
}
