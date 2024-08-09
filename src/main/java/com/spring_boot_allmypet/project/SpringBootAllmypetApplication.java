package com.spring_boot_allmypet.project;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = {"com.spring_boot_allmypet.project"})
@MapperScan(basePackages = {"com.spring_boot_allmypet.project"})
public class SpringBootAllmypetApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringBootAllmypetApplication.class, args);
	}

}
