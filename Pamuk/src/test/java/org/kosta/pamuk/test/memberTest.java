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
		System.out.println(ms.findMemberInfo("sukuon"));
		System.out.println(ms.findMemberId("김수권", "kaiosuku@naver.com", "1994-01-03"));
	}

}
