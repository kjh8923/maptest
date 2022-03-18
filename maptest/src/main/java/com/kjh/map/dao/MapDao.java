package com.kjh.map.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.kjh.map.dto.MapDto;

public class MapDao implements MapIDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	/*
	 * @Autowired public MapDao(SqlSession sqlSession) { this.sqlSession =
	 * sqlSession; }
	 */
	
	@Override
	public String insertMap(MapDto dto) {
			int res = sqlSession.insert("insertMap", dto);
			System.out.println(res);
			String result = null;
			if(res > 0)
				result = "success";
			else
				result = "failed";
			
			return result;
	}


	@Override
	public ArrayList<MapDto> selectlatlng(){
		ArrayList<MapDto> result = (ArrayList)sqlSession.selectList("selectlatlng");
		//selectList(�޼����̸�)�� Object�� ��ȯ�ϹǷ� (ArrayList)�� ����ȯ
		//selectList()�޼���� ��񿡼� �ټ����� resultset�� ��ȯ�ϴµ� ���
		return result;
	}


	
	
	


}
