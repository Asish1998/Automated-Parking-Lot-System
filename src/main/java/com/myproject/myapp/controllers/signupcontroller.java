package com.myproject.myapp.controllers;



import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.myproject.myapp.daos.userdaos;
import com.myproject.myapp.models.User;

@Controller
public class signupcontroller {

	
	private static final Logger logger = LoggerFactory.getLogger(logincontroller.class);

	
	@Autowired
	private userdaos udaos;
	
	
	
	@RequestMapping(value="/usersignup",method=RequestMethod.GET)
	public String get() {
		
		
	
		
		return "signup";
	}
	
	
	@RequestMapping(value="/usersignup",method=RequestMethod.POST)
	public String signup(@ModelAttribute User u,Model model){
		
		
		if (udaos.isExist(u.getUid())) {

			
			model.addAttribute("error", "Username already exist!!");

			return "signup";
		} else {
			
			logger.info("signup success!!");
			udaos.userSignup(u);
			return "login";
		}
	}
}

