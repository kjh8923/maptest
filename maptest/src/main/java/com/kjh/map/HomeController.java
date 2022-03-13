package com.kjh.map;

import java.util.ArrayList;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kjh.map.dao.ContentDao;
import com.kjh.map.dao.IDao;
import com.kjh.map.dto.ContentDto;



/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private ContentDao dao;
	
	@Autowired
	IDao mapper;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		//return "home";
		//return "main";
		return "map4";
	}
	
	@ResponseBody
	@PostMapping("/insertMap")
	public void insertMap(@RequestBody ContentDto dto) {
		mapper.insertMap(dto);
	}
	
	@RequestMapping("/mapmain")
	public String join_view() {
		return "home";
	}
	
	
	@RequestMapping("/main")
	public String main(Model model) {
		ArrayList<ContentDto> latlng = dao.selectlatlng();
		model.addAttribute("latlng", latlng);
		return "main";
	}
	
}
