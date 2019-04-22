package com.kewei.Controller;

import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.support.StaticApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kewei.DAO.MainDao;
import com.kewei.DAO.SpecificDao;
import com.kewei.Pojo.User;

@Controller
public class QueryController {
	private static MainDao mainDao;
	private static SpecificDao specificDao;

	@RequestMapping(value = "save.htm", method = RequestMethod.POST)
	public ModelAndView saveHistory(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (this.mainDao == null) {
			this.mainDao = new MainDao();
		}
		
		System.out.println("save.htm has been catched");

//		

		HttpSession session = request.getSession();

		String statement = request.getParameter("statement");


		if (session.getAttribute("historys") == null) {
			session.setAttribute("historys", new ArrayList<ArrayList<String>>());
		}
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		String date = simpleDateFormat.format(new Date());
//		System.out.println(date);

		ArrayList<ArrayList<String>> historys = (ArrayList<ArrayList<String>>) session.getAttribute("historys");
		ArrayList<String> history = new ArrayList<String>();
		history.add(date);
		history.add(statement);
		
		
		historys.add(0,history);
		
		return new ModelAndView("UserHome");


	}
	
	
	@RequestMapping(value = "run.htm", method = RequestMethod.POST)
	public ModelAndView runQuery(HttpServletRequest request, HttpServletResponse response) throws Exception {

		
		HttpSession session = request.getSession();
		
		String database = request.getParameter("database");
		if(session.getAttribute("user") == null) {
			return  new ModelAndView("home");
		}
		User user = (User)session.getAttribute("user") ;
		
		
		
		try {
			this.specificDao = new SpecificDao(user.getUser_name(), user.getUser_password(), database);
			ArrayList<ArrayList<Object>> resultsArrayList = this.specificDao.doQuery(request.getParameter("statement"));
			System.out.println("!!!!!!!!!!!!results:" +resultsArrayList.size());
			
			return new ModelAndView("UserHome","results",resultsArrayList);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return new ModelAndView("UserHome","errorMessage",e.getMessage());
		}
		

	}

}
