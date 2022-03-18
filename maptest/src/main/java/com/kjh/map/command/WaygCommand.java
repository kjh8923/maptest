package com.kjh.map.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface WaygCommand {

	public void execute(Model model, HttpServletRequest request);
}
