package com.kjh.sec01.memberCommand;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface MemberCommand {
	//�߻�޼���
	public void execute(Model model, HttpServletRequest request);
	//Model���� ������� ����
	//HttpServletRequest�� Ŭ���̾�Ʈ���� ���� �Ķ��Ÿ ó��
}
