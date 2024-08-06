package com.nmims;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.orm.jpa.HibernateJpaAutoConfiguration;

import org.springframework.boot.autoconfigure.webservices.WebServicesAutoConfiguration;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.context.annotation.Profile;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.session.data.redis.config.annotation.web.http.EnableRedisHttpSession;



@SpringBootApplication(exclude = {WebServicesAutoConfiguration.class, HibernateJpaAutoConfiguration.class})
@EnableEurekaClient
@EnableScheduling
@EnableAutoConfiguration(exclude = {WebServicesAutoConfiguration.class, HibernateJpaAutoConfiguration.class})
public class Application {
	

	public static void main(String[] args) {
		// TODO Auto-generated method stub
        SpringApplication.run(Application.class, args);

	}  

}
  