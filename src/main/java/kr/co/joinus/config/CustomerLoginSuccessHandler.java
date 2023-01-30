package kr.co.joinus.config;

import java.io.IOException;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.user.DefaultOAuth2User;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Service;

import kr.co.joinus.dto.UsersDTO;
import kr.co.joinus.service.UsersService;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class CustomerLoginSuccessHandler implements AuthenticationSuccessHandler {
	
	@Autowired
	UsersService service;

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {

		// login 성공하면 해당 계정의 정보를 DefaultOAuth2User타입으로 받기
		DefaultOAuth2User user = (DefaultOAuth2User) authentication.getPrincipal();

		System.out.println(" user : :" + user);
		// db check
		Map<String, Object> map = user.getAttributes();
		Set<String> set = map.keySet();
		Iterator<String> it = set.iterator();

		while (it.hasNext()) {
			String key = it.next();
			System.out.println(key + " : " + map.get(key));
		}

		String email = (String) map.get("email");
		System.out.println("이메일 잘 담기나 확인: "+email);

		// dto create
		UsersDTO dto = service.getMemberByEmail(email);
		log.info("멤버: " + dto);

		if (dto == null) {
			request.getSession().setAttribute("email", email);
			response.sendRedirect("/regist");
		}

	}

}
