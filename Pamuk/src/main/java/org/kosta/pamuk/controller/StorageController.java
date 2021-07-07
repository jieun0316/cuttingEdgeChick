package org.kosta.pamuk.controller;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.pamuk.model.mapper.StorageMapper;
import org.kosta.pamuk.model.vo.MemberVO;
import org.kosta.pamuk.model.vo.StorageVO;
import org.kosta.pamuk.model.vo.StoredItemVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class StorageController {
@Resource
StorageMapper sm;

@RequestMapping("fridge-register-form")
public String fridgeRegisterForm() {
	return "fridge/fridge-register-form.tiles";
}

//입력받은 숫자만큼 해당 타입의 칸을 생성해야
//냉장/냉동/실온 타입을 타입명으로 저장할지 숫자로 저장할지 생각하기
//타입을 hidden으로 받는 방법과 직접 밑에 추가해주는 방법 중 선택하기
@RequestMapping("registerStorage") //등록이라 Post로 바꾸어주어야
public String registerStorage(int fridge, int freezer, int room) {
	StorageVO svo = new StorageVO();
	MemberVO mvo = new MemberVO(); //원래는 세션에서 가져와야할 memberVO 임시로 넣어놓음
	mvo.setMemberId("java");
	svo.setMemberVO(mvo); 
	//냉장
	svo.setType("냉장");
	for(int i=0;i<fridge;i++) {
		svo.setLocationNo(i+1);
		sm.registerStorage(svo);
	}
	//냉동
	svo.setType("냉동");
	for(int i=0;i<freezer;i++) {
		svo.setLocationNo(i+1);
		sm.registerStorage(svo);
	}
	//실온
	svo.setType("실온");
	for(int i=0;i<room;i++) {
		svo.setLocationNo(i+1);
		sm.registerStorage(svo);
	} 
	return "redirect:fridge-update-form";
}
@RequestMapping("fridge-update-form")
public String fridgeUpdateForm(String id, Model model) {
	id="java";//원래는 세션에서 가져올 것
	List<StorageVO> myStorage=sm.findStorageByMemberId(id);
	model.addAttribute("myStorage", myStorage);
	return "fridge/fridge-update-form.tiles";	
}
@RequestMapping("item-list")
public String itemList() {
	return "fridge/item-list";
}

//ajax로 가져오기
@RequestMapping("getStoredItemByStorageNo")
@ResponseBody
public List<StoredItemVO> getStoredItemByStorageNoAjax(int storageNo) {
	return sm.getStoredItemByStorageNo(storageNo);
}

@RequestMapping(value="storeItem", method=RequestMethod.POST)
public List<StoredItemVO> storeItem(StoredItemVO siv) {
	 sm.storeItem(siv);
	 int storageNo = siv.getStorageVO().getStorageNo();
	//return  "getStoredItemByStorageNo?storageNo="+storageNo;
	 return sm.getStoredItemByStorageNo(storageNo);
}
@RequestMapping("test")
public String test() {
	return "fridge/basic-fridge-create-form2.tiles";
}
}
