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

import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonArrayFormatVisitor;


@Controller
public class ItemController {
	@Resource
	ItemMapper itemMapper;
	
	@RequestMapping(value="recipe/itemListByCategoryAjax", method=RequestMethod.GET)
	public @ResponseBody List<ItemVO> itemListByCategoryAjax(String categoryName) {
		List<ItemVO> itemList = itemMapper.getItemListByCategory(categoryName);
		
		return itemList;
	}
}
