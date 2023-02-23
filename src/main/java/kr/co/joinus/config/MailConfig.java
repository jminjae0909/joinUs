package kr.co.joinus.config;

import java.util.Properties;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.ConfigurationPropertiesScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

import lombok.RequiredArgsConstructor;

//Bean을 수동 등록해주는 역할을 함
//** Bean의 싱글톤 사용을 보장해줌
@Configuration
@ConfigurationPropertiesScan
@RequiredArgsConstructor
public class MailConfig {
	//메일인증에 사용할 계정을 등록하는 클래스 MailConfig
	
	//application.properties에 등록해둔 변수를 가져오기 위한 클래스를 가져옴
	//아이디와 비밀번호는 민감정보이므로 이 클래스에 직접 보이지 않도록 설정하기 위함
	@Autowired
	private final PropertiesConfig myConfig;
	
	//인증메일을 보내는 데 사용할 계정의 정보 등록
	@Bean
	JavaMailSender naverMailService() {
		
		//메일을 보내는 데 필요한 설정을 할 수 있는 여러 메서드를 가지고 있는 인터페이스
		JavaMailSenderImpl javaMailSender = new JavaMailSenderImpl();
		
		javaMailSender.setHost("smtp.naver.com"); //메인 도메인 서버 주소(smtp서버 주소)
		javaMailSender.setUsername(myConfig.getId()); //내 이메일 아이디 설정
		javaMailSender.setPassword(myConfig.getPassword()); //내 이메일 비밀번호 설정
		
		javaMailSender.setPort(465); // smtp포트
		
		javaMailSender.setJavaMailProperties(getMailProperties()); //메일 인증서버 정보 가져오기
		
		return javaMailSender;
	}
	
	//메일 인증서버 정보 가져오기
	private Properties getMailProperties() {
		Properties properties = new Properties();
		properties.setProperty("mail.transport.protocol", "smtp"); //프로토콜 설정
		properties.setProperty("mail.smtp.auth", "true"); //smtp인증
		properties.setProperty("mail.smtp.starttls.enable", "true"); //smtp starttls 사용
		properties.setProperty("mail.debug", "true"); //디버그 사용
		properties.setProperty("mail.smtp.ssl.trust", "smtp.naver.com"); //ssl인증 서버는 stmp.naver,com
		properties.setProperty("mail.smtp.ssl.enable", "true"); //ssl사용
		
		return properties;
	}

}
