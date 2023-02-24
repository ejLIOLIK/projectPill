package com.liolik.project.dto;
import lombok.Data;

@Data
public class ProductDto {
	
	private String PILLCODE;
	private String PCODE;
	private String PNAME;
	private String CAPACITY;
	private String AMOUNT;
	private int PRICE;
    private int STOCK;
}
