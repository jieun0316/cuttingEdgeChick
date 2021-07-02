package org.kosta.pamuk.model.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.pamuk.model.vo.CategoryVO;
import org.kosta.pamuk.model.vo.ItemVO;

@Mapper
public interface ItemMapper {
	ArrayList<CategoryVO> getCategoryList();
	ArrayList<ItemVO> getItemListByCategory(String category);
	void addCategory(CategoryVO categoryVO);
	void addItem(ItemVO item);

}
