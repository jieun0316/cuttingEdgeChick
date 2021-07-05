package org.kosta.pamuk.controller;

import javax.annotation.Resource;

import org.kosta.pamuk.model.vo.MemberVO;
import org.kosta.pamuk.service.MemberService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController {
	@Resource
	private MemberService memberService;
	
	
	@RequestMapping("loginForm")
	public String loginForm() {
		return "member/loginForm.tiles";
	}
	
	@RequestMapping("registerForm")
	public String registerForm() {
		return "member/registerForm.tiles";
	}
	
	@RequestMapping(value = "user/registerMember", method = RequestMethod.POST)
	public String register(MemberVO vo) {
		memberService.registerMember(vo);
		return "redirect:/user/registerResultView?id="+vo.getMemberId();
	}
	
	@RequestMapping("findMemberIdForm")
	public String findMemberIdForm() {
		return "member/findMemberIdForm.tiles";
	}
	
	@RequestMapping("findMemberId")
	public String findMemberId(String name, String email, String birth, Model model) {
		MemberVO mvo = memberService.findMemberId(name, email, birth);
		
		if(mvo==null) {
			return "member/findMemberId_fail.tiles";
		} else {
			model.addAttribute("memberVO", mvo);
			return "member/findMemberId_ok.tiles";
		}
		
	}
	
	@RequestMapping("findMemberPasswordForm")
	public String findMemberPasswordForm() {
		return "member/findMemberPasswordForm.tiles";
	}
}
