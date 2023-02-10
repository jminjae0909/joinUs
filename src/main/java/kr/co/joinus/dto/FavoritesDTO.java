package kr.co.joinus.dto;



import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class FavoritesDTO {
	private int favorites_number;
	private String users_id;
	private int meeting_number;
	private String favorites_date;
	private String meeting_title;
}
