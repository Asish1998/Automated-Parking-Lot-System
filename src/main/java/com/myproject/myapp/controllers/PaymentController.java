package com.myproject.myapp.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
public class PaymentController {
	
	@Autowired
	private userdaos sdao;
	
	private static final Logger logger = LoggerFactory.getLogger(logincontroller.class);
	@Autowired
	private userdaos udao;
	
	@RequestMapping(value="/payment",method=RequestMethod.GET)
	public String get(HttpSession session,Model model) {

		if (StringUtils.isEmpty(session.getAttribute("activeuser"))) {
			return "index";		
			}
		
		
		return "payment";
	}
	
	@RequestMapping(value = "/payment", method = RequestMethod.POST)
	public String login(@ModelAttribute User u, HttpSession session,Model model,HttpServletRequest request) {
		
		User mu = (User) session.getAttribute("user");
		UserInfo uf = sdao.getById(mu.getId());
		if (udao.valid(u.getPhone())) {
			String to = mu.getEmail();
			String subject ="payment";
			String msg = "Dear "+u.getFname()+",\nYour Booking has sucessfully made in "+uf.getPname()+".Also,Rs."+uf.getTotalFee()+" will been detected from your account. More details is given below:-\n Parking Lot Name: "+uf.getPname()+"\nEntry time: "+uf.getE_time()+"\nDeparture time: "+uf.getD_time()+"\nTotal Cost: "+uf.getTotalFee()+"";
			//System.out.println("email-"+mu.getEmail());
			Mailer.send(to, subject, msg);
				return "direction";
		}else
		
		logger.info("signup success!!");
		model.addAttribute("error", "Phone number does not valid!!");

		return "payment";
	}	
}
