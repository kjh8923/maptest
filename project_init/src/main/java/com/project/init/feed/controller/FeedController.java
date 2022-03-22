package com.project.init.feed.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.init.feed.dao.IDao;
import com.project.init.feed.dto.PlanDto;
import com.project.init.feed.dto.PlanDto2;

@Controller
@RequestMapping("/feed")
public class FeedController {
	
	private static final Logger logger = LoggerFactory.getLogger(FeedController.class);
	
	@Autowired
	private IDao dao;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping("")
	public String feed() {
		logger.info("feed page >>>>");
		
		return "feed/main";
	}
	
	@ResponseBody
	@RequestMapping(value="getAllPlans.do", produces="application/json; charset=UTF-8")
	public ArrayList<PlanDto> getAllPlans() {
		logger.info("getAllPlans() >>>>");
		
		return dao.selectAllPlan();
	}
	
	@ResponseBody
	@RequestMapping("insertPlan.do")
	public void insertPlan(@RequestBody PlanDto dto) {
		logger.info("insertPlans(" + dto + ") in >>>>");
		
		dao.insertPlan(dto);
		
		logger.info("insertPlans(" + dto + ") out >>>>");
	}
	
	@ResponseBody
	@RequestMapping("modify_plan.do")
	public String modifyPlan(@RequestBody PlanDto dto) {
		logger.info("modifyPlans("+ dto +") in >>>>");
		String result = dao.updatePlan(dto);
		
		logger.info("modifyPlans(" + result + ") result : " + result);
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping("delete_plan.do")
	public String deletePlan(@RequestBody String planNum) {
		logger.info("deletePlan("+ planNum +") in >>>>");
		String result = dao.deletePlan(planNum);
		
		logger.info("deletePlan("+ result +") result : " + result);
		return result;
	}
	
	@RequestMapping("mappage")
	public String mappage(PlanDto dto, Model model) {
		logger.info("mappage(" + dto.getPlanName() + ") in >>>>");
		
		model.addAttribute("plan", dto);
		
		return "feed/mappage";
	}
	
	@RequestMapping("markerclusterer")
	public String markerclusterer() {
		return "feed/markerclusterer";
	}
	
	//===== markerclusterer¿¡ db¿¡¼­ ¹ÞÀº data »Ñ¸®±â =====
	@ResponseBody
	@RequestMapping(value = "/selectcontent", produces="application/json; charset=UTF-8")
	public ArrayList<PlanDto2> selectcontent(Model model) {
		ArrayList<PlanDto2> mapcontent = dao.selectMapContent();
		model.addAttribute("selectcontent", mapcontent);
		System.out.println(mapcontent);
		return mapcontent;
	}
	
	//===== mappageï¿½ï¿½ form(#frm)ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ data insert =====
	@RequestMapping(value="insertMap", produces = "application/text; charset=UTF8")
	@ResponseBody
	public String insertMap(HttpServletRequest request, HttpServletResponse response, Model model) {
		System.out.println("insertMap");
		String result = dao.insertMap(model, request);

		if(result.equals("success"))
			return "insert-success";
		else
			return "insert-failed";
	}
	
	
}
