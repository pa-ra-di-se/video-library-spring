package com.paradise.videolibrary.persistence;

import com.paradise.videolibrary.persistence.config.PersistenceConfiguration;
import org.junit.jupiter.api.BeforeAll;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.DynamicPropertyRegistry;
import org.springframework.test.context.DynamicPropertySource;
import org.springframework.test.context.jdbc.Sql;
import org.testcontainers.containers.PostgreSQLContainer;

@Sql({
        "classpath:sql/data.sql"
})
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
@ActiveProfiles("test")
@ContextConfiguration(classes = PersistenceConfiguration.class)
@DataJpaTest
public abstract class TestBase {

    private static final PostgreSQLContainer<?> container = new PostgreSQLContainer<>("postgres:17.5");

    @BeforeAll
    static void runContainer() {
        container.start();
    }

    @DynamicPropertySource
    static void postgresProperties(DynamicPropertyRegistry registry) {
        registry.add("spring.datasource.url", container::getJdbcUrl);
    }
}
