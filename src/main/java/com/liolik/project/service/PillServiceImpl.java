package com.liolik.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liolik.project.dto.PillDto;
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
	public void writePill(PillDto pdto) {
		mapper.writePill(pdto);
	}
	
	@Override
	public void deletePill(String pillCode) {
		mapper.deletePill(pillCode);
	}
	
	@Override
	public void editPill(PillDto pdto) {
		mapper.editPill(pdto);
	}
	
	@Override
	public void NameSetProduct(String PILLCODE) {
		mapper.NameSetProduct(PILLCODE);
	}
	
}
