package org.kosta.pamuk.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.pamuk.model.vo.StorageVO;
import org.kosta.pamuk.model.vo.StoredItemVO;

@Mapper
public interface StorageMapper {

	void registerStorage(StorageVO svo);

	List<StorageVO> findStorageByMemberId(String id);

	List<StoredItemVO> getStoredItemByStorageNo(int storageNo); //메서드명에 list붙여야하나?

	void updateStoredItem(StoredItemVO storedItemVO);
	
	void deleteStoredItem(int stored_item_no);
	
	//추가
	void storeItem(StoredItemVO siv);
	
	int daysRemaining(int stored_item_no);
	
	//07-14일
	  List<Map<String, Object>> getTotalStoredItemList(List<StorageVO> storageVOList);
	  
	  String getTotalStoredItemList2(String id);
}
