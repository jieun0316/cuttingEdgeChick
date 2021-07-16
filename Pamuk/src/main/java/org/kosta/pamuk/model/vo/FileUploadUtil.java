package org.kosta.pamuk.model.vo;

import org.springframework.context.annotation.Bean;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

public class FileUploadUtil {
	
	@Bean(name = "multipartResolver")
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
		//multipartResolver.setMaxUploadSize(100000);
		return multipartResolver;
	}
}
