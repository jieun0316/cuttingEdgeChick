package org.kosta.pamuk.config.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true, securedEnabled = true)
public class WebSecurityConfig  extends WebSecurityConfigurerAdapter{
	@Autowired
	private MemberAuthenticationProvider authenticationProvider;
	@Bean
	public BCryptPasswordEncoder passwordEncoder() {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		return encoder;
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
			

		http.authorizeRequests().antMatchers("/","/home","/loginForm","/user/**","/css/**","/fonts/**","/img/**","/js/**", "/recipe/**","/upload/**").permitAll().anyRequest().authenticated();
		http.formLogin().loginPage("/loginForm")
			.loginProcessingUrl("/login")
			.failureUrl("/login_fail")
			.defaultSuccessUrl("/home",true)
			.usernameParameter("memberId").passwordParameter("password").and()
			.formLogin().permitAll();
		
		http.logout().permitAll().logoutUrl("/logout")
			.logoutSuccessUrl("/home").invalidateHttpSession(true)
			.and().exceptionHandling().accessDeniedPage("/accessDeniendView").authenticationEntryPoint(new AjaxAuthenticationEntryPoint("/user/loginForm"));
		
		http.sessionManagement()
		.maximumSessions(1)
		.maxSessionsPreventsLogin(true)
		.expiredUrl("/login");
	}
	
	protected void configure(AuthenticationManagerBuilder auth) {
		auth.authenticationProvider(authenticationProvider);
	}
	
}
