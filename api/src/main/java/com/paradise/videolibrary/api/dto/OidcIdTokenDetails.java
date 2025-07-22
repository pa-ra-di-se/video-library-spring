package com.paradise.videolibrary.api.dto;

import lombok.Builder;
import lombok.Value;

@Value
@Builder
public class OidcIdTokenDetails {

    UserCreateEditDto userCreateEditDto;

    EmailDetails emailDetails;
}
