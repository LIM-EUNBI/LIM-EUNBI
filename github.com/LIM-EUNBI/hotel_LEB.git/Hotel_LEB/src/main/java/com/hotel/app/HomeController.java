package com.hotel.app;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	private HttpSession session;
	
	@Autowired
	private SqlSession sqlSession;
	
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
	
	@RequestMapping(value="/check_user",method=RequestMethod.POST)
	public String go_room(HttpServletRequest hsr, Model model) {
		String userid = hsr.getParameter("userid");
		String userpw = hsr.getParameter("userpw");
		HttpSession session = hsr.getSession();
		session.setAttribute("loginid", userid);
		
		return "redirect:/room_management";
	}
	@RequestMapping("/room_management")
	public String goRoom(HttpServletRequest hrs, Model model) {
		HttpSession session = hrs.getSession();
		String loginid = (String)session.getAttribute("loginid");
		iRoom room = sqlSession.getMapper(iRoom.class);
		ArrayList<Roominfo> roominfo = room.getRoomList();
		ArrayList<RoomType> roomtype = room.getRoomType();
		model.addAttribute("list", roominfo);
		model.addAttribute("roomType", roomtype);
		System.out.println(roominfo);
		if(loginid.equals("ever3622")) {
			return "room_management";
		}
		else {
			return "redirect:/home";
		}
	}
	@RequestMapping("/home")
	public String goHome() {
		return "home";
	}
	@RequestMapping("/newbie")
	public String goJoin() {
		return "newbie";
	}
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String newinfo(@ModelAttribute("pl") ParamList pl) {
		return "home";
	}
	@RequestMapping("/reservation_management")
	public String go_reservation() {
		return "reservation_management";
	}
	@RequestMapping("/show_all")
	public String show_all() {
		return "show_all";
	}
	@RequestMapping("/logout")
	public String logout(HttpServletRequest hsr) {
		HttpSession session = hsr.getSession();
		session.invalidate();
		return "redirect:/";
	}
	@RequestMapping(value="/getRoomList", method=RequestMethod.POST, produces="application/text; charset=utf8")
	@ResponseBody
	public String getRoomList(HttpServletRequest hsr) {
		iRoom room = sqlSession.getMapper(iRoom.class);
		ArrayList<Roominfo> roominfo = room.getRoomList();
		//JSONObject joo = new JSONObject();
		JSONArray ja = new JSONArray();
		for(int i=0; i<roominfo.size(); i++) {
			JSONObject jo = new JSONObject();
			jo.put("roomcode", roominfo.get(i).getRoomcode());
			jo.put("roomname", roominfo.get(i).getRoomname());
			jo.put("typename", roominfo.get(i).getTypename());
			jo.put("howmany", roominfo.get(i).getHowmany());
			jo.put("howmuch", roominfo.get(i).getHowmuch());
			jo.put("typecode", roominfo.get(i).getTypecode());
			ja.add(jo);
			
		}
		//joo.put("data",ja);
		return ja.toString();
	}
}
