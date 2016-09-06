package edu.cornell.api.configuration;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;


@Configuration
@EnableAutoConfiguration
@ComponentScan(basePackages = "edu.cornell.api")
public class AppConfig  {

    public static void main(String[] args) {
        ApplicationContext ctx = SpringApplication.run(AppConfig.class, args);
    }
}
