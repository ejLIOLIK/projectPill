package com.liolik.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.liolik.project.dto.AccountDto;
import com.liolik.project.service.AccountService;
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
	private AccountService service;
	
	@GetMapping("/account")
	public void account(Model model) {
		model.addAttribute("customerList", cusService.getListCustomer());
		model.addAttribute("productList", proService.getListProduct());
		model.addAttribute("list", service.getListAccount());
	}
	
	@GetMapping("/write")
	public String account(AccountDto dto) {
		proService.stockUpdate(dto);
		service.writeAccount(dto);
		
		return "redirect:/account/account";
	}
}
