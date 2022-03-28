package com.project.init.feed.dao;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.project.init.feed.dto.CommentDto;
import com.project.init.feed.dto.FilterDto;
import com.project.init.feed.dto.PlanDto;
import com.project.init.feed.dto.PlanDto2;

public interface IDao {
	
	void insertPlan(PlanDto dto);
	
	PlanDto selectPlan(int planNum);
	
	
	ArrayList<PlanDto> selectAllPlan();

	String updatePlan(PlanDto dto);
	
	String deletePlan(String planNum);
	
	String insertMap(Model model, HttpServletRequest request);
	
	String insertPlanDtDo(HttpServletRequest request, Model model);
	
	public ArrayList<PlanDto2> selectPlanList();
	
	public ArrayList<FilterDto> filter(Map<String, String> map);
	
	
	String insertMcomment(CommentDto dto);
	ArrayList<CommentDto> selectComments();
}
