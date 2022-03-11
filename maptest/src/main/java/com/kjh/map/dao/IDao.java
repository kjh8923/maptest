package com.kjh.map.dao;

import java.util.ArrayList;

import com.kjh.map.dto.ContentDto;


public interface IDao {
	
	void insertMap(ContentDto dto);
	ArrayList<ContentDto> selectAllMap();
}
