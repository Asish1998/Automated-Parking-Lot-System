package com.myproject.myapp.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.myproject.myapp.daos.userdaos;
import com.myproject.myapp.models.User;

@Controller
public class logincontroller {

	@Autowired
	private userdaos udao;

	@RequestMapping(value = "/userlogin", method = RequestMethod.GET)
	public String get() {

		return "login";
	}

	@RequestMapping(value = "/userlogin", method = RequestMethod.POST)
	public String login(@ModelAttribute User u, HttpSession session,Model model) {

		
		  User user = udao.isExist(u.getUid(), u.getPassword());
		
		if (user != null) {
			session.setAttribute("activeuser", u.getUid());
			session.setAttribute("user", user);
			return "home";
		} else if ((u.getUid().equalsIgnoreCase("admin"))&&(u.getPassword().equalsIgnoreCase("admin"))) {
			
			session.setAttribute("activeuser", "admin");
			return "admin";
			
		} 
		else {
			model.addAttribute("error", "User does not found !!");
			return "login";
		}

			
	}

	@RequestMapping(value = "/userlogout", method = RequestMethod.GET)
	public String logout(HttpSession session) {

		session.invalidate();
		System.out.println("================logout===========================");

		return "login";
	}
}