package org.kosta.pamuk.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.pamuk.model.vo.StorageVO;

@Mapper
public interface StorageMapper {

	void registerStorage(StorageVO svo);

	List<StorageVO> findStorageByMemberId(String id);

}
