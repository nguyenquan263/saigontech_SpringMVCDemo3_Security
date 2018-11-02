package vn.edu.saigontech.SpringMVCDemo.configurations;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.servlet.configuration.EnableWebMvcSecurity;
import org.springframework.security.web.authentication.Http403ForbiddenEntryPoint;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.authentication.logout.HttpStatusReturningLogoutSuccessHandler;

@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	@Autowired
	private DataSource dataSource;

	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		auth.inMemoryAuthentication().withUser("admin").password("123456").roles("ADMIN");
		auth.jdbcAuthentication().dataSource(dataSource)
				.usersByUsernameQuery("select USERNAME, PASSWORD, STATUS" + " from USERS where USERNAME=?")
				.authoritiesByUsernameQuery("select USERNAME, ROLE" + " from USERS where USERNAME=?");
	}
	
	@Configuration
	@Order(1)
	public static class RESTSecurity extends WebSecurityConfigurerAdapter {
		@Override
		protected void configure(HttpSecurity http) throws Exception {
			http.csrf().disable().antMatcher("/rest/**").authorizeRequests()
					.antMatchers(HttpMethod.POST, "/rest/manage/login").permitAll()
					.antMatchers("/rest/**").authenticated()
					.and()
					.exceptionHandling().authenticationEntryPoint(new accessDeniedEntryPoint()).and()
					.addFilterBefore(new JwtLoginFilter("/rest/manage/login", authenticationManager()),
							UsernamePasswordAuthenticationFilter.class)
					.addFilterBefore(new JWTAuthenticationFilter(), UsernamePasswordAuthenticationFilter.class)
					.exceptionHandling().accessDeniedPage("/403");

		}
	}
	
	@Configuration
	@Order(2)
	public static class NORESTSecurity extends WebSecurityConfigurerAdapter {
		@Override
		protected void configure(HttpSecurity http) throws Exception {
			http.csrf().disable()
			.authorizeRequests()
			.anyRequest().authenticated().and()
			.formLogin();

		}
	}

	

}
