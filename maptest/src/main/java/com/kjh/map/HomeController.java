package com.kjh.map;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kjh.map.dao.ContentDao;
import com.kjh.map.dto.ContentDto;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	public ContentDao dao;
	
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
		
		//return "home";
		return "map4";
	}
	
	@RequestMapping(value = "/", produces = "application/json; charset=UTF8")
	@ResponseBody
	public HashMap<String, Object> map4(@RequestBody ContentDto contentDto) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("title", contentDto.getTitle());
		map.put("content", contentDto.getContent());
		map.put("latitude", contentDto.getLatitude());
		map.put("longitude", contentDto.getLongitude());
		map.put("placeName", contentDto.getPlaceName());
		map.put("placeName2", contentDto.getPlaceName2());
		
		//map.setViewName("login_view"); //jsp¼³Á¤
		return map;
	}
		
	/*
	 * @RequestMapping("/home") public String list(Model model) {
	 * ArrayList<ContentDto> list = dao.listDao(); model.addAttribute("list", list);
	 * return "home"; }
	 */
	
}
