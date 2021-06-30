package org.kosta.pamuk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	// 메인페이지
	@RequestMapping(value={"/","home"})
	public String home() {
		return "home.tiles";
	}
	// 서브페이지( header, footer 만 있는거)
	@RequestMapping("sub")
	public String sublayout() {
		return "sub.tiles";
	}
}