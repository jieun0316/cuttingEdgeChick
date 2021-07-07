package org.kosta.pamuk.controller;

import javax.annotation.Resource;

import org.kosta.pamuk.model.vo.MemberVO;
import org.kosta.pamuk.service.MemberService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	@Resource
	private MemberService memberService;
	
	/*
	 * 로그인
	 */
	@RequestMapping("/user/loginForm")
	public String loginForm() {
		return "member/loginForm.tiles";
	}
	@RequestMapping("/login_fail")
	public String loginFail() {
		return "member/login_fail";
	}
	
	/*
	 * 회원가입
	 */
	@RequestMapping("/user/registerForm")
	public String registerForm() {
		return "member/registerForm.tiles";
	}
	
	@RequestMapping(value = "/user/registerMember", method = RequestMethod.POST)
	public String register(MemberVO memberVO) {
		System.out.println(memberVO);
		memberService.registerMember(memberVO);
		return "redirect:/user/registerResultView?memberId="+memberVO.getMemberId();
	}
	@RequestMapping("/user/registerResultView")
	public ModelAndView registerResultView(String memberId) {
		MemberVO memberVO = memberService.findMemberById(memberId);
		return new ModelAndView("member/register_result.tiles", "memberVO", memberVO);
	}
	
	/*
	 * 아이디 찾기
	 */
	@RequestMapping("/user/findMemberIdForm")
	public String findMemberIdForm() {
		return "member/findMemberIdForm.tiles";
	}
	
	@RequestMapping("/user/findMemberId")
	public String findMemberId(String name, String email, String birth, Model model) {
		MemberVO mvo = memberService.findMemberId(name, email, birth);
		if(mvo==null) {
			return "member/findMemberId_fail.tiles";
		} else {
			model.addAttribute("memberVO", mvo);
			return "member/findMemberId_ok.tiles";
		}
	}
	
	@RequestMapping("user/idCheckAjax")
	@ResponseBody
	public String idCheckAjax(String memberId) {
		return memberService.idCheck(memberId);
	}
	
	/*
	 * 비밀번호 찾기
	 */
	@RequestMapping("/user/findMemberPasswordForm")
	public String findMemberPasswordForm() {
		return "member/findMemberPasswordForm.tiles";
	}
	/*
	 * 회원정보 조회
	 */
	@RequestMapping("user/myInfo")
	public String myInfo() {
		return "member/memberInfo.tiles";
	}
}
