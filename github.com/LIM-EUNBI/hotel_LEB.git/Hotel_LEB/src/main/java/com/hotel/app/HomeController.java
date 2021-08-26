package com.hotel.app;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping("/login")
	public String goLoing() {
		return "login";
	}
	
	@RequestMapping(value="/viewinfo", method=RequestMethod.POST)
	public String viewInfo(HttpServletRequest hsr, Model model) {
		String userid = hsr.getParameter("userid");
		String userpw = hsr.getParameter("userpw");
		model.addAttribute("userid", userid);
		model.addAttribute("userpw", userpw);
		return "viewinfo";
	}
	@RequestMapping("/home")
	public String goHome() {
		return "home";
	}
	@RequestMapping("/newbie")
	public String goJoin() {
		return "newbie";
	}
	@RequestMapping(value="/newinfo", method=RequestMethod.POST)
	public String newinfo(@ModelAttribute("pl") ParamList pl) {
		return "newinfo";
	}
}
