package org.kosta.pamuk.service;

import org.kosta.pamuk.model.vo.RecipeVO;
import org.springframework.transaction.annotation.Transactional;

public interface RecipeService {

	void postRecipe(RecipeVO vo);

}