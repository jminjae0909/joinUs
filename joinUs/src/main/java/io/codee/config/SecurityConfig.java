package io.codee.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.authentication.configurers.provisioning.InMemoryUserDetailsManagerConfigurer;
import org.springframework.security.config.annotation.authentication.configurers.provisioning.UserDetailsManagerConfigurer.UserDetailsBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import io.codee.service.CustomOAuth2UserDetailService;

//xml에 쓰던 security설정을 클래스에 써줌

//2. 어노테이션으로 bean등록
@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	//db에 연결할 수 있는 객체를 가지고 있는 datasource
	//application.properties에 설정해둔 datasource정보를 가지고 bean으로 의존성 주입돼서 동작함
	@Autowired
	DataSource datasource;
	
	@Autowired
	CustomOAuth2UserDetailService userDetailService;

	//bean등록해줌
	@Bean
	PasswordEncoder passwordEncoder() {
		//BCryptPasswordEncoder
		//bcrypt라는 해쉬 함수를 이용해서 패스워드를 암호화하는 목적으로 설계된 클래스
		return new BCryptPasswordEncoder();
	}
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		//사용자 id: user1
		//패스워드: aaa 로 설정
		
		//db에 저장한 유저정보로 로그인하기 설정
		//as: 별칭주는거임. springboot security에선 별칭처럼 이름을 쓰는데 이거때문에 테이블 컬럼명을 바꿀수 없으니까 별칭을 줘서 대응하는거임.
		final String usernameQuery = "SELECT id as username, pw as password, enabled FROM member WHERE id = ? ";
		//member테이블의 id와 member_role테이블의 id를 비교하여 그 id의 권한이 어떤지 확인하기(인가를 주기 위함)
		final String authQuery = "SELECT a.id as username, b.role as authority FROM member a, member_role b WHERE a.id = b.id AND a.id = ? ";
		
		//작성한 정보를 바탕으로 db의 유저 정보와 권한을 가져와 패스워드를 인코딩 해줌
		auth.jdbcAuthentication()
			.dataSource(datasource)
			.usersByUsernameQuery(usernameQuery)
			.authoritiesByUsernameQuery(authQuery)
			.passwordEncoder(passwordEncoder());
		
	}
	
	//authorization에 필요한 리소스 설정하기
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		// 지정한 서블릿마다 접근권한을 다르게 주기
		// public은 모든 사람이 접근 가능, member는 회원만, admin은 관리자만 접근 가능
		//작성 후 localhost로 들어갔을 때 member와 admin은 접근권한이 없어서 403에러가 뜬다
		http.authorizeHttpRequests()
			// 세 가지 방법
			//1. .antMatchers("/logintest/member/**").hasRole("USER") ant 방식?
			//2. .antMatchers("/logintest/member").access("hasRole("USER")")
			.antMatchers("/logintest/member").authenticated() //authenticated: 인증이 된 사람만 들어오라하는 의미
			.antMatchers("/logintest/admin").hasRole("ADMIN")
			//나머지 요청에 대해서는 로그인을 요구하지 않음
			//.antMatchers("/logintest/public").permitAll();
			//두 가지 방법
			//.anyMatchers("/**").permitAll()
			
			//13에서 추가한 코드
			//인증된 사람만 게시글을 볼 수 있게 설정하기
			.antMatchers("/board/**").authenticated()
			.anyRequest().permitAll()
			.and()
			//로그인하는 경우에 대해 설정
//			.formLogin() //설정에 기본 loginForm띄우라고 설정해주는 것임. 이제 member나 admin으로 로그인할 수 있는 페이지 뜸
//			.and()
//			.loginPage("/login") //커스텀 로그인 페이지 찾아갈 수 있도록 서블릿 주소 등록
//			.permitAll();
			.oauth2Login().loginPage("/login") //sns로그인 가능하게 하되 커스텀 로그인 페이지로 가도록 하기
			.userInfoEndpoint() // 소셜 로그인 인증 후 얻어지는 사용자 정보를
			.userService(userDetailService); //이렇게 설정하고 싶다(userDetailService클래스에서 설정한 값을 실행함)
	}
}
