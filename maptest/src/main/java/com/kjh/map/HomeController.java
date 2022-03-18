package com.kjh.map;

import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kjh.map.command.MapCommand;
import com.kjh.map.dao.MapDao;
import com.kjh.map.dao.MapIDao;
import com.kjh.map.dto.MapDto;
import com.kjh.map.util.Constant;



/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private MapDao dao;
	
	@Autowired
	MapIDao mapper;
	
	@Autowired
	public void setMdao(MapDao dao) {
		this.dao= dao;
		Constant.mdao = dao;
	}
	
	private MapCommand mcom;
	
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
		//return "test";
		//return "map3";
	}
	
	/*
	 * @ResponseBody
	 * 
	 * @PostMapping("/insertMap") public void insertMap(@RequestBody MapDto dto) {
	 * mapper.insertMap(dto); }
	 */
	
	@RequestMapping(value="/insertMap", produces = "application/text; charset=UTF8")
	@ResponseBody
	public String insertMap(HttpServletRequest request, HttpServletResponse response, Model model) {
		System.out.println("insertMap");
		mcom = new MapCommand();
		mcom.execute(model, request);
		String result = (String)request.getAttribute("result");
		if(result.equals("success"))
			return "insert-success";
		else
			return "insert-failed";
	}
	
	@RequestMapping("/map4")
	public String main() {
		return "map4";
	}
	
	@RequestMapping("/markerclusterer")
	public String markerclusterer() {
		return "markerclusterer";
	}
	
	@ResponseBody
	@RequestMapping(value = "/getlatlng", produces="application/json; charset=UTF-8")
	public ArrayList<MapDto> getlatlng(Model model) {
		ArrayList<MapDto> latlng = dao.selectlatlng();
		model.addAttribute("latlng", latlng);
		System.out.println(latlng);
		return latlng;
	}
	
}
