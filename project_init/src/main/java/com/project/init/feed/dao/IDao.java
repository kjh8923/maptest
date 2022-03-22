package com.project.init.feed.dao;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.project.init.feed.dto.PlanDto;
import com.project.init.feed.dto.PlanDto2;

public interface IDao {
	
	void insertPlan(PlanDto dto);
	
	ArrayList<PlanDto> selectAllPlan();

	String updatePlan(PlanDto dto);
	
	String deletePlan(String planNum);
	
	String insertMap(Model model, HttpServletRequest request);
	
	public ArrayList<PlanDto2> selectMapContent();
}
