package com.liolik.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.liolik.project.dto.EmployeeDto;
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
	public void getListEmployee(Model model) {	
		model.addAttribute("list", service.getListEmployee());
	}

	@GetMapping({"/readEmployee", "/editEmployee"})
	public void readEmployee(@RequestParam("employeeCode") String employeeCode, Model model) {	
		model.addAttribute("read", service.readEmployee(employeeCode));
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
