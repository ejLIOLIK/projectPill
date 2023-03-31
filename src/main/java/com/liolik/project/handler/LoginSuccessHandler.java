package com.liolik.project.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

public class LoginSuccessHandler implements AuthenticationSuccessHandler {

    private String defaultUrl;

	private RequestCache requestCache = new HttpSessionRequestCache();
	private RedirectStrategy redirectStratgy = new DefaultRedirectStrategy();
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		// TODO Auto-generated method stub
		//에러 세션 삭제
		clearAuthenticationAttributes(request);
		//Redirect URL 
		resultRedirectStrategy(request, response, authentication);
	}
	
	protected void resultRedirectStrategy(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException {

		SavedRequest savedRequest = requestCache.getRequest(request, response);
		
		if(savedRequest!=null) {
			//권한이 필요한 페이지 접근 시 
			useSessionUrl(request, response);
		} else {
			//직접 로그인 url로 이동, 이전 페이지로 다시 이동시킴
			useDefaultUrl(request, response);
		}
	}
	
	protected void useSessionUrl(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 이전 페이지로 다시 이동시킴
		SavedRequest savedRequest = requestCache.getRequest(request, response);
		String targetUrl = savedRequest.getRedirectUrl(); 
		redirectStratgy.sendRedirect(request, response, targetUrl);
	}
	
	protected void useDefaultUrl(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 미리 지정한 defaultUrl로 이동시킴
		redirectStratgy.sendRedirect(request, response, defaultUrl); 
	}

	protected void clearAuthenticationAttributes(HttpServletRequest request) {
		//에러 세션 삭제
		HttpSession session = request.getSession(false);
		if(session==null) return;
		session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
	}
    
    public String getDefaultUrl() {
		return defaultUrl;
	}

	public void setDefaultUrl(String defaultUrl) {
		this.defaultUrl = defaultUrl;
	}

}
