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

import com.myproject.myapp.daos.ParkingLotInfodaos;
import com.myproject.myapp.daos.userdaos;
import com.myproject.myapp.models.ParkingLotInfo;
import com.myproject.myapp.models.User;
import com.myproject.myapp.models.UserInfo;

@Controller
public class BookingController {

	@Autowired
	private ParkingLotInfodaos parkDao;
	
	@Autowired
	private userdaos udao;
	
	@RequestMapping(value="/userbook",method=RequestMethod.GET)
	public String get(HttpServletRequest request,Model model,HttpSession session) {
		if (StringUtils.isEmpty(session.getAttribute("activeuser"))) {
			return "index";		
			}
		 String pname = 	request.getParameter("parkingname");
		//  System.out.println("pname="+pname);
		  
		 ParkingLotInfo parkingModel= parkDao.getParkingDetails(pname);
	
	//	  System.out.println("pname ="+parkingModel.getName());
	//	  System.out.println("Lat =="+parkingModel.getP_latitude());
		  
			
		  model.addAttribute("parkModel", parkingModel);

		return "booking";
	}
	
	@RequestMapping(value = "/userbook", method = RequestMethod.POST)
	public String login(HttpServletRequest request,@ModelAttribute UserInfo u, HttpSession session,Model model) {
		
		 String pname = 	request.getParameter("parkingname");
			//  System.out.println("pname="+pname);
			  
	 ParkingLotInfo parkingModel= parkDao.getParkingDetails(pname);
			  
			 
		//	  System.out.println("pname ="+parkingModel.getName());
		//	  System.out.println("Lat =="+parkingModel.getP_latitude());
			  
				
			
			  
		
	
		UserInfo  uf =  (UserInfo)session.getAttribute("userinfo");
		u.setId(uf.getId());
		u.setLongitude(uf.getLongitude());
		u.setLatitude(uf.getLatitude());
		
		//User  user = new User();
		//user.setId(uf.getUser().getId());
		u.setUser((User)session.getAttribute("user"));
		
		
		String[] Etime = u.getE_time().split(":");
		 long totalEtime = Long.valueOf(Etime[0])*60 + Long.valueOf(Etime[1]);
		 
		 String[]   DTime = u.getD_time().split(":");
		 long totalDtime = Long.valueOf(DTime[0])*60 + Long.valueOf(DTime[1]);
		 
		 long actualParkingTime = totalDtime - totalEtime;
		 long totalFee = actualParkingTime * 1;
		 
		 u.setTotalFee(totalFee);	
	//	 u.setPname(parkingModel.getName());
		if(udao.timevalid(u.getE_time())) {
			
			model.addAttribute("occupied", "Space Already booked !!");
			return "booking";
		}else
		{
			model.addAttribute("fee", totalFee);
			udao.updateInfo(u);
			return "payment";
		}	
	}
	
	
}
