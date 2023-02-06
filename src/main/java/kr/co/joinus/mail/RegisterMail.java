package kr.co.joinus.mail;

import java.io.UnsupportedEncodingException;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import kr.co.joinus.service.MailServiceInter;

@Service
public class RegisterMail implements MailServiceInter {
	
	@Autowired
	JavaMailSender emailSender; //MailConfig에서 등록해둔 bean을 autowired하여 사용하기
	
	private String ePw; //사용자가 메일로 받을 인증번호

	//메일 내용 작성
	@Override
	public MimeMessage creatMessage(String to) throws MessagingException, UnsupportedEncodingException {
		System.out.println("메일받을 사용자" + to);
        System.out.println("인증번호" + ePw);

        MimeMessage message = emailSender.createMimeMessage();

        message.addRecipients(RecipientType.TO, to); // 메일 받을 사용자
        message.setSubject("[Fligent] 비밀번호 변경을 위한 이메일 인증코드 입니다"); // 이메일 제목

        String msgg = "";
        // msgg += "<img src=../resources/static/image/emailheader.jpg />"; // header image
        msgg += "<h1>안녕하세요</h1>";
        msgg += "<h1>공항정보 플랫폼 Fligent 입니다</h1>";
        msgg += "<br>";
        msgg += "<p>아래 인증코드를 암호변경 페이지에 입력해주세요</p>";
        msgg += "<br>";
        msgg += "<br>";
        msgg += "<div align='center' style='border:1px solid black'>";
        msgg += "<h3 style='color:blue'>회원가입 인증코드 입니다</h3>";
        msgg += "<div style='font-size:130%'>";
        msgg += "<strong>" + ePw + "</strong></div><br/>" ; // 메일에 인증번호 ePw 넣기
        msgg += "</div>";
        // msgg += "<img src=../resources/static/image/emailfooter.jpg />"; // footer image

        message.setText(msgg, "utf-8", "html"); // 메일 내용, charset타입, subtype
        // 보내는 사람의 이메일 주소, 보내는 사람 이름
        message.setFrom(new InternetAddress("mah95@naver.com", "Fligent_Admin"));
        System.out.println("********creatMessage 함수에서 생성된 msgg 메시지********" + msgg);
        
        System.out.println("********creatMessage 함수에서 생성된 리턴 메시지********" + message);


        return message;
	}

	@Override
	public String createKey() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String sendSimpleMessage(String to) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}
