package com.kjh.sec01.dao;

import com.kjh.sec01.dto.JoinDto;

public interface MemberIdao {
	//myBatis���� ����ϴ� �߻�޼����
	//join
	public String join(JoinDto dto);
	
	//login
	public JoinDto login(String bId);
}
