package org.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/ddarawazoom")
public class ErrorController {
	
	@RequestMapping("/error400")
	public String error400() {
		return "/error/error400";
	}
	
	@RequestMapping("/error403")
	public String error403() {
		return "/error/error403";
	}
	
	@RequestMapping("/error404")
	public String error404() {
		return "/error/error404";
	}
	
	@RequestMapping("/error405")
	public String error405() {
		return "/error/error405";
	}
	
	@RequestMapping("/error500")
	public String error500() {
		return "/error/error500";
	}
	
	@RequestMapping("/error503")
	public String error503() {
		return "/error/error503";
	}
	
	
}