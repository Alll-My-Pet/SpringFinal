package com.spring_boot_allmypet.project;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

<<<<<<< HEAD

@Configuration
@EnableWebSecurity
public class WebSecurityConfig {


	@Bean
	public PasswordEncoder getPasswordEncoder() {
	return new BCryptPasswordEncoder();
	}

	@Bean
	public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
	http.csrf(csrf -> csrf.disable()).formLogin(formLogin -> formLogin.disable()).headers(
	headerConfig -> headerConfig.frameOptions(frameOptionsConfig -> frameOptionsConfig.disable()));

	return http.build();
 }
}


=======
@Configuration
@EnableWebSecurity
public class WebSecurityConfig {
	@Bean
	public PasswordEncoder getPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}
	@Bean
	public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
		http
		.csrf(csrf-> csrf.disable())
		.formLogin(formLogin -> formLogin.disable())
        .headers(headerConfig -> headerConfig.frameOptions(frameOptionsConfig ->
        		frameOptionsConfig.disable()));

		return http.build();
	}
}
>>>>>>> refs/heads/develop
