package org.kosta.pamuk.controller;

import javax.annotation.Resource;

import org.kosta.pamuk.model.vo.MemberVO;
import org.kosta.pamuk.service.MemberService;
import org.springframework.stereotype.Controller;
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
	
}
