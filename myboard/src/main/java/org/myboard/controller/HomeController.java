package org.myboard.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "index";
	}
	
	@RequestMapping(value = "/test")
	public String test(){
		return "test";
	}
	
	@RequestMapping(value = "/map")
	public ModelAndView map(){
		ModelAndView mv = new ModelAndView("/maps/map");
		return mv;
	}
	
}
