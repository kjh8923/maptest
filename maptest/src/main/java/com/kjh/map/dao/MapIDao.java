package com.kjh.map.dao;

import java.util.ArrayList;

import com.kjh.map.dto.MapDto;


public interface MapIDao {
	
	void insertMap(MapDto dto);
	public ArrayList<MapDto> selectlatlng();
}