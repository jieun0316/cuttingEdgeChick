package org.kosta.pamuk.model.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.pamuk.model.vo.RecipeVO;

@Mapper
public interface RecipeMapper {
	void postRecipe(RecipeVO recipeVO);
}
