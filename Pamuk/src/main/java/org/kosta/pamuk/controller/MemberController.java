package org.kosta.pamuk.controller;

import javax.annotation.Resource;

import org.kosta.pamuk.model.vo.MemberVO;
import org.kosta.pamuk.service.MemberService;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
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
		memberService.registerMember(memberVO);
		return "redirect:/user/registerResultView?memberId=" + memberVO.getMemberId();
	}

	@RequestMapping("/user/registerResultView")
	public ModelAndView registerResultView(String memberId) {
		MemberVO memberVO = memberService.findMemberById(memberId);
		return new ModelAndView("member/register_result.tiles", "memberVO", memberVO);
	}
	/**
	 * id 중복 확인
	 * @param memberId
	 * @return
	 */
	@RequestMapping("user/idCheckAjax")
	@ResponseBody
	public String idCheckAjax(String memberId) {
		return memberService.idCheck(memberId);
	}
	/**
	 * nick 중복 확인
	 * @param memberNick
	 * @return
	 */
	@RequestMapping("user/nickCheckAjax")
	@ResponseBody
	public String nickCheckAjax(String memberNick) {
		return memberService.nickCheck(memberNick);
	}

	/*
	 * 아이디 찾기
	 */
	@RequestMapping("/user/findMemberIdForm")
	public String findMemberIdForm() {
		return "member/findMemberIdForm.tiles";
	}

	/**
	 * Id를 통해 회원을 조회합니다.
	 * 
	 * @param name
	 * @param email
	 * @param birth
	 * @param model
	 * @return
	 */
	@RequestMapping("/user/findMemberId")
	public String findMemberId(String name, String email, String birth, Model model) {
		MemberVO mvo = memberService.findMemberId(name, email, birth);
		if (mvo == null) {
			return "member/findMemberId_fail.tiles";
		} else {
			model.addAttribute("memberVO", mvo);
			return "member/findMemberId_ok.tiles";
		}
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
	public String myInfo(String memberId) {
		return "member/memberInfo.tiles";
	}

	/**
	 * 회원정보(nick name)를 수정합니다.
	 * 
	 * @return
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping("user/updateMemberInfoForm")
	public String updateMemberInfoForm() {
		return "member/updateMemberInfoForm.tiles";
	}

	@RequestMapping(value = "user/updateMemberInfo", method = RequestMethod.POST)
	public String updateMemberInfo(MemberVO memberVO) {
		MemberVO pvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		memberService.updateMemberInfo(memberVO);
		pvo.setNick(memberVO.getNick());
		System.out.println(memberVO + "수정");
		return "member/memberInfo.tiles";
	}

	@RequestMapping(value = "user/quitMember", method = RequestMethod.POST)
	public String quitMember() {
		MemberVO pvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		memberService.quitMember(pvo.getMemberId());
		return "member/quitResult";
	}
	// alert <회원 탈퇴가 되었습니다> ->(아래에다는 폼 서브밋) 확인 (스크립트 아래 폼(scfg 토큰 , 로그아웃 폼)->

}
