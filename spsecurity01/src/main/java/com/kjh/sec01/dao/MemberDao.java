package com.kjh.sec01.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.kjh.sec01.dto.JoinDto;

public class MemberDao implements MemberIdao{
	
	@Autowired //필드방식에 의한 Autowired 
	private SqlSession sqlSession;
	//field autowired 실제는 SqlSessionTemplate객체임(상위 인터페이스) 
	
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
		//로그인 처리시 id는 유일하므로 1개만 select되어 selectOne 
		return result;
	}

}
