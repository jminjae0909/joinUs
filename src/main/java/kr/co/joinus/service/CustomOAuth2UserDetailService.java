package kr.co.joinus.service;

import java.io.PrintWriter;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class CustomOAuth2UserDetailService extends DefaultOAuth2UserService {

	// db연결을 위한 객체
	@Autowired
	UsersService service;

	@Override
	public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
		log.info(">>>>>>>>>>>>>>>>>>>>>>>>>> userRequest: " + userRequest);

		// 소셜로그인을 어떤 소셜로 했는지 구분하기. 소셜 이름 가져오는 메서드
		String clientName = userRequest.getClientRegistration().getClientName();

		log.info("client name: " + clientName);

		// 로그인한 계정의 정보를 가져와서 log로 출력하기
		OAuth2User oAuth2User = super.loadUser(userRequest);

		// 파라미터는 map형태로 되어있으므로 map에 파라미터를 넣어주기
		Map<String, Object> map = oAuth2User.getAttributes();

		// map의 key값만 모아와서 Set에 넣어줌
		Set<String> s = map.keySet();

		Iterator<String> it = s.iterator();

		while (it.hasNext()) {
			// key값들을 name변수에 넣은 후
			String name = it.next();
			// key값과 그 key값의 value값을 같이 log로 출력하기
			log.info(name + " : " + map.get(name));
		}

		/////////////////////////////////////////////////////

		String email = "";

		// 구글로그인인지 확인 후
		if (clientName.equals("Google")) {
			// 로그인 한 이메일을 가져와서 변수에 넣어주기
			email = oAuth2User.getAttribute("email");

			// 네이버 로그인인지 확인 후
		} else if (clientName.equals("Naver")) {
			Map<String, Object> map2 = (Map<String, Object>) oAuth2User.getAttributes().get("response");
			log.info("map2: " + map2);
			email = (String) map2.get("email");

			// 카카오 로그인인지 확인
		} else if (clientName.equals("Kakao")) {
			// log찍어보면 kakao account map객체 안에 profile map객체에 우리가 원하는 정보 들어있으므로 가져오기
			Map<String, Object> map3 = (Map<String, Object>) oAuth2User.getAttributes().get("kakao_account");
			Map<String, Object> map4 = (Map<String, Object>) map3.get("profile");

			email = (String) map3.get("email");

			log.info("email: " + email);
		}
		
		

		return super.loadUser(userRequest);
	}
}
