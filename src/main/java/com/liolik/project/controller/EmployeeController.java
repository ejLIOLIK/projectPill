package com.liolik.project.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.liolik.project.dto.CustomerDto;
import com.liolik.project.dto.EmployeeDto;
import com.liolik.project.dto.PagingDto;
import com.liolik.project.module.pagingModule;
import com.liolik.project.service.EmployeeService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/employee/*")	
@AllArgsConstructor	
@Controller
public class EmployeeController {

	private EmployeeService service;
	
	@GetMapping("/getListEmployee")
	public void getListEmployee(Model model,
			@RequestParam(value = "curPage", required = false)Integer curPage,
			@RequestParam(value = "curPageBlock", required = false)Integer curPageBlock) {	
		
		if(curPage==null) { curPage = 1;}
		if(curPageBlock==null) { curPageBlock = 1;}
		
		/* 총데이터수, 현재페이지, 현재페이지블럭 */
		PagingDto pdto = new PagingDto(service.getListCount(), curPage, curPageBlock);
		
		/* 페이지수, 페이지블럭수 */
		pdto.setTotalPage(pagingModule.setTotalPage(pdto.getTotalData()));
		pdto.setTotalPageBlock(pagingModule.setTotalPageBlock(pdto.getTotalPage()));
		
		model.addAttribute("list", service.getListEmployee());
		model.addAttribute("page", pagingModule.setPaging(pdto));
	}

	@GetMapping({"/readEmployee", "/editEmployee"})
	public void readEmployee(@RequestParam("employeeCode") String employeeCode, Model model,
			@RequestParam(value = "curPage", required = false)Integer curPage,
			@RequestParam(value = "curPageBlock", required = false)Integer curPageBlock) {	
		model.addAttribute("read", service.readEmployee(employeeCode));
		
		/* 영업팀 경우*/
		if(service.readEmployee(employeeCode).getETEAM().equals("영업팀")) { 
			model.addAttribute("list", service.salesEmployee(employeeCode)); 
			
		}
	}

	@GetMapping("/deleteEmployee")
	public String deleteEmployee(@RequestParam("employeeCode") String employeeCode) {
		service.deleteEmployee(employeeCode);
		return "redirect:/employee/getListEmployee";
	}
	
	@PostMapping("/writeEmployee")
	public String writeEmployee(EmployeeDto edto) {
		service.writeEmployee(edto);
		return "redirect:/employee/getListEmployee";
	}
	
	@GetMapping("/writeEmployee")
	public void writeEmployee()
	{}
	
	@PostMapping("/editEmployee")
	public String editEmployee(EmployeeDto edto){
		service.editEmployee(edto);
		return "redirect:/employee/getListEmployee";
	}
}
