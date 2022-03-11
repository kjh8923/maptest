package com.kjh.sec01.dao;

import com.kjh.sec01.dto.JoinDto;

public interface MemberIdao {
	//myBatis에서 사용하는 추상메서드들
	//join
	public String join(JoinDto dto);
	
	//login
	public JoinDto login(String bId);
}
