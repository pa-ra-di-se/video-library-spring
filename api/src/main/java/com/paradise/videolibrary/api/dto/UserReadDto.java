package com.paradise.videolibrary.api.dto;

import lombok.Builder;
import lombok.Value;

@Value
@Builder
public class UserReadDto {
    Long id;
    String firstname;
    String lastname;
    String email;
}