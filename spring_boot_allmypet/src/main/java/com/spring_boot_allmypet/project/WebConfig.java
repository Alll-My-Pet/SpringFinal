package com.spring_boot_allmypet.project;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {

		// 현재 작업 중인 프로젝트의 루트 경로
		String projectRootPath = System.getProperty("user.dir");
		// 맵핑 이름 : project_images
		registry.addResourceHandler("/project_images/**")
		.addResourceLocations("file:///" + projectRootPath + "/src/main/webapp/uploads/");

		registry.addResourceHandler("/prd_images/**")
		.addResourceLocations("file:///usr/local/allmypet/product_images/");
		registry.addResourceHandler("/emoji_images/**")
		.addResourceLocations("file:///usr/local/allmypet/emoji_images/");
		registry.addResourceHandler("/member_images/**")
		.addResourceLocations("file:///usr/local/allmypet/member_images/");

	}
}