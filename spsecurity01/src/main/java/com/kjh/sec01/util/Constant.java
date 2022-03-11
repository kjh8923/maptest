package com.kjh.sec01.util;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.kjh.sec01.dao.MemberDao;

public class Constant {
	public static BCryptPasswordEncoder passwordEncoder;
	public static MemberDao mdao;
	public static String username;
}
