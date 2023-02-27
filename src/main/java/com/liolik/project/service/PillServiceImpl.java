package com.liolik.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liolik.project.dto.PillDto;
import com.liolik.project.dto.ProductDto;
import com.liolik.project.mapper.PillMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
//@AllArgsConstructor
public class PillServiceImpl implements PillService{

	@Setter(onMethod_ = @Autowired)
	private PillMapper mapper;	
	
	@Override
	public List<PillDto> getListPill() {
		return mapper.getListPill();
	}

	@Override
	public PillDto readPill(String pillCode) {
		return mapper.readPill(pillCode);
	}
	
	@Override
	public List<ProductDto> getListProduct(String pillCode){
		return mapper.getListProduct(pillCode);
	}
	
	@Override
	public void writePill(PillDto pdto) {
		mapper.writePill(pdto);
	}
	
	@Override
	public void deletePill(String pillCode) {
		mapper.deletePill(pillCode);
		mapper.deleteSetProduct(pillCode); // 관련된 PRODUCT도 삭제
	}

	@Override
	public void editPill(PillDto pdto) {
		mapper.editPill(pdto);
		mapper.EditSetProduct(pdto.getPILLCODE()); // 이름, 용량 등 PILL과 PRODUCT 정보 맞춰서 수정
		mapper.EditSetProductPrice(pdto.getPILLCODE()); // 약가 당 제품 단가 계산해서 수정
	}	
}
