package org.kosta.pamuk.controller;

import java.util.ArrayList;

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
	MemberVO pvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	//연습중
	//MemberVO mvo = new MemberVO(); //원래는 세션에서 가져와야할 memberVO 임시로 넣어놓음
	//mvo.setMemberId("java");
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
@RequestMapping("fridge-update-form")
public String fridgeUpdateForm(Model model) {
	MemberVO pvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	String id = pvo.getMemberId();
	//String id="java";
	List<StorageVO> myStorage=sm.findStorageByMemberId(id);
	model.addAttribute("myStorage", myStorage);
	model.addAttribute("totalItemList", sm.getTotalStoredItemList(myStorage));
	return "fridge/fridge-update-form.tiles";	
}
@RequestMapping("getTotalStoredItemList")
@ResponseBody
public List<Map<String, Object>> getTotalStoredItemList(Model model){
   List<StorageVO> storageVOList = (List<StorageVO>) model.getAttribute("myStorage");
   return sm.getTotalStoredItemList(storageVOList);
}  


@RequestMapping("item-list")
public String itemList() {
	return "fridge/item-list";
}

//ajax로 가져오기
@RequestMapping("getStoredItemByStorageNo")
@ResponseBody
public List<StoredItemVO> getStoredItemByStorageNoAjax(int storageNo) {
	System.out.println(sm.getStoredItemByStorageNo(storageNo));
	return sm.getStoredItemByStorageNo(storageNo);
}

/*
 * 현재수정중
 */
//@PostMapping("getStoredItemByStorageNoUpdate")
@RequestMapping(value="getStoredItemByStorageNoUpdate", method=RequestMethod.POST)
@ResponseBody
public List<StoredItemVO> getStoredItemBystoredItemNoUpdate (StoredItemVO storedItemVO) {
	sm.getStoredItemBystoredItemNoUpdate(storedItemVO);
	return sm.getStoredItemByStorageNo(storedItemVO.getStorageVO().getStorageNo());
}


@PostMapping("checkboxDelete")
@ResponseBody
public List<StoredItemVO> checkboxDelete(@RequestBody Map<String,Object> map ) {

	String storageNo=(String)map.get("storageNo");
	
	ArrayList<String> deleteArray =(ArrayList<String>)map.get("deleteArray");
	
	
	int storageNoNum= Integer.parseInt(storageNo);
	
	/*
	 * int[] deleteArrayNums =
	 * Arrays.stream(deleteArray).mapToInt(Integer::parseInt).toArray();
	 * 
	 */
	  for(int i=0; i<deleteArray.size(); i++) {
		int deleteArrayNum= Integer.parseInt(deleteArray.get(i));
	    sm.checkboxDelete(deleteArrayNum); 
	  }
	 return sm.getStoredItemByStorageNo(storageNoNum);
}

/*
 		지으니가 지은 메소드 
 */
@RequestMapping(value="storeItem", method=RequestMethod.POST)
@ResponseBody
public List<StoredItemVO> storeItem(StoredItemVO siv) {
    sm.storeItem(siv);
    int storageNo = siv.getStorageVO().getStorageNo();
   //return  "getStoredItemByStorageNo?storageNo="+storageNo;
    return sm.getStoredItemByStorageNo(storageNo);
}

@RequestMapping(value="storeItems", method=RequestMethod.POST)
@ResponseBody
public List<StoredItemVO> storeItems(String[] itemName, int [] storageNo, String[] qty, String[] storedDate, String[] expiryDate) {
ArrayList<StoredItemVO> list = new ArrayList<StoredItemVO>();
   for (int i=0; i<itemName.length;i++) {
   StorageVO svo = new StorageVO();
   StoredItemVO vo = new StoredItemVO(itemName[i], svo, expiryDate[i], storedDate[i], qty[i]);
   list.add(vo);
   }
   for (StoredItemVO vo : list) {
      sm.storeItem(vo);
   }
   System.out.println(storageNo[0]);
   return sm.getStoredItemByStorageNo(storageNo[0]);
}

@RequestMapping("showRemingDay")
@ResponseBody
public int showRemingDay(int storedItemNo) {
	System.out.println("나는 배고파요");
	return sm.showRemingDay(storedItemNo); 
}

/* 07-14추가 */
@ResponseBody
@RequestMapping("getTotalStoredItemList2")
public String getTotalStoredItemList2() {
   MemberVO pvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
   String id=pvo.getMemberId();
   return sm.getTotalStoredItemList2(id);
}





}
