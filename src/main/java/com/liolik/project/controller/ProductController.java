package com.liolik.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.liolik.project.dto.ProductDto;
import com.liolik.project.service.ProductService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/product/*")	
@AllArgsConstructor	
@Controller
public class ProductController {
	
	private ProductService service;
	
	@GetMapping("/getListProduct")
	public void getListProduct(@RequestParam(value = "ProductCodeEdit", required = false) String productCodeEdit, Model model,
			@RequestParam(value = "curPage", required = false)Integer curPage,
			@RequestParam(value = "curPageBlock", required = false)Integer curPageBlock) {
		
		model.addAttribute("list", service.getListProduct());
		model.addAttribute("productCodeEdit", productCodeEdit);
		model.addAttribute("page", service.settingPage(curPage, curPageBlock));
		
		if(productCodeEdit!=null) {
			model.addAttribute("pillPrice", service.getPillPrice(productCodeEdit));}
	}	
	
	@GetMapping({"/readProduct","/editProduct"})
	public void readProduct(@RequestParam("productCode") String productCode, Model model) {
		model.addAttribute("read", service.readProduct(productCode));
		model.addAttribute("list", service.getListSamePill(productCode));
	}
	
	@GetMapping("/deleteProduct")
	public String deleteProduct(@RequestParam("productCode") String productCode) {
		service.deleteProduct(productCode);
		return "redirect:/product/getListProduct";
	}
	
	@PostMapping("/editProduct")
	public String editProduct(ProductDto pdto) {
		service.editProduct(pdto);
		return "redirect:/product/getListProduct";
	}
	
	@GetMapping("/getProductName")
	public void getProductName(@RequestParam(value = "productName", required = false) String productName, 
			@RequestParam(value = "blEdit", required = false) String blEdit, Model model,
			@RequestParam(value = "curPage", required = false)Integer curPage,
			@RequestParam(value = "curPageBlock", required = false)Integer curPageBlock) {
	
		model.addAttribute("list", service.getProductName(productName));
		model.addAttribute("blEdit", blEdit);
		model.addAttribute("page", service.settingPage(curPage, curPageBlock, productName));
	}
	
	@PostMapping("/writeProduct")
	public String writeProduct(ProductDto pdto) {
		service.writeProduct(pdto);
		return "redirect:/product/getListProduct";
	}
}
