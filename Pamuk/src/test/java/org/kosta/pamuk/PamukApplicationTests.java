package org.kosta.pamuk;

import javax.annotation.Resource;

import org.junit.jupiter.api.Test;
import org.kosta.pamuk.model.mapper.StorageMapper;
import org.kosta.pamuk.model.vo.MemberVO;
import org.kosta.pamuk.model.vo.StorageVO;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class PamukApplicationTests {
	
	@Resource
	StorageMapper sm;
	
	@Test
	void contextLoads() {
		StorageVO svo=new StorageVO();
		MemberVO mvo = new MemberVO();
		mvo.setMemberId("java");
		svo.setMemberVO(mvo);
		svo.setType("냉장");
		svo.setLocationNo(1);
		sm.registerStorage(svo);
		
	}

}
