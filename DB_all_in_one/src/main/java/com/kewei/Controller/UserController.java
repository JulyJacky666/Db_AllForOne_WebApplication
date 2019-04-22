package com.kewei.Controller;

import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kewei.DAO.MainDao;
import com.kewei.DAO.SpecificDao;
import com.kewei.Pojo.User;

@Controller

public class UserController {
		private static MainDao mainDao;
		private SpecificDao specificDao;
	
	
	@RequestMapping(value = "login.htm", method = RequestMethod.POST)
	public ModelAndView login(  HttpServletRequest request,HttpServletResponse response) throws Exception   {
		if(this.mainDao == null) {
			 this.mainDao = new MainDao();
		}
		
		if (request.getSession().getAttribute("user") != null) {
			return new ModelAndView("UserHome");
		}
		
//		int userId = Integer.parseInt(request.getParameter("userId"));
		String usernameString = request.getParameter("user_name");
		String userpasswordString = request.getParameter("user_password");
		
		User user = mainDao.authenticateLogin(usernameString, userpasswordString);
		 
		 if(user == null) {
			 return new ModelAndView("error");
		 }
		 
		 
		 String database = request.getParameter("database");
		 String hosturl = request.getParameter("hosturl");
		 HttpSession session= request.getSession();
		 
		 session.setAttribute("user", user);
		 
		 session.setAttribute("database", database);
		 session.setAttribute("hosturl", hosturl);
		 
		 System.out.print("all set");
		 ArrayList<String> dbs = mainDao.getDbs();
		 session.setAttribute("dbs", dbs);
		 
		return new ModelAndView("UserHome");
	}
	
	
	
	@RequestMapping(value = "userHome.htm") 
		
		public ModelAndView returnHome( @RequestParam(value= "statement")  String statement,HttpServletRequest request) {
			if(this.mainDao == null) {
				 this.mainDao = new MainDao();
			}
			
			if (request.getSession().getAttribute("user") == null) {
				return new ModelAndView("home");
			}

			return new ModelAndView("UserHome","statement",statement);

	}
	
	
	
	
	@RequestMapping(value = "userHome.htm", method = RequestMethod.GET) 
	
	public ModelAndView returnHome(  HttpServletRequest request,HttpServletResponse response) {
		if(this.mainDao == null) {
			 this.mainDao = new MainDao();
		}
		
		if (request.getSession().getAttribute("user") == null) {
			return new ModelAndView("home");
		}
		
		 

		 
		return new ModelAndView("UserHome");
	
	
}

	
	
	@RequestMapping(value = "logout.htm", method = RequestMethod.GET)
	public String logout(  HttpServletRequest request,HttpServletResponse response) throws Exception   {
		
//		int userId = Integer.parseInt(request.getParameter("userId"));
	
		 HttpSession session= request.getSession();
		 if (session.getAttribute("user") != null) {
			 session.invalidate();
		 }
	
		 
		return  "home";
	}
	
	@RequestMapping(value = "history.htm",method = RequestMethod.GET)
	public String goHistory(  HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		return "history";
	}
	
	
	
	
	
	
	@RequestMapping(value = "registeruser.htm", method = RequestMethod.GET)
	public ModelAndView toregister(  HttpServletRequest request,HttpServletResponse response) throws Exception   {
		if(this.mainDao == null) {
			 this.mainDao = new MainDao();
		}
		
		ArrayList<String> dbs = mainDao.getDbs();
		
//		int userId = Integer.parseInt(request.getParameter("userId"));
	
		 HttpSession session= request.getSession();
		 
		 session.setAttribute("dbs", dbs);
		 
		ArrayList<String> users = mainDao.getUsers();
			
		return  new ModelAndView("RegisterUser","users",users);	
	
}
	
	
	@RequestMapping(value = "registeruser.htm", method = RequestMethod.POST)
	public ModelAndView doregister(  HttpServletRequest request,HttpServletResponse response) throws Exception   {
		if(this.mainDao == null) {
			 this.mainDao = new MainDao();
		}
		String user_name = request.getParameter("user_name");
		String user_password = request.getParameter("user_password");
		
		String[] skills = request.getParameterValues("Privileges");
		String skillString ="";
		for(String s:skills) {
			skillString = skillString+ "," + s ;
		} 

		
		try {
			int i = this.mainDao.registerUser(skillString, user_name, user_password);
		} catch (Exception e) {
			// TODO: handle exception
			
			String message = e.getMessage();
			return new ModelAndView("error","message",message);			
		}
		ArrayList<String> users = mainDao.getUsers();
		
		return  new ModelAndView("RegisterUser","users",users);	
}
	

}
