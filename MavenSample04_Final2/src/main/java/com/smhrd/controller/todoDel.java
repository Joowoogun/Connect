package com.smhrd.controller;

import com.smhrd.database.DAO;
import com.smhrd.model.TodolistVO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class todoDel implements Command {
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String content = request.getParameter("txt");
		TodolistVO vo = new TodolistVO();
		vo.setContent(content);
		System.out.println(vo.getContent());
		DAO dao = new DAO();
		dao.todoDel(vo);
		dao.TodoAll();
		return "redirect:/SelectTodoAll.do";
	}
}