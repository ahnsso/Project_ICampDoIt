package com.example.main;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.scheduling.annotation.EnableScheduling;

@EnableScheduling
@SpringBootApplication
@ComponentScan( basePackages = { "com.example.controller", "com.exam.login", "com.exam.mboard", "com.exam.nboard", "com.exam.search", "com.exam.hboard", "com.exam.admin", "com.exam.home", "com.exam.weather" } )
public class ICampDoItApplication {

	public static void main(String[] args) {
		SpringApplication.run(ICampDoItApplication.class, args);
	}

}
