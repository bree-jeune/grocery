package com.grocery_store_capstone.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SpringSecurity {

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {

        http.csrf(csrf -> csrf.disable())
                .authorizeHttpRequests(authorize -> authorize
                        .requestMatchers(new AntPathRequestMatcher("/admin/**"),
                                new AntPathRequestMatcher("/order/**"),
                                new AntPathRequestMatcher("/employee/**")).authenticated()
                        .requestMatchers("/resources/**", "/static/**", "/public/**", "/images/**").permitAll()  // Allow static resources
                        .anyRequest().permitAll()  // Permit all other requests
                )
                .formLogin(formLogin -> formLogin
                        .loginPage("/account/loginPageUrl")
                        .loginProcessingUrl("/account/loginProcessingURL")
                        .permitAll()  // Allow everyone to see the login page
                )
                .logout(formLogout -> formLogout
                        .invalidateHttpSession(true)
                        .logoutUrl("/account/logout")
                        .logoutSuccessUrl("/")
                        .permitAll()  // Allow everyone to log out
                );

        return http.build();
    }

    @Bean(name = "passwordEncoder")
    public PasswordEncoder getPasswordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration authConfig) throws Exception {
        return authConfig.getAuthenticationManager();
    }
}
