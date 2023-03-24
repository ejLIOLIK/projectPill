package com.liolik.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.liolik.project.service.CustomerService;
import com.liolik.project.service.ProductService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/account/*")	
@AllArgsConstructor	
@Controller
public class AccountController {
	
	private CustomerService cusService;
	private ProductService proService;
	
	@GetMapping("/account")
	public void account(Model model) {	
		// 거래처
		model.addAttribute("customerList", cusService.getListCustomer());
		model.addAttribute("productList", proService.getListProduct());
		// 제품
	}
}
