package org.kosta.pamuk;

import java.util.List;

import javax.annotation.Resource;

import org.junit.jupiter.api.Test;
import org.kosta.pamuk.model.mapper.StorageMapper;
import org.kosta.pamuk.model.vo.StorageVO;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class PamukApplicationTests {
	
	@Resource
	StorageMapper sm;
	
	@Test
	void contextLoads() {
		/*
		StorageVO svo=new StorageVO();
		MemberVO mvo = new MemberVO();
		mvo.setMemberId("java");
		svo.setMemberVO(mvo);
		svo.setType("냉장");
		svo.setLocationNo(1);
		System.out.println(svo);
		sm.registerStorage(svo);
		*/
		List<StorageVO> list = sm.findStorageByMemberId("java");
		System.out.println(list);
	}

}
