package kr.co.joinus.dto;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AttendanceDTO {
	
	private int attendance_number;
	private String users_id;
	private String attendance_date;
	

}
