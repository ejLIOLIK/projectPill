package com.liolik.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	public void account(Model model, @RequestParam(value = "viewDate", required = false)String viewDate) {
		model.addAttribute("customerList", cusService.getListCustomer());
		model.addAttribute("productList", proService.getListProduct());
		model.addAttribute("list", service.getListAccount(viewDate));
		model.addAttribute("viewDate", service.getToday(viewDate));

	}
	
	@GetMapping("/write")
	public String account(AccountDto dto) {
		proService.stockUpdate(dto);
		service.writeAccount(dto);
		
		return "redirect:/account/account";
	}
}
