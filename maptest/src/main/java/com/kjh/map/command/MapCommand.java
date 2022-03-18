package com.kjh.map.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.kjh.map.dao.MapDao;
import com.kjh.map.dto.MapDto;
import com.kjh.map.util.Constant;

public class MapCommand implements WaygCommand {

	@Override
	public void execute(Model model, HttpServletRequest request) {
		String index = request.getParameter("ind");
		int j = Integer.parseInt(index);
		System.out.println("j");
		for(int i = 0; i < j; i++) {

		MapDto dto = new MapDto(0, request.getParameter("latitude" + i), request.getParameter("longitude" + i), request.getParameter("placeName" + i), request.getParameter("ind"));
		
		MapDao mdao = Constant.mdao;
		
		String result = mdao.insertMap(dto);
		
		request.setAttribute("result", result);
		}		
	}
	
	

}
