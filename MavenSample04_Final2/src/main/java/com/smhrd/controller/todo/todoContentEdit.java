package com.smhrd.controller.todo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.controller.Command;
import com.smhrd.database.DAO;
import com.smhrd.model.TodolistVO;

public class todoContentEdit implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String content = request.getParameter("content");
		int todoIdx = Integer.parseInt(request.getParameter("todoIdx"));
		TodolistVO vo = new TodolistVO(content, todoIdx);
		DAO dao = new DAO();
		dao.TodoContentUpdate(vo);
		return "redirect:/SelectTodoAll.do";
	}

}
