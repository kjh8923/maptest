package com.kjh.sec01.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.kjh.sec01.dto.JoinDto;

public class MemberDao implements MemberIdao{
	
	@Autowired //�ʵ��Ŀ� ���� Autowired 
	private SqlSession sqlSession;
	//field autowired ������ SqlSessionTemplate��ü��(���� �������̽�) 
	
	//=== join ===
	@Override
	public String join(JoinDto dto) {
		int res = sqlSession.insert("join", dto);
		System.out.println(res);
		String result = null;
		if(res > 0)
			result = "success";
		else
			result = "failed";
		
		System.out.println(result);
		return result;
	}
	
	//=== log in ===
	@Override
	public JoinDto login(String bId) {
		System.out.println(bId);
		JoinDto result = sqlSession.selectOne("login", bId);
		//�α��� ó���� id�� �����ϹǷ� 1���� select�Ǿ� selectOne 
		return result;
	}

}
