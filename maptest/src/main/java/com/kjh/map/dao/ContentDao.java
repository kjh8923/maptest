package com.kjh.map.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.kjh.map.dto.ContentDto;

public class ContentDao implements IDao {
	
	private final SqlSession sqlSession;
	
	@Autowired
	public ContentDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void insertMap(ContentDto dto) {
		sqlSession.insert("insertMap", dto);
	}

	@Override
	public ArrayList<ContentDto> selectAllMap() {
		ArrayList<ContentDto> dtos = (ArrayList)sqlSession.selectList("selectAllMap");
		return dtos;
	}
	


}
