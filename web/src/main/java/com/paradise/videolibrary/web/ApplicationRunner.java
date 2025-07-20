package com.paradise.videolibrary.web;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication(scanBasePackages = {
        "com.paradise.videolibrary.web",
        "com.paradise.videolibrary.core",
        "com.paradise.videolibrary.persistence"
})
public class ApplicationRunner {

    public static void main(String[] args) {
        SpringApplication.run(ApplicationRunner.class, args);
    }
}
