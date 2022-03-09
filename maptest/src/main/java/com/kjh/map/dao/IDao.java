package com.kjh.map.dao;

import java.util.ArrayList;

import com.kjh.map.dto.ContentDto;


public interface IDao {
	public void writeDao(String title, String content, String latitude, String longitude, String placeName, String placeName2);
	public ArrayList<ContentDto> listDao();
}
