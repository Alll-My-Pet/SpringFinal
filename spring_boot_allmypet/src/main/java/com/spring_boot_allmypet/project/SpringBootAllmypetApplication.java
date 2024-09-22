package com.spring_boot_allmypet.project;

import org.apache.catalina.connector.Connector;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.embedded.tomcat.TomcatServletWebServerFactory;
import org.springframework.boot.web.servlet.server.ServletWebServerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.annotation.PropertySources;

@SpringBootApplication
@ComponentScan(basePackages = {"com.spring_boot_allmypet.project"})
@MapperScan(basePackages = {"com.spring_boot_allmypet.project"})
//DB 연결정보 : 프로퍼티 사용
//로컬 경로 / 서버 경로
@PropertySources({
@PropertySource(value={"file:d:/springWorkspace/configure.properties", 
"file:/usr/local/allmypet/properties/configure.properties" }, 
ignoreResourceNotFound=true)
}) 
public class SpringBootAllmypetApplication {
	/*@Bean    
	public ServletWebServerFactory serveltContainer(){       
		TomcatServletWebServerFactory tomcat = new TomcatServletWebServerFactory();        
		tomcat.addAdditionalTomcatConnectors(createStandardConnector());       
		return tomcat;    
	}    
	
	private Connector createStandardConnector(){        
		Connector connector = new Connector("org.apache.coyote.http11.Http11NioProtocol");        
		connector.setPort(8080);        
		return connector;    
	}*/
	public static void main(String[] args) {
		SpringApplication.run(SpringBootAllmypetApplication.class, args);
	}

}
