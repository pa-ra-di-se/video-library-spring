package com.paradise.videolibrary.core.mapper;

import com.paradise.videolibrary.api.dto.UserReadDto;
import com.paradise.videolibrary.api.mapper.Mapper;
import com.paradise.videolibrary.persistence.entity.User;
import org.springframework.stereotype.Component;

@Component
public class UserReadMapper implements Mapper<User, UserReadDto>  {

    @Override
    public UserReadDto map(User object) {
        return UserReadDto.builder()
                .id(object.getId())
                .firstname(object.getFirstname())
                .lastname(object.getLastname())
                .email(object.getEmail())
                .build();
    }
}
