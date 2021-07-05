package org.kosta.pamuk.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.pamuk.model.vo.StorageVO;
import org.kosta.pamuk.model.vo.StoredItemVO;

@Mapper
public interface StorageMapper {

	void registerStorage(StorageVO svo);

	List<StorageVO> findStorageByMemberId(String id);

	List<StoredItemVO> getStoredItemByStorageNo(int storageNo); //메서드명에 list붙여야하나?
}
