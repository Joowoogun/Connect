package com.smhrd.controller;

import com.smhrd.database.DAO;
import com.smhrd.model.MemberVO;
import com.smhrd.model.TodolistVO;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet({"/addTodoService"})
public class addTodoService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("profile");
		String userId = mvo.getuserId();
		String todoTitle = request.getParameter("todoTitle");
		String content = request.getParameter("content");
		String do_Status = request.getParameter("do_Status");
		String do_startDate = request.getParameter("do_startDate");
		String do_endDate = request.getParameter("do_endDate");
		TodolistVO vo = new TodolistVO();
		vo.setUserId(userId);
		vo.setTodoTitle(todoTitle);
		vo.setContent(content);
		vo.setDo_Status(do_Status);
		vo.setDo_startDate(do_startDate);
		vo.setDo_endDate(do_endDate);
		DAO dao = new DAO();
		List<TodolistVO> list = dao.addTodo(vo);
		request.setAttribute("list", list);
		RequestDispatcher rd = request.getRequestDispatcher("SelectTodoAllService");
		rd.forward(request, response);
	}
}