package com.paradise.videolibrary.web.mapper;

import com.paradise.videolibrary.api.dto.EmailDetails;
import com.paradise.videolibrary.api.dto.OidcIdTokenDetails;
import com.paradise.videolibrary.api.dto.UserCreateEditDto;
import com.paradise.videolibrary.api.mapper.Mapper;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.security.oauth2.core.oidc.OidcIdToken;
import org.springframework.stereotype.Component;

@Component
public class OidcIdTokenMapper implements Mapper<OidcIdToken, OidcIdTokenDetails> {

    @Override
    public OidcIdTokenDetails map(OidcIdToken object) {
        var defaultPassword = RandomStringUtils.secureStrong().nextAlphanumeric(16);
        var userCreateEditDto = UserCreateEditDto.builder()
                .firstname(object.getGivenName() != null ? object.getGivenName() : "Username")
                .lastname(object.getFamilyName() != null ? object.getFamilyName() : "Lastname")
                .email(object.getEmail())
                .rawPassword(defaultPassword)
                .build();
        var emailDetails = EmailDetails.builder()
                .recipient(object.getEmail())
                .msgBody("""
                        Thank you for registering. To enter our system, you can also use our service,
                        login password: %s
                        
                        PS. The password was generated automatically, so we strongly recommend that you change it 
                        immediately after registration.
                        """.formatted(defaultPassword))
                .subject("Regarding registration")
                .build();

        return OidcIdTokenDetails.builder()
                .userCreateEditDto(userCreateEditDto)
                .emailDetails(emailDetails)
                .build();
    }
}
