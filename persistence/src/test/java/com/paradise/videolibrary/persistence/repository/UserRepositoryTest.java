package com.paradise.videolibrary.persistence.repository;

import com.paradise.videolibrary.persistence.TestBase;
import com.paradise.videolibrary.persistence.entity.Role;
import com.paradise.videolibrary.persistence.entity.User;
import lombok.RequiredArgsConstructor;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

import java.util.Optional;
import java.util.stream.Stream;

import static org.assertj.core.api.Assertions.assertThat;

@RequiredArgsConstructor
class UserRepositoryTest extends TestBase {

    private final UserRepository userRepository;

    private static final User ALICE = User.builder()
            .id(1L)
            .firstname("Alice")
            .lastname("Brown")
            .email("alice.brown@example.com")
            .password("pass1")
            .role(Role.USER)
            .build();

    @ParameterizedTest
    @MethodSource("com.paradise.videolibrary.persistence.repository.UserRepositoryTest#getArgumentsForFindByEmailParameterizedTest")
    void findByEmailParameterizedTest(String email, Optional<User> user) {
        var maybeUser = userRepository.findByEmail(email);
        assertThat(maybeUser).isEqualTo(user);
    }

    static Stream<Arguments> getArgumentsForFindByEmailParameterizedTest() {
        return Stream.of(
                Arguments.of("alice.brown@example.com", Optional.of(ALICE)),
                Arguments.of("alice.bron@example.com", Optional.empty()),
                Arguments.of("dummy", Optional.empty()),
                Arguments.of( "", Optional.empty())
        );
    }
}
