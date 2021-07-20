package org.kosta.pamuk.controller;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.pamuk.model.mapper.StorageMapper;
import org.kosta.pamuk.model.vo.MemberVO;
import org.kosta.pamuk.model.vo.StorageVO;
import org.kosta.pamuk.model.vo.StoredItemVO;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("fridge")
public class StorageController {
	
@Resource
StorageMapper sm;

//처음 1회에 한하여 회원이 생성할 스토리지(냉장고 보관 칸) 갯수 입력받기. 스토리지 존재할 시 수정페이지로 이동
@RequestMapping("fridge-register-form")
public String fridgeRegisterForm() {
	MemberVO pvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	String id = pvo.getMemberId();
	List<StorageVO> myStorage=sm.findStorageByMemberId(id);
	if(!myStorage.isEmpty()) {
	return "redirect:/fridge/fridge-update-form";
	}else {
	return "fridge/fridge-register-form.tiles";
	}
}

//스토리지(냉장 보관 칸) 생성
//입력받은 숫자만큼 해당 타입의 칸을 생성해야
//밑처럼 직접 추가해주는 방법 외에 타입을 hidden으로 받는 방법 생각해보기 
@PostMapping("registerStorage") 
public String registerStorage(int fridge, int freezer, int room) {
	StorageVO svo = new StorageVO();
	MemberVO pvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	svo.setMemberVO(pvo);
	
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

//스토리지(냉장고 보관 칸)에 재료 관리 페이지. 생성된 스토리지 탭들과 칸별 식재료명을 먼저 보여줌. 등록된 스토리지가 미존재시 등록페이지로 이동
@RequestMapping("fridge-update-form")
public String fridgeUpdateForm(Model model) {
	MemberVO pvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	String id = pvo.getMemberId();
	List<StorageVO> myStorage=sm.findStorageByMemberId(id);
	if(!myStorage.isEmpty()) {
		model.addAttribute("myStorage", myStorage);
		model.addAttribute("totalItemList", sm.getTotalStoredItemList(myStorage));
		return "fridge/fridge-update-form.tiles";		
	} else {
		return "fridge/fridge-register-form.tiles";
	}
}

//추후 정리 예정
//fridge-update-form요청에 attribute로 저장되있는 회원의 storageVO를 사용해서 보관된 전체 식재료를 가져오려 했지만 model이 지역변수라 getAttribute불가
@RequestMapping("getTotalStoredItemList")
@ResponseBody
public List<Map<String, Object>> getTotalStoredItemList(Model model){
   List<StorageVO> storageVOList = (List<StorageVO>) model.getAttribute("myStorage");
   return sm.getTotalStoredItemList(storageVOList);
}  

//재료 검색 및 추가 (새로 만들기 팝업)
@RequestMapping("item-list")
public String itemList() {
	return "fridge/item-list";
}

//ajax로 보관 칸 별 재료 리스트 가져오기
@RequestMapping("getStoredItemByStorageNo")
@ResponseBody
public List<StoredItemVO> getStoredItemByStorageNoAjax(int storageNo) {
	return sm.getStoredItemByStorageNo(storageNo);
}

//보관된 재료 정보 수정 (수량 또는 유통기한)
@RequestMapping(value="updateStoredItem", method=RequestMethod.POST)
@ResponseBody
public List<StoredItemVO> updateStoredItem (StoredItemVO storedItemVO) {
	sm.updateStoredItem(storedItemVO);
	return sm.getStoredItemByStorageNo(storedItemVO.getStorageVO().getStorageNo());
}

//체크된 보관된 식재료 삭제
//만약 삭제되는 식재료의 신선도(sysdate-유통기한)가 음수일경우 기록되는 기능 구현 요망...
@PostMapping("deleteStoredItem")
@ResponseBody
public List<StoredItemVO> deleteStoredItem(@RequestBody Map<String,Object> map ) {
	//Map<String, String> throwMap = new LinkedHashMap<String,String>();
	String storageNo=(String)map.get("storageNo");
	ArrayList<String> deleteArray =(ArrayList<String>)map.get("deleteArray");
	int storageNoNum= Integer.parseInt(storageNo);
	  for(int i=0; i<deleteArray.size(); i++) {
		int deleteArrayNum= Integer.parseInt(deleteArray.get(i));
		/*
		 * //삭제되는 아이템의 신선도가 음수라면 map에 식재료를 키로, 수량을 qty로 추가. 아마 sysdate까지 해서 기록하는 table을
		 * 하나 만들어줘야할듯 if (sm.daysRemaining(deleteArrayNum)<0) { StoredItemVO svo =
		 * sm.getStoredItemByStoredItemNo(deleteArrayNum);
		 * throwMap.put(svo.getItemName(), svo.getQty()); }
		 */
	    sm.deleteStoredItem(deleteArrayNum); 
	  }
	 return sm.getStoredItemByStorageNo(storageNoNum);
}

//식재료 등록 (개별)
@RequestMapping(value="storeItem", method=RequestMethod.POST)
@ResponseBody
public List<StoredItemVO> storeItem(StoredItemVO siv) {
    sm.storeItem(siv);
    int storageNo = siv.getStorageVO().getStorageNo();
    return sm.getStoredItemByStorageNo(storageNo);
}

//식재료 전체 등록 (VO 여러개 한꺼번에 등록)
@RequestMapping(value="storeItems", method=RequestMethod.POST)
@ResponseBody
public List<StoredItemVO> storeItems(String[] itemName, int [] storageNo, String[] qty, String[] storedDate, String[] expiryDate) {
	ArrayList<StoredItemVO> list = new ArrayList<StoredItemVO>();
	for (int i=0; i<itemName.length;i++) {
		StorageVO svo = new StorageVO();
		svo.setStorageNo(storageNo[i]);
		StoredItemVO vo = new StoredItemVO(itemName[i], svo, expiryDate[i], storedDate[i], qty[i]);
		list.add(vo);
	}
   for (StoredItemVO vo : list) {
      sm.storeItem(vo);
   }
   return sm.getStoredItemByStorageNo(storageNo[0]);
}

//신선도 표시 
@RequestMapping("daysBeforeExpiry")
@ResponseBody
public int daysRemaining(int storedItemNo) {
	return sm.daysRemaining(storedItemNo); 
}

//냉장고의 전체 아이템을 중복 없이 쉼표기준 한줄로 출력
@ResponseBody
@RequestMapping("getTotalStoredItemList2")
public String getTotalStoredItemList2() {
   MemberVO pvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
   String id=pvo.getMemberId();
   return sm.getTotalStoredItemList2(id);
}

}
