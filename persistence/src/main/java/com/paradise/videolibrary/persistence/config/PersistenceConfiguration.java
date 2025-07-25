package com.paradise.videolibrary.persistence.config;

import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@EnableJpaRepositories(basePackages = "com.paradise.videolibrary.persistence.repository")
@EntityScan(basePackages = "com.paradise.videolibrary.persistence.entity")
@Configuration
public class PersistenceConfiguration {
}
