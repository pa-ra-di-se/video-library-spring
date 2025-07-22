package com.paradise.videolibrary.api.dto;

import com.paradise.videolibrary.api.validation.group.CreateAction;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Builder;
import lombok.Value;
import lombok.experimental.FieldNameConstants;

@Value
@Builder
@FieldNameConstants
public class UserCreateEditDto {

    @NotBlank
    String firstname;

    @NotBlank
    String lastname;

    @Email
    @NotBlank
    String email;

    @NotBlank(groups = CreateAction.class)
    @Size(min = 8, max = 32)
    String rawPassword;
}
