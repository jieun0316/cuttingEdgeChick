package org.kosta.pamuk.model.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.pamuk.model.vo.StorageVO;

@Mapper
public interface StorageMapper {

	void registerStorage(StorageVO svo);

}
