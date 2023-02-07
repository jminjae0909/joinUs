package kr.co.joinus.dto;

import java.util.Map;

import org.springframework.web.bind.annotation.RequestMethod;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MessageDTO {

	private String message; //사용자에게 전달할 메세지
	private String redirectUri; //리다이렉트 uri
	private RequestMethod method; //http요청 메서드
	private Map<String, Object> data; //화면(view)으로 전달할 데이터(파라미터)
}
