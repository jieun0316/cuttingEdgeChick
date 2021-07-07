package org.kosta.pamuk.controller;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.pamuk.model.mapper.ItemMapper;
import org.kosta.pamuk.model.vo.ItemVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ItemController {
	@Resource
	ItemMapper itemMapper;
	
	@RequestMapping(value="itemListByCategoryAjax", method=RequestMethod.GET)
	public @ResponseBody List<ItemVO> itemListByCategoryAjax(String categoryName, Model model) {
		List<ItemVO> itemList = itemMapper.getItemListByCategory(categoryName);
		return itemList;
	}
}
