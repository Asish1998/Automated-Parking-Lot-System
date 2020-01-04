package com.myproject.myapp.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.myproject.myapp.daos.userdaos;
import com.myproject.myapp.models.User;
import com.myproject.myapp.models.UserInfo;


@Controller
public class homecontroller {
		
	@Autowired
	private userdaos sdao;
	
	@RequestMapping(value="/userhome",method=RequestMethod.GET)
	public String get(HttpSession session,Model model) {

		if (StringUtils.isEmpty(session.getAttribute("activeuser"))) {
			return "index";		
			}
		User u = (User) session.getAttribute("user");
		UserInfo uf = sdao.getById(u.getId());
		
		List<UserInfo>   ulist = new ArrayList<UserInfo>();
		ulist.add(uf);
		
		model.addAttribute("ulist",ulist);
	// System.out.println("name="+uf.getFname());
		

		return "home";
	}
}
