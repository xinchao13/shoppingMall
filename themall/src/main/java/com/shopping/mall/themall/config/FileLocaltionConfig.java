package com.shopping.mall.themall.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class FileLocaltionConfig implements WebMvcConfigurer {

	@Value("${file.resource}")
	String fileResource;
	
	@Value("${file.filelocation.url}")
	String fileFilelocationUrl;
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler(fileResource).addResourceLocations("file:"+fileFilelocationUrl);
	}
	
	
}
