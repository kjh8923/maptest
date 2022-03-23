package com.project.init.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.project.init.dao.PlanDao;
import com.project.init.dto.PlanListDto;
import com.project.init.util.Constant;

public class PlanListInsertCommand implements ICommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		String index = request.getParameter("placeCount");
		int j = Integer.parseInt(index);
		System.out.println("j");
		for(int i = 0; i < j; i++) {
			
		PlanListDto dto = new PlanListDto(
				Integer.parseInt(request.getParameter("planNum")),
				0,
				request.getParameter("latitude" + i), 
				request.getParameter("longitude" + i), 
				request.getParameter("placeName" + i),
				request.getParameter("placeCount"),
				request.getParameter("category" + i), 			
				request.getParameter("address"+i),
				request.getParameter("planDetail"+i),
				request.getParameter("transportation"+i),
				request.getParameter("startTime"+i),
				request.getParameter("endTime"+i)
				);
		
		PlanDao mdao = Constant.pdao;
		
		String result = mdao.insertPlanList(dto);
		
		request.setAttribute("result", result);
		}

	}

}
