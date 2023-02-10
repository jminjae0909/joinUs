package kr.co.joinus.service;

import java.io.UnsupportedEncodingException;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class RegisterMail implements MailServiceInter {

	@Autowired
	JavaMailSender emailSender; // MailConfig에서 등록해둔 bean을 autowired하여 사용하기

	private String ePw; // 사용자가 메일로 받을 인증번호

	// 메일 내용 작성
	@Override
	public MimeMessage creatMessage(String to) throws MessagingException, UnsupportedEncodingException {
		log.info("메일 받을 사용자: {}", to);

		MimeMessage message = emailSender.createMimeMessage();

		message.addRecipients(RecipientType.TO, to); // 메일 받을 사용자
		message.setSubject("[CODEE] 이메일 인증코드 입니다"); // 이메일 제목

		//보낼 메세지 내용 생성
		String msgg = "";
		//msgg += "<img src=../images/codee.png />"; // header image
		msgg += "<h1>안녕하세요</h1>";
		msgg += "<h1>모각코 사이트 CODEE입니다.</h1>";
		msgg += "<br>";
		msgg += "<p>아래 인증코드를 입력해주세요</p>";
		msgg += "<br>";
		msgg += "<br>";
		msgg += "<div align='center' style='border:1px solid black'>";
		msgg += "<h3 style='color:blue'>인증코드 입니다</h3>";
		msgg += "<div style='font-size:130%'>";
		msgg += "<strong>" + ePw + "</strong></div><br/>"; // 메일에 인증번호 ePw 넣기
		msgg += "</div>";
		// msgg += "<img src=../resources/static/image/emailfooter.jpg />"; // footer
		// image

		message.setText(msgg, "utf-8", "html"); // 메일 내용, charset타입, subtype
		// 보내는 사람의 이메일 주소, 보내는 사람 이름
		message.setFrom(new InternetAddress("test230206@naver.com", "codee_Admin"));

		//creatMessage 함수에서 생성된 메세지 리턴
		return message;
	}

	// 랜덤 인증코드 생성
	@Override
	public String createKey() {
		StringBuffer key = new StringBuffer();
		Random rnd = new Random();

		for (int i = 0; i < 8; i++) { // 인증코드 8자리
			int index = rnd.nextInt(3); // 0~2 까지 랜덤, rnd 값에 따라서 아래 switch 문이 실행됨

			switch (index) {
			case 0:
				key.append((char) ((int) (rnd.nextInt(26)) + 97));
				// a~z (ex. 1+97=98 => (char)98 = 'b')
				break;
			case 1:
				key.append((char) ((int) (rnd.nextInt(26)) + 65));
				// A~Z
				break;
			case 2:
				key.append((rnd.nextInt(10)));
				// 0~9
				break;
			}
		}

		return key.toString();
	}

	// 메일 발송
	// sendSimpleMessage 의 매개변수 to는 이메일 주소가 되고,
	// MimeMessage 객체 안에 내가 전송할 메일의 내용을 담는다
	// bean으로 등록해둔 javaMail 객체를 사용하여 이메일을 발송한다
	@Override
	public String sendSimpleMessage(String to) throws Exception {

		ePw = createKey(); // 랜덤 인증코드 생성
		log.info("생성된 인증번호: {}", ePw);

		MimeMessage message = creatMessage(to); // "to" 로 메일 발송

		// 예외처리
		try {
			emailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
			throw new IllegalArgumentException();
		}

		return ePw; // 메일로 사용자에게 보낸 인증코드를 서버로 반환! 인증코드 일치여부를 확인하기 위함
	}

}
