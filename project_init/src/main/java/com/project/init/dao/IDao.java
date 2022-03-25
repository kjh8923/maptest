package com.project.init.dao;


import java.util.ArrayList;

import com.project.init.dto.FilterDto;
import com.project.init.dto.PlanListDto;
import com.project.init.dto.PlanMstDto;

public interface IDao {

	void insertPlanMst(PlanMstDto dto);
	
	PlanMstDto selectPlanMst(int planNum);
	
	public String insertPlanList(PlanListDto dto);
	
	public ArrayList<PlanListDto> selectPlanList();
	
	public ArrayList<FilterDto> filter();
}
