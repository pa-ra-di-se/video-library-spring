package com.paradise.videolibrary.web.config;

import com.paradise.videolibrary.api.dto.EmailDetails;
import com.paradise.videolibrary.api.dto.OidcIdTokenDetails;
import com.paradise.videolibrary.api.dto.UserCreateEditDto;
import com.paradise.videolibrary.api.mail.EmailService;
import com.paradise.videolibrary.core.service.UserService;
import com.paradise.videolibrary.web.mapper.OidcIdTokenMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.client.oidc.userinfo.OidcUserRequest;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserService;
import org.springframework.security.oauth2.core.oidc.OidcIdToken;
import org.springframework.security.oauth2.core.oidc.user.DefaultOidcUser;
import org.springframework.security.oauth2.core.oidc.user.OidcUser;
import org.springframework.security.web.SecurityFilterChain;

import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.Set;

@Configuration
@EnableMethodSecurity
@RequiredArgsConstructor
public class SecurityConfiguration {

    private final UserService userService;
    private final EmailService emailService;
    private final OidcIdTokenMapper oidcIdTokenMapper;


    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http.authorizeHttpRequests(urlConfig -> urlConfig
                .requestMatchers("/login", "/users/registration","/users/create", "/v3/api-docs/**", "/swagger-ui/**").permitAll()
                .requestMatchers("/").authenticated()
                .anyRequest().denyAll()
        );
        http.formLogin(login -> login
                        .loginPage("/login")
                        .defaultSuccessUrl("/")
        );
        http.oauth2Login(config -> config
                .loginPage("/login")
                .defaultSuccessUrl("/")
                .userInfoEndpoint(userInfo -> userInfo.oidcUserService(oidcUserService())));
        http.logout(logout -> logout
                .logoutUrl("/logout")
                .logoutSuccessUrl("/login")
                .deleteCookies("JSESSIONID"));

        return http.build();
    }

    private OAuth2UserService<OidcUserRequest, OidcUser> oidcUserService() {
        return userRequest -> {
            OidcIdToken oidcIdToken = userRequest.getIdToken();
            String email = oidcIdToken.getEmail();

            if(!userService.findByEmail(email)) {
                OidcIdTokenDetails oidcIdTokenDetails = oidcIdTokenMapper.map(oidcIdToken);
                UserCreateEditDto userCreateEditDto = oidcIdTokenDetails.getUserCreateEditDto();
                EmailDetails emailDetails = oidcIdTokenDetails.getEmailDetails();

                userService.create(userCreateEditDto);
                emailService.sendSimpleMail(emailDetails);
            }

            UserDetails userDetails = userService.loadUserByUsername(email);
            DefaultOidcUser oidcUser = new DefaultOidcUser(userDetails.getAuthorities(), oidcIdToken);

            Set<Method> userDetailsMethods = Set.of(UserDetails.class.getMethods());

            return (OidcUser) Proxy.newProxyInstance(SecurityConfiguration.class.getClassLoader(),
                    new Class[]{UserDetails.class, OidcUser.class},
                    (proxy, method, args) -> userDetailsMethods.contains(method)
                            ? method.invoke(userDetails, args)
                            : method.invoke(oidcUser, args));
        };
    }
}
