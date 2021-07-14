package org.kosta.pamuk.controller;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.pamuk.model.vo.MemberVO;
import org.kosta.pamuk.service.MemberService;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
@RequestMapping("master")
public class MasterController {
	@Resource
	private MemberService memberService;
	// 권한 박탈
	@Secured("ROLE_MASTER")
	@RequestMapping("adminList")
	public String adminListView(Model model) {
		List<MemberVO> mvo = memberService.adminList();
		model.addAttribute("list", mvo);
		return "master/adminListView.tiles";
	}
	@Secured("ROLE_MASTER")
	@RequestMapping(value = "/disaccredit", method = RequestMethod.POST)
	public String disaccreditAdmin(String memberId) {
		memberService.disaccreditAdmin(memberId);
		return "redirect:adminList";
	}
	
	// 권한 부여
	@Secured("ROLE_MASTER")
	@RequestMapping("findMemberAll")
	public String findMemberFormForAdmin(Model model) {
		List<MemberVO> mlist = memberService.findMemberAll();
		model.addAttribute("mlist", mlist);
		return "master/findMemberFormForMaster.tiles";
	}
	@Secured("ROLE_MASTER")
	@RequestMapping(value = "/authorizeAdmin", method = RequestMethod.POST)
	public String authorizeAdmin(String memberId) {
		memberService.authorizeAdmin(memberId);
		return "redirect:findMemberAll";
	}
	
}
