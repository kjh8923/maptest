package com.kjh.map.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.kjh.map.dto.MapDto;

public class MapDao implements MapIDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	public MapDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void insertMap(MapDto dto) {
		sqlSession.insert("insertMap", dto);
	}

	@Override
	public ArrayList<MapDto> selectlatlng(){
		ArrayList<MapDto> result = (ArrayList)sqlSession.selectList("selectlatlng");
		//selectList(메서드이름)은 Object를 반환하므로 (ArrayList)로 형변환
		//selectList()메서드는 디비에서 다수개의 resultset을 반환하는데 사용
		return result;
	}
	
	
	


}
