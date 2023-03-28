package com.liolik.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liolik.project.dto.AccountDto;
import com.liolik.project.dto.PagingDto;
import com.liolik.project.dto.PillDto;
import com.liolik.project.dto.ProductDto;
import com.liolik.project.mapper.ProductMapper;
import com.liolik.project.module.pagingModule;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class ProductServiceImpl implements ProductService {
	
	@Setter(onMethod_ = @Autowired)
	private ProductMapper mapper;	
	
	@Override
	public List<ProductDto> getListProduct(){
		return mapper.getListProduct();
	}
	
	@Override
	public ProductDto readProduct(String productCode) {
		return mapper.readProduct(productCode);
	}
	
	@Override
	public List<ProductDto> getListSamePill(String productCode){
		return mapper.getListSamePill(productCode);
	}
	
	@Override
	public void deleteProduct(String productCode) {
		mapper.deleteProduct(productCode);
	}
	
	@Override
	public void editProduct(ProductDto pdto) {
		mapper.editProduct(pdto);
	}
	
	@Override
	public List<PillDto> getProductName(String productName){
		return mapper.getProductName(productName);
	}
	
	@Override
	public void writeProduct(ProductDto pdto) {
		mapper.writeProduct(pdto);
	}
	
	@Override
	public String getPillPrice(String productCode) {
		return mapper.getPillPrice(productCode);
	}
	
	@Override
	public PagingDto settingPage(Integer curPage, Integer curPageBlock) {
		if(curPage==null) { curPage = 1;}
		if(curPageBlock==null) { curPageBlock = 1;}
		
		PagingDto pdto = new PagingDto(mapper.getListCount(), curPage, curPageBlock);
		
		pdto.setTotalPage(pagingModule.setTotalPage(pdto.getTotalData()));
		pdto.setTotalPageBlock(pagingModule.setTotalPageBlock(pdto.getTotalPage()));
		
		return pagingModule.setPaging(pdto);
	}
	
	@Override
	public PagingDto settingPage(Integer curPage, Integer curPageBlock, String productName) {

		if(curPage==null) { curPage = 1;}
		if(curPageBlock==null) { curPageBlock = 1;}

		PagingDto pdto = new PagingDto(mapper.getPillListCount(productName), curPage, curPageBlock);

		pdto.setTotalPage(pagingModule.setTotalPage(pdto.getTotalData()));
		pdto.setTotalPageBlock(pagingModule.setTotalPageBlock(pdto.getTotalPage()));
		
		return pagingModule.setPaging(pdto);
	}
	
	@Override
	public void stockUpdate(AccountDto dto) {
		if("매입".equals(dto.getSTATE())) {
			mapper.stockUpdatePlus(dto);
		}
		else if("매출".equals(dto.getSTATE())) {
			mapper.stockUpdateMinus(dto);
		}
	}
	
}
