package org.kosta.pamuk.controller;

import javax.annotation.Resource;

import org.kosta.pamuk.model.mapper.StorageMapper;
import org.kosta.pamuk.model.vo.StorageVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
public void registerStorage(int fridge, int freezer, int room) {
	StorageVO svo = new StorageVO();
	svo.setMemberVO(null); //세션에서 가져오면 될듯
	//냉장
	svo.setType("냉장");
	for(int i=0;i<fridge;i++) {
		svo.setLocationNo(i);
		sm.registerStorage(svo);
	}
	//냉동
	svo.setType("냉동");
	for(int i=0;i<freezer;i++) {
		svo.setLocationNo(i);
		sm.registerStorage(svo);
	}
	//실온
	svo.setType("실온");
	for(int i=0;i<room;i++) {
		svo.setLocationNo(i);
		sm.registerStorage(svo);
	} 
}
@RequestMapping("fridge-update-form")
public String fridgeUpdateForm() {
	return "fridge/fridge-update-form.tiles";	
}
@RequestMapping("item-list")
public String itemList() {
	return "fridge/item-list.tiles";
}
}
