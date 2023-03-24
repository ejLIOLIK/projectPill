package com.liolik.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.liolik.project.ApiExplorer;
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
	public void getListCustomer(Model model,
			@RequestParam(value = "curPage", required = false)Integer curPage,
			@RequestParam(value = "curPageBlock", required = false)Integer curPageBlock) {	
		
		model.addAttribute("list", service.getListCustomer());
		model.addAttribute("employee", service.getListEmployee());
		model.addAttribute("page", service.settingPage(curPage, curPageBlock));
	}
	
	@GetMapping("/writeCustomer")
	public void writeCustomer(Model model) {	
		model.addAttribute("list", service.getListEmployee()); // �쁺�뾽�떞�떦�옄 select李쎌쓣 �쐞�빐 Employee瑜� get
	}
	
	@PostMapping("/writeCustomer")
	public String writeCustomer(CustomerDto cdto) {	
		service.writeCustomer(cdto); 
		return "redirect:/customer/getListCustomer";
	}

	@PostMapping("/editCustomer")
	public String editCustomer(CustomerDto cdto) {	
		service.editCustomer(cdto); 
		return "redirect:/customer/getListCustomer";
	}
	
	@GetMapping("/readCustomer")
	public void readCustomer(@RequestParam("customerCode") String customerCode, Model model) {
		model.addAttribute("read", service.readCustomer(customerCode));
	}

	@GetMapping("/editCustomer")
	public void editCustomer(@RequestParam("customerCode") String customerCode, Model model) {
		model.addAttribute("read", service.readCustomer(customerCode));
		model.addAttribute("list", service.getListEmployee()); // �쁺�뾽�떞�떦�옄 select李쎌쓣 �쐞�빐 Employee瑜� get
	}
	
	@GetMapping("/deleteCustomer")
	public String deleteCustomer(@RequestParam("customerCode") String customerCode) {
		service.deleteCustomer(customerCode);
		return "redirect:/customer/getListCustomer";
	}
	
	@GetMapping("/setListCustomer")
	public String setListCustomer() {
		service.setListCustomer(ApiExplorer.getAPIData());
		return "redirect:/customer/getListCustomer";
	}

	@GetMapping("/getCustomerApiData")
	public void getCustomerApiData(Model model,
			@RequestParam(value = "sido", required = false)String sido,
			@RequestParam(value = "sigungu", required = false)String sigungu,
			@RequestParam(value = "name", required = false)String name) {
		model.addAttribute("list", service.getCustomerApiData(sido, sigungu, name));
	}
	
}
