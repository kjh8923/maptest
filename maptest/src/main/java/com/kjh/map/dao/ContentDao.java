package com.kjh.map.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.kjh.map.dto.ContentDto;

public class ContentDao implements IDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	public ContentDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void insertMap(ContentDto dto) {
		sqlSession.insert("insertMap", dto);
	}

	@Override
	public ArrayList<ContentDto> selectlatlng(){
		ArrayList<ContentDto> result = (ArrayList)sqlSession.selectList("selectlatlng");
		//selectList(�޼����̸�)�� Object�� ��ȯ�ϹǷ� (ArrayList)�� ����ȯ
		//selectList()�޼���� ��񿡼� �ټ����� resultset�� ��ȯ�ϴµ� ���
		return result;
	}
	
	
	


}
