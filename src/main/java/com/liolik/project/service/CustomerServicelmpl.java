package com.liolik.project.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liolik.project.dto.CustomerDto;
import com.liolik.project.dto.EmployeeDto;
import com.liolik.project.dto.PagingDto;
import com.liolik.project.mapper.CustomerMapper;
import com.liolik.project.module.getApiDateModule;
import com.liolik.project.module.pagingModule;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class CustomerServicelmpl implements CustomerService {
	
	@Setter(onMethod_ = @Autowired)
	private CustomerMapper mapper;	
	
	@Override
	public List<CustomerDto> getListCustomer(){
		return mapper.getListCustomer();
	}
	
	@Override
	public void writeCustomer(CustomerDto cdto) {
		mapper.writeCustomer(cdto);
	}

	@Override
	public List<EmployeeDto>getListEmployee() { // 영업담당자 select창을 위해 Employee를 get
		return mapper.getListEmployee(); 
	}
	
	@Override
	public CustomerDto readCustomer(String customerCode) {
		return mapper.readCustomer(customerCode);
	}
	
	@Override
	public void deleteCustomer(String customerCode) {
		mapper.deleteCustomer(customerCode);
	}
	
	@Override
	public void editCustomer(CustomerDto cdto) {
		mapper.editCustomer(cdto);
	}
	
	@Override
	public void setListCustomer(List<CustomerDto> cdto) {
		for(CustomerDto c : cdto) {
			mapper.setListCustomer(c);
		}
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
	public List<CustomerDto> getCustomerApiData(String sido, String sigungu, String name){
		List<CustomerDto> cList = new ArrayList<>();
		getApiDateModule apiMd = new getApiDateModule();
		
		String search = apiMd.endodingSearch(sido, sigungu, name);
		cList = apiMd.getApiDataList(search);
		
		return cList;
	}
	
	@Override
	public String urlApiData(String sido, String sigungu, String name){
		
		String searchUrl = "sido="+sido+"&sigungu="+sigungu+"&name="+name;
		
		return searchUrl;
	}
}
