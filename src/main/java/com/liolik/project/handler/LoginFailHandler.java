package com.liolik.project.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

public class LoginFailHandler implements AuthenticationFailureHandler {

    private String defaultUrlFail;

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		// 사용자가 입력한 IdValue 받아와서 로그인 input창에 다시 띄워줌
		String error = "";
		
		// exception 종류 확인해서 메시지 request로 전달
		if(exception instanceof BadCredentialsException) {
			error = "유효하지 않은 아이디 또는 비밀번호입니다.";
        }
		else if(exception instanceof DisabledException) {
			error = "인증되지 않은 계정입니다.";
		}
		else {
			error = "알 수 없는 오류";
		}
		
		request.setAttribute("errormsg", error);
		
		request.getRequestDispatcher(defaultUrlFail).forward(request, response);
	}
	
	public String getDefaultUrlFail() {
		return defaultUrlFail;
	}

	public void setDefaultUrlFail(String defaultUrlFail) {
		this.defaultUrlFail = defaultUrlFail;
	}

}
