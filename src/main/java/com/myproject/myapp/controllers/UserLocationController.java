package com.myproject.myapp.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.myproject.myapp.daos.userdaos;
import com.myproject.myapp.models.User;
import com.myproject.myapp.models.UserInfo;


@Controller
public class UserLocationController {

	@Autowired
	private userdaos sdao;
	
	@RequestMapping(value = "/addlocation", method = RequestMethod.GET)
	public String saveLocation(HttpServletRequest request,Model model,HttpSession session) {
		if (StringUtils.isEmpty(session.getAttribute("activeuser"))) {
			return "login";		
			}
		
		User u = (User) session.getAttribute("user");
		
		UserInfo uf = sdao.getById(u.getId());
		session.setAttribute("userinfo", uf);

		double lat = Double.parseDouble(request.getParameter("lat"));
		double lang = Double.parseDouble(request.getParameter("long"));
		
		UserInfo location = new UserInfo();
		
		if(uf != null && uf.getId() != 0) {

			location.setId(uf.getId());
		}
		
		if(uf != null && uf.getAddress()!=null) {
			
			location.setAddress(uf.getAddress());
			location.setFname(uf.getFname());
			location.setLname(uf.getLname());
			location.setPhone(uf.getPhone());
			location.setE_time(uf.getE_time());
			location.setD_time(uf.getD_time());
			location.setTotalFee(uf.getTotalFee());
			location.setPname(uf.getPname());
		}
		
		location.setLatitude(lat);
		location.setLongitude(lang);
		location.setUser(u);
		
		model.addAttribute("lat",location.getLatitude());
		model.addAttribute("lat",location.getLongitude());

		sdao.updateInfo(location);
		
		UserInfo uf1 = sdao.getById(u.getId());
		session.setAttribute("userinfo", uf1);
	
		return "map";
	}
	
	@RequestMapping(value = "/addlocation", method = RequestMethod.POST)
	public String loginuser(@ModelAttribute UserInfo l, Model model, HttpSession session)  {
		
	
		return "login";
		
	}

}
