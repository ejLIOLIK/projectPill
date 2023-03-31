package com.liolik.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.liolik.project.dto.EmployeeDto;
import com.liolik.project.module.pwEncryptModule;

public class userProvider implements AuthenticationProvider {

	@Autowired
	private userService service;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		
		pwEncryptModule pwEmcrypt = new pwEncryptModule(); // RSA 객체 생성
		
		// 로그인 시 입력한 데이터 받아옴
		String id = (String) authentication.getPrincipal();
		String pw = (String) authentication.getCredentials();
		
		// 아이디 해당하는 데이터
		EmployeeDto dto = service.loadUserByUsername(id);
		
		try {
			pw = pwEmcrypt.pwDecrypt(pw, service.getPriKey(id));
		} catch (Exception e) {
			e.printStackTrace();
		}
				
		// 매치 메소드로 해시 + 솔트 암호화된 비밀번호 비교
		if(!passwordEncoder.matches(pw, dto.getPassword())) {
			throw new BadCredentialsException(id);
		}
		
		// 유효한 계정 확인
		if(!dto.isEnabled()) { 
			throw new DisabledException(id);
		}
		
		// 사용자 정보를 토큰으로 저장
		// 비밀번호는 보관안하고 null로 입력
		Authentication token = new UsernamePasswordAuthenticationToken(dto, null, dto.getAuthorities()); 
		return token;
	}

	@Override
	public boolean supports(Class<?> authentication) {
		// TODO Auto-generated method stub
		return true;
	}

}
