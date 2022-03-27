package com.project.init.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.init.dao.PlanDao;
import com.project.init.dto.FilterDto;
import com.project.init.dto.PlanListDto;
import com.project.init.util.Constant;


@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private PlanDao dao;
	
	@Autowired
	public void setMdao(PlanDao dao) {
		this.dao= dao;
		Constant.pdao = dao;
	}

	@RequestMapping("/")
	public String index() {
		logger.info("index() in >>>>");
		return "index";
	}
	
	@ResponseBody
	@RequestMapping(value = "/selectPlanList", produces="application/json; charset=UTF-8")
	public ArrayList<PlanListDto> selectPlanList(Model model) {
		logger.info("selectPlanList() in >>>>");
		ArrayList<PlanListDto> selectPlanList = dao.selectPlanList();
		model.addAttribute("latlng", selectPlanList);
		System.out.println(selectPlanList);
		return selectPlanList;
	}
	
	@ResponseBody
	@RequestMapping(value = "/filter", produces="application/json; charset=UTF-8")
	public ArrayList<FilterDto> filter(HttpServletRequest request, Model model){
		logger.info("filter() in >>>>");
		String value1 = request.getParameter("value1");
		String value2 = request.getParameter("value2");
		Map<String, String> map = new HashMap<>();
		map.put("value1", value1);
		map.put("value2", value2);
		ArrayList<FilterDto> filter = dao.filter(map);

		request.setAttribute("filter", filter);
		return filter;
	}
	
}
