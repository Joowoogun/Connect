package com.smhrd.controller;

import com.smhrd.database.DAO;
import com.smhrd.model.TodolistVO;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SelectTodoAll implements Command {
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		DAO dao = new DAO();
		List<TodolistVO> TodoList = dao.TodoAll();
		request.setAttribute("TodoList", TodoList);
		return "SelectTodoAll";
	}
}