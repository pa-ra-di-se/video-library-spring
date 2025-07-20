package com.paradise.videolibrary.core.mapper;

import com.paradise.videolibrary.api.dto.UserCreateEditDto;
import com.paradise.videolibrary.api.mapper.Mapper;
import com.paradise.videolibrary.persistence.entity.Role;
import com.paradise.videolibrary.persistence.entity.User;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import java.util.Optional;

@Component
@RequiredArgsConstructor
public class UserCreateEditMapper implements Mapper<UserCreateEditDto, User> {

    private final PasswordEncoder passwordEncoder;

    @Override
    public User map(UserCreateEditDto object) {
        User user = new User();
        copy(object, user);

        return user;
    }

    @Override
    public User map(UserCreateEditDto fromObject, User toObject) {
        copy(fromObject, toObject);
        return toObject;
    }

    private void copy(UserCreateEditDto object, User user) {
        user.setFirstname(object.getFirstname());
        user.setLastname(object.getLastname());
        user.setEmail(object.getEmail());
        user.setRole(Role.USER);

        Optional.ofNullable(object.getRawPassword())
                .filter(StringUtils::hasText)
                .map(passwordEncoder::encode)
                .ifPresent(user::setPassword);
    }
}
