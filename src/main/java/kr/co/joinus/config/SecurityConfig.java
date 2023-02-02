package kr.co.joinus.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import kr.co.joinus.service.CustomOAuth2UserDetailService;

@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	// db에 연결할 수 있는 객체를 가지고 있는 datasource
	// application.properties에 설정해둔 datasource정보를 가지고 bean으로 의존성 주입돼서 동작함
	@Autowired
	DataSource datasource;

	@Autowired
	CustomOAuth2UserDetailService userDetailService;
	
	@Autowired
	CustomerLoginSuccessHandler loginSuccessHandler;

	// bean등록해줌
	@Bean
	PasswordEncoder passwordEncoder() {
		// bcrypt라는 해쉬 함수를 이용해서 패스워드를 암호화하는 목적으로 설계된 클래스
		return new BCryptPasswordEncoder();
	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		// 사용자 id: user1
		// 패스워드: aaa 로 설정

		// db에 저장한 유저정보로 로그인하기 설정
		// as: 별칭주는거임. springboot security에선 별칭처럼 이름을 쓰는데 이거때문에 테이블 컬럼명을 바꿀수 없으니까 별칭을 줘서 대응하는거임.
		final String usernameQuery = "SELECT users_id as username, users_pwd as password FROM users WHERE users_id = ? ";
		// users 테이블의 id와 users_role테이블의 id를 비교하여 그 id의 권한이 어떤지 확인하기(인가를 주기 위함)
		final String authQuery = "SELECT users_id as username, users_role as authority FROM users WHERE users_id = ? ";

		// 작성한 정보를 바탕으로 db의 유저 정보와 권한을 가져와 패스워드를 인코딩 해줌
		auth.jdbcAuthentication().dataSource(datasource).usersByUsernameQuery(usernameQuery)
				.authoritiesByUsernameQuery(authQuery).passwordEncoder(passwordEncoder());
	}

	// authorization에 필요한 리소스 설정하기
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		// 지정한 서블릿마다 접근권한을 다르게 주기
		// public은 모든 사람이 접근 가능, member는 회원만, admin은 관리자만 접근 가능
		// 작성 후 localhost로 들어갔을 때 member와 admin은 접근권한이 없어서 403에러가 뜬다
		http.authorizeHttpRequests()
				.antMatchers("/logintest/member").authenticated() // authenticated: 인증이 된 사람만 들어오라하는 의미
				.antMatchers("/logintest/admin").hasRole("ADMIN")

				.antMatchers("/regist")
				.permitAll()
				.and()
				
				.oauth2Login().loginPage("/login")  // sns로그인 가능하게 하되 커스텀 로그인 페이지로 가도록 하기
				//.successHandler(loginSuccessHandler) //로그인 성공하면 successHandler 메서드를 실행
				.userInfoEndpoint() // 소셜 로그인 인증 후 얻어지는 사용자 정보를
				.userService(userDetailService); // 이렇게 설정하고 싶다(userDetailService클래스에서 설정한 값을 실행함) 
				
	}

	//메서드 실행하면 CustomerLoginSuccessHandler클래스로 이동
//	private AuthenticationSuccessHandler successHandler() {
//		return new CustomerLoginSuccessHandler();
//	}
}
