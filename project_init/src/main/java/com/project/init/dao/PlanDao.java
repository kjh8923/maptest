package com.project.init.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.project.init.dto.FilterDto;
import com.project.init.dto.PlanListDto;
import com.project.init.dto.PlanMstDto;

@Component
public class PlanDao implements IDao {

	private static final Logger logger = LoggerFactory.getLogger(PlanDao.class);

	private final SqlSession sqlSession;
	
	@Autowired
	public PlanDao(SqlSession sqlSession) {
		logger.info("PlanDao Const in >>>");
		this.sqlSession = sqlSession;
		
		logger.info("PlanDao Const result : sqlSession getConn success ? " + sqlSession.toString());
	}
	
	
	@Override
	public void insertPlanMst(PlanMstDto dto) {
		logger.info("insertPlanMst(" + dto.getPlanName() + ")in >>>");
			
		int res = sqlSession.insert("insertPlanMst", dto);
		
		logger.info("insertPlan(" + dto.getPlanName() + ") result1 : " + (res > 0 ? "success" : "failed"));
		logger.info("insertPlan(" + dto.getPlanName() + ") result2 : planNum ? " + dto.getPlanNum());

	}

	@Override
	public PlanMstDto selectPlanMst(int planNum) {
		logger.info("selectPlanMst(" + planNum + ") in >>>");
		
		PlanMstDto dto = sqlSession.selectOne("selectPlanMst", planNum);
		
		logger.info("selectPlanMst(" + planNum + ") result : " + (dto != null ? "success" : "null"));
		return dto;
	}


	@Override
	public String insertPlanList(PlanListDto dto) {
		int res = sqlSession.insert("insertPlanList", dto);
		System.out.println(res);
		String result = null;
		if(res > 0)
			result = "success";
		else
			result = "failed";
		
		return result;
	}


	@Override
	public ArrayList<PlanListDto> selectPlanList() {
		ArrayList<PlanListDto> result = (ArrayList)sqlSession.selectList("selectPlanList");
		return result;
	}

	@Override
	public ArrayList<FilterDto> filter() {
		
		ArrayList<FilterDto> result = (ArrayList)sqlSession.selectList("filter");
		
		return result;
	}



	
	
	
	
}
