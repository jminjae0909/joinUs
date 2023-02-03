package kr.co.joinus.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class StoreDTO {
	private int store_number;
	private String store_items;
	private int store_price ;
	private int store_hits ;
	private String store_contents;
	private String store_date;
	private String store_image;
	private int store_category;
}
