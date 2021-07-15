package org.kosta.pamuk.test;

import org.junit.jupiter.api.Test;
import org.kosta.pamuk.model.mapper.MemberMapper;
import org.kosta.pamuk.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class memberTest {
	@Autowired
	MemberMapper mm;
	@Autowired
	MemberService ms;

	@Test
	public void memberTestMain() {
		// System.out.println(ms.findMemberInfo("sukuon"));
		// System.out.println(ms.findMemberId("김수권", "kaiosuku@naver.com",
		// "1994-01-03"));
		// System.out.println(ms.findMemberById("sukuon"));
		// System.out.println(ms.selectAuthorityById("sukuon"));
		// ms.registerMember(new MemberVO("asdf", "a", "aa@naver.com", "킴", "wa", 0,
		// "2000-10-10","F"));

		// 회원가입 테스트
		/*
<<<<<<< HEAD
		MemberVO a = new MemberVO();
		a.setMemberId("aa");
		a.setPassword("aaa");
		a.setEmail("bb@naver.com");
		a.setName("팍");
		a.setNick("찬호");
		a.setStatus(0);
		a.setBirth("2000-10-11");
		a.setGender("M");
		System.out.println(a);
		//ms.registerMember(a);
		System.out.println(ms.findMemberById("aa"));
		*/
		//System.out.println(ms.idCheck("sukuon"));
		
		/*
		System.out.println(ms.adminList());
		ms.authorizeAdmin("java");
		System.out.println(ms.adminList());
		*/
		String nick = ms.findMemberById("sukuon").getNick();
		System.out.println(nick);
		
=======
		 * MemberVO a = new MemberVO(); a.setMemberId("aa"); a.setPassword("aaa");
		 * a.setEmail("bb@naver.com"); a.setName("팍"); a.setNick("찬호"); a.setStatus(0);
		 * a.setBirth("2000-10-11"); a.setGender("M"); System.out.println(a);
		 * //ms.registerMember(a); System.out.println(ms.findMemberById("aa"));
		 */
//		MemberVO mv = mm.findMemberById("yang");
//		System.out.println(mv);
//		mv.setNick("good");
//		mm.updateMemberInfo(mv);
//		System.out.println(mv);
		
//		mm.updateMemberStatus("yang");
//		mm.updateAuthority("su");
		ms.quitMember("bro");
>>>>>>> refs/heads/givemebro
	}

}
