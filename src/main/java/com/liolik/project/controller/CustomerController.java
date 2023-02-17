package com.liolik.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.liolik.project.dto.CustomerDto;
import com.liolik.project.service.CustomerService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/customer/*")	
@AllArgsConstructor	
@Controller
public class CustomerController {
	
	private CustomerService service;
	
	@GetMapping("/getListCustomer")
	public void getListCustomer(Model model) {	
		model.addAttribute("list", service.getListCustomer());
	}
	
	@GetMapping("/writeCustomer")
	public void writeCustomer(Model model) {	
		model.addAttribute("list", service.getListEmployee());
	}
	
	@PostMapping("/writeCustomer")
	public String writeCustomer(CustomerDto cdto) {	
		service.writeCustomer(cdto);
		return "redirect:/customer/getListCustomer";
	}
}
