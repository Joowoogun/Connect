package com.smhrd.controller.todo;

import com.smhrd.controller.Command;
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
		String yourTitle = request.getParameter("yourTitle"); 
		String content = request.getParameter("content");
		String do_Status = request.getParameter("do_Status");
		String do_startDate = request.getParameter("do_startDate");
		String do_startTime = request.getParameter("do_startTime");
		String do_endDate = request.getParameter("do_endDate");
		String do_endTime = request.getParameter("do_endTime");
		TodolistVO vo = new TodolistVO();
		vo.setUserId(userId);
		if(todoTitle.equals("직접입력")) {
			todoTitle = yourTitle;
		}
		vo.setTodoTitle(todoTitle);
		vo.setContent(content);
		vo.setDo_Status(do_Status);
		vo.setDo_startDate(do_startDate);
		vo.setDo_startTime(do_startTime);
		vo.setDo_endDate(do_endDate);
		vo.setDo_endTime(do_endTime);
		System.out.println("got");
		System.out.println(yourTitle);
		TodolistVO todovo = new TodolistVO();
		todovo.setTodoTitle(todoTitle);
		request.setAttribute("addTodoTitle", todovo);
		System.out.println("addTodo.java 출력값"+todovo.getTodoTitle());
		DAO dao = new DAO();
		dao.addTodo(vo);
		return "redirect:/fullCalendar.do";
	}
}