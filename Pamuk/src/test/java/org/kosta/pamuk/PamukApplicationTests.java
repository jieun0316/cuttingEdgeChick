package org.kosta.pamuk;

import java.util.List;

import javax.annotation.Resource;

import org.junit.jupiter.api.Test;
import org.kosta.pamuk.model.mapper.StorageMapper;
import org.kosta.pamuk.model.vo.StoredItemVO;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class PamukApplicationTests {
	
	@Resource
	StorageMapper sm;
	
	@Test
	void contextLoads() {

	}

}
