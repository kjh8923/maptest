package com.kjh.map.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.kjh.map.dto.ContentDto;

public class ContentDao implements IDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public ContentDao() {
		
	}
	
	@Override
	public void writeDao(String title, String content, String latitude, String longitude, String placeName, String placeName2) {
		ContentDto dto = new ContentDto(0, title, content, latitude, longitude, placeName, placeName2);
		sqlSession.insert("writeDao", dto);
	}

	@Override
	public ArrayList<ContentDto> listDao() {
		ArrayList<ContentDto> result = (ArrayList)sqlSession.selectList("listDao");
		return result;
	}

}
