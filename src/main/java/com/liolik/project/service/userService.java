package com.liolik.project.service;

import java.security.KeyFactory;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.PKCS8EncodedKeySpec;
import java.util.Base64;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.liolik.project.dto.EmployeeDto;
import com.liolik.project.dto.PagingDto;
import com.liolik.project.mapper.EmployeeMapper;
import com.liolik.project.mapper.RegisterMapper;
import com.liolik.project.module.pagingModule;

import lombok.Setter;

public class userService implements UserDetailsService {

	@Setter(onMethod_ = @Autowired)
	private RegisterMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private EmployeeMapper mapperKey;
	
	@Override
	public EmployeeDto loadUserByUsername(String username) throws UsernameNotFoundException {
		EmployeeDto edto = new EmployeeDto(); 
		edto = mapper.login(username);
		return edto;
	}
	
	public List<EmployeeDto> getEmployeeCode(String employeeName){
		if(employeeName==null) {
			return mapper.getEmployeeCode();}
		else {
			return mapper.getEmploySearch(employeeName);}
	}
	
	public void sign(Map<String, String> registerData) {
		EmployeeDto edto = new EmployeeDto();
		edto.setECODE(registerData.get("ECODE"));
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		edto.setPW(passwordEncoder.encode(registerData.get("PW"))); 
		mapper.sign(edto);
	}
	
	public PagingDto settingPage(Integer curPage, Integer curPageBlock, String employeeName) {
		PagingDto pdto;
		
		if(curPage==null) { curPage = 1;}
		if(curPageBlock==null) { curPageBlock = 1;}
		
		if(employeeName==null) {
			pdto = new PagingDto( mapper.getListCount(), curPage, curPageBlock);}
		else {
			pdto = new PagingDto( mapper.getListCountSearch(employeeName), curPage, curPageBlock);}
		
		pdto.setTotalPage(pagingModule.setTotalPage(pdto.getTotalData()));
		pdto.setTotalPageBlock(pagingModule.setTotalPageBlock(pdto.getTotalPage()));
		
		return pagingModule.setPaging(pdto);
	}
	
	//DB에 개인키 저장
	public void setPriKey(String ECODE, PrivateKey key) {
		
		EmployeeDto dto = new EmployeeDto();
		dto.setECODE(ECODE);
		
		PKCS8EncodedKeySpec keySpec = new PKCS8EncodedKeySpec(key.getEncoded());
		dto.setPRIKEY(Base64.getEncoder().encodeToString(keySpec.getEncoded()));
		mapperKey.setPriKey(dto);
	}
	
	//DB에서 개인키 리턴하고 개인키 삭제
	public PrivateKey getPriKey(String ECODE) throws NoSuchAlgorithmException, InvalidKeySpecException {
		
		String priKey = mapperKey.getPriKey(ECODE);
		byte[] prikeyDcd = Base64.getDecoder().decode(priKey);

		PKCS8EncodedKeySpec keySpec = new PKCS8EncodedKeySpec(prikeyDcd);
		KeyFactory keyFactory = KeyFactory.getInstance("RSA");
		PrivateKey key = keyFactory.generatePrivate(keySpec);
		
		// DB에서 개인키 지움
		EmployeeDto dto = new EmployeeDto();
		dto.setECODE(ECODE);
		dto.setPRIKEY("");
		mapperKey.setPriKey(dto);
		
		return key;
	}
	
}
