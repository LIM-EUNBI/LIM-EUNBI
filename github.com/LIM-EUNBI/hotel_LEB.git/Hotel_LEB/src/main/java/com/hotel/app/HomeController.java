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
import org.springframework.web.bind.annotation.RequestBody;
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
		session.setAttribute("passcode", userpw);
		return "redirect:/room_management";
	}
	@RequestMapping("/room_management")
	public String goRoom(HttpServletRequest hrs, Model model) {
		HttpSession session = hrs.getSession();
		String login = (String)session.getAttribute("loginid");
		String passcode = (String)session.getAttribute("passcode");
		iRoom room = sqlSession.getMapper(iRoom.class);
		ArrayList<Roominfo> roominfo = room.getRoomList(); 
		ArrayList<RoomType> roomtype = room.getRoomType();
		model.addAttribute("list", roominfo);
		model.addAttribute("roomType", roomtype);
		iMember member = sqlSession.getMapper(iMember.class);
		int result = member.selectOne(login,passcode);
		if(result>0) {
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
		iMember member = sqlSession.getMapper(iMember.class);
		member.doJoin(pl.username, pl.userid, pl.passcode, pl.mobile);
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
	@RequestMapping(value="/deleteRoom", method=RequestMethod.POST, produces="application/text; charset=utf8")
	@ResponseBody
	public String deleteRoom(HttpServletRequest hsr) {
		int roomcode = Integer.parseInt(hsr.getParameter("roomcode"));
		iRoom room = sqlSession.getMapper(iRoom.class);
		room.doDeleteRoom(roomcode);
		return "ok";
	}
	@RequestMapping(value="/addRoom", method=RequestMethod.POST, produces="application/text; charset=utf8")
	@ResponseBody
	public String addRoom(HttpServletRequest hsr) {
		String rname = hsr.getParameter("roomname");
		int rtype = Integer.parseInt(hsr.getParameter("roomtype"));
		int howmany = Integer.parseInt(hsr.getParameter("howmany"));
		int howmuch = Integer.parseInt(hsr.getParameter("howmuch"));
		System.out.println(rname+", "+rtype+", "+howmany+", "+howmuch);
		iRoom room = sqlSession.getMapper(iRoom.class);
		room.doAddRoom(rname, rtype, howmany, howmuch);
		return "ok";
	}
	@RequestMapping(value="/updateRoom", method=RequestMethod.POST, produces="application/text; charset=utf8")
	@ResponseBody
	public String updateRoom(HttpServletRequest hsr) {
		int roomcode = Integer.parseInt(hsr.getParameter("roomcode"));
		String rname = hsr.getParameter("roomname");
		int rtype = Integer.parseInt(hsr.getParameter("roomtype"));
		int howmany = Integer.parseInt(hsr.getParameter("howmany"));
		int howmuch = Integer.parseInt(hsr.getParameter("howmuch"));
		iRoom room = sqlSession.getMapper(iRoom.class);
		room.doUpdateRoom(roomcode, rname, rtype, howmany, howmuch);
		return "ok";
	}
	@RequestMapping(value="/searchRoom", method=RequestMethod.POST, produces="application/text; charset=utf8")
	@ResponseBody
	public String searchRoom(HttpServletRequest hsr) {
		String checkin = hsr.getParameter("checkin");
		String checkout = hsr.getParameter("checkout");
		int typecode = Integer.parseInt(hsr.getParameter("typecode"));
		iRoom room = sqlSession.getMapper(iRoom.class);
		ArrayList<Roominfo> searchRoom = room.searchRoom(checkin, checkout, typecode);
		JSONArray ja = new JSONArray();
		for(int i=0; i<searchRoom.size(); i++) {
			JSONObject jo = new JSONObject();
			jo.put("roomcode", searchRoom.get(i).getRoomcode());
			jo.put("roomname", searchRoom.get(i).getRoomname());
			jo.put("typename", searchRoom.get(i).getTypename());
			jo.put("howmany", searchRoom.get(i).getHowmany());
			jo.put("howmuch", searchRoom.get(i).getHowmuch());
			ja.add(jo);
		}
		return ja.toString();
	}
	@RequestMapping(value="book", method=RequestMethod.POST)
	public String book(HttpServletRequest hsr) {
		//String roomname=hsr.getParameter("room_name");
		String period1=hsr.getParameter("date_1");
		String period2=hsr.getParameter("date_2");
		int people_num=Integer.parseInt(hsr.getParameter("people_num"));
		int total_price=Integer.parseInt(hsr.getParameter("total_price"));
		String username=hsr.getParameter("user_name");
		String user_phone=hsr.getParameter("user_num");
		int roomcode=Integer.parseInt(hsr.getParameter("roomcode"));
		System.out.println(period1+", "+period2+", "+people_num+", "+total_price+", "+username+", "+user_phone+", "+roomcode);
		iRoom room = sqlSession.getMapper(iRoom.class);
		room.bookRoom(roomcode,period1,period2,people_num,total_price,username, user_phone);
		return "reservation_management";
	}
	@RequestMapping(value="/showBooking", method=RequestMethod.POST, produces="application/text; charset=utf8")
	@ResponseBody
	public String showBooking() {
		iRoom room = sqlSession.getMapper(iRoom.class);
		ArrayList<BookUser> book = room.showBooking();
		JSONArray ja = new JSONArray();
		for(int i=0; i<book.size(); i++) {
			JSONObject jo = new JSONObject();
			jo.put("bookcode", book.get(i).getBookcode());
			jo.put("roomcode", book.get(i).getRoomcode());
			jo.put("pcount", book.get(i).getPcount());
			jo.put("name", book.get(i).getName());
			jo.put("mobile", book.get(i).getMobile());
			jo.put("checkin", book.get(i).getCheckin());
			jo.put("checkout", book.get(i).getCheckout());
			jo.put("price", book.get(i).getPrice());
			jo.put("roomname", book.get(i).getRoomname());
			jo.put("typename", book.get(i).getTypename());
			ja.add(jo);
		}
		return ja.toString();
	}
}
