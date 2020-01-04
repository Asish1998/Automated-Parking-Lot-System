package com.myproject.myapp.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.myproject.myapp.models.UserInfo;

@Controller
public class DirectionController {
	
	@RequestMapping(value = "/direction", method = RequestMethod.GET)
	public String getdirection(HttpServletRequest request,Model model,HttpSession session) {
		if (StringUtils.isEmpty(session.getAttribute("activeuser"))) {
			return "login";		
			}
		return null;

}
	
	@RequestMapping(value = "/direction", method = RequestMethod.POST)
	public String loginuser(@ModelAttribute UserInfo l, Model model, HttpSession session)  {
		
	
		return "login";
		
	}
	
}
