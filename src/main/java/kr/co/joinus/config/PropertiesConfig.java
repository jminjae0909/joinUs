package kr.co.joinus.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.context.properties.ConstructorBinding;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@ConfigurationProperties("email")
@ConstructorBinding
@Getter
@RequiredArgsConstructor
public class PropertiesConfig {
	
	//application.properties에 써둔 민감정보 가져옴
	
	//@ConfigurationProperties 어노테이션이 핵심입니다. 
	//application.properties 파일에서 키 값이 "my"인 설정값을 추가했기 때문에 @ConfigurationProperties에도 키 값을 "my"로 설정해주고, 
	//@ConstructorBinding과 롬복의 @RequiredArgsConstructor를 활용해서 
	//생성자 주입방식으로 설정 값을 MyConfig 클래스에 주입 해줍니다.

	private final String id;
	private final String password;
}
