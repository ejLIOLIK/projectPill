package com.liolik.project.controller;

import java.security.KeyPair;
import java.security.PrivateKey;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.liolik.project.module.pwEncryptModule;
import com.liolik.project.service.userService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/register/*")	
@AllArgsConstructor	
@Controller
public class RegisterController {
	
	private userService service;
	
	@GetMapping({"/sign", "/login"}) // 개인키, 비밀키 생성해서 넘기기
	public void sign(HttpSession session, Model model) throws Exception {
		pwEncryptModule pwEmcrypt = new pwEncryptModule(); // RSA 객체 생성
		
		KeyPair keypair = pwEmcrypt.setKeyPair(); //키 생성
		Map<String, String> modExp = pwEmcrypt.getModExp16(keypair.getPublic());	

		session.setAttribute(pwEmcrypt.PRIVATE_KEY, keypair.getPrivate()); // 개인키 세션에 저장함
		session.setMaxInactiveInterval(-1);
		model.addAttribute(pwEmcrypt.PUBLIC_KEY_MODULUS, modExp.get(pwEmcrypt.PUBLIC_KEY_MODULUS)); // 모듈러스
		model.addAttribute(pwEmcrypt.PUBLIC_KEY_EXPONENT, modExp.get(pwEmcrypt.PUBLIC_KEY_EXPONENT)); // 지수		
	}
	
	@PostMapping("/sign")
	@ResponseBody // Ajax 사용을 위한 어노테이션
	public Map<String, Object> sign(@RequestParam Map<String, String> registerData, HttpSession session) throws Exception {
		
		Map<String, Object> result = new HashMap<>();
		pwEncryptModule pwEmcrypt = new pwEncryptModule(); // RSA 객체 생성
		
		String inputPW = pwEmcrypt.pwDecrypt(registerData.get("PW"), (PrivateKey)session.getAttribute(pwEmcrypt.PRIVATE_KEY));
		registerData.put("PW", inputPW); // PW 값을 변경
		service.sign(registerData);
		
		result.put("message", "Register success");
		return result;
	}
	
	@PostMapping("/login")
	@ResponseBody // Ajax 사용을 위한 어노테이션
	public void login(@RequestParam Map<String, String> registerData, HttpSession session) throws Exception {
		
		//세션에 담긴 개인키를 DB에 넣음
		pwEncryptModule pwEmcrypt = new pwEncryptModule();
		service.setPriKey(registerData.get("ECODE"), (PrivateKey)session.getAttribute(pwEmcrypt.PRIVATE_KEY));
	}
	
	@GetMapping("/getEmployeeCode")
	public void getEmployeeCode(@RequestParam(value = "employeeName", required = false) String employeeName, Model model,
			@RequestParam(value = "curPage", required = false)Integer curPage,
			@RequestParam(value = "curPageBlock", required = false)Integer curPageBlock) {

		model.addAttribute("list", service.getEmployeeCode(employeeName));
		model.addAttribute("page", service.settingPage(curPage, curPageBlock));
	}
}
