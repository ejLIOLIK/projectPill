package com.liolik.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.liolik.project.dto.PillDto;
import com.liolik.project.service.PillService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/pill/*")	
@AllArgsConstructor	
@Controller
public class PillController {
	
	private PillService service;
	
	@GetMapping("/getListPill")
	public void getListPill(@RequestParam(value = "pillCodeEdit", required = false) String pillCodeEdit, Model model) {	
		model.addAttribute("list", service.getListPill());
		model.addAttribute("pillCodeEdit", pillCodeEdit);
	}	
	
	@GetMapping({"/readPill", "/editPill"})
	public void readPill(@RequestParam("pillCode") String pillCode, Model model) {
		model.addAttribute("read", service.readPill(pillCode));
	}
	
	@GetMapping("/deletePill")
	public String deletePill(@RequestParam("pillCode") String pillCode) {
		service.deletePill(pillCode);
		return "redirect:/pill/getListPill";
	}
	
	@PostMapping("/writePill")
	public String writePill(PillDto pdto) {
		service.writePill(pdto);
		return "redirect:/pill/getListPill";
	}
	
	@PostMapping("/editPill")
	public String editPill(PillDto pdto){
		service.editPill(pdto);
		service.NameSetProduct(pdto.getPILLCODE());
		return "redirect:/pill/getListPill";
	}
	
}
