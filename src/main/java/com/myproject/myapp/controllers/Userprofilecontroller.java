package com.myproject.myapp.controllers;

import javax.servlet.http.HttpSession;


import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.myproject.myapp.models.User;

@Controller
public class Userprofilecontroller {
	

	
	@RequestMapping(value="/userprofile",method=RequestMethod.GET)
	public String get(HttpSession session) {

		if (StringUtils.isEmpty(session.getAttribute("activeuser"))) {
			return "login";		
			}
		
		return "profile";
	}
	
	
	@RequestMapping(value="/userprofile",method=RequestMethod.POST)
	public String signup(@ModelAttribute User u,HttpSession session){

		
		return"profile";
	} 
}
