package com.smhrd.controller;

import com.smhrd.database.DAO;
import com.smhrd.model.MemberVO;
import com.smhrd.model.TodolistVO;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class addTodo implements Command {
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("profile");
		String userId = mvo.getuserId();
		String todoTitle = request.getParameter("todoTitle");
		String content = request.getParameter("content");
		String do_Status = request.getParameter("do_Status");
		String do_startDate = request.getParameter("do_startDate");
		String do_startTime = request.getParameter("do_startTime");
		String do_endDate = request.getParameter("do_endDate");
		String do_endTime = request.getParameter("do_endTime");
		TodolistVO vo = new TodolistVO();
		vo.setUserId(userId);
		vo.setTodoTitle(todoTitle);
		vo.setContent(content);
		vo.setDo_Status(do_Status);
		vo.setDo_startDate(do_startDate);
		vo.setDo_startTime(do_startTime);
		vo.setDo_endDate(do_endDate);
		vo.setDo_endTime(do_endTime);
		System.out.println("got");
		DAO dao = new DAO();
		List<TodolistVO> list = dao.addTodo(vo);
		request.setAttribute("list", list);
		return "redirect:/SelectTodoAll.do";
	}
}