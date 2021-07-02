package org.kosta.pamuk.test;

import java.util.ArrayList;

import org.junit.jupiter.api.Test;
import org.kosta.pamuk.model.mapper.ItemMapper;
import org.kosta.pamuk.model.vo.ItemVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class ItemTest {
	@Autowired
	ItemMapper im;

	@Test
	public void itemTestMain() {
		//im.addCategory(new CategoryVO("과일", "5일"));
		//im.addCategory(new CategoryVO("채소", "5일"));
		
		/*
		ArrayList<String> itemNameList = new ArrayList<String>();
		itemNameList.add("상추");
		itemNameList.add("배추");
		itemNameList.add("감자");
		itemNameList.add("당근");
		itemNameList.add("고구마");
		for(String itemName : itemNameList)
			im.addItem(new ItemVO(itemName, new CategoryVO("채소")));
		
		
		
		 ArrayList<CategoryVO> cList = im.getCategoryList(); 
		 for(CategoryVO cvo : cList) 
		 	{ System.out.println(cvo); }
		 */
		
		ArrayList<ItemVO> iList = im.getItemListByCategory("과일");
		for(ItemVO iVO : iList) 
			System.out.println(iVO);
	}

}
