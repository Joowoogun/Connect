package com.smhrd.controller;

import com.smhrd.database.DAO;
import com.smhrd.model.MemberVO;
import com.smhrd.model.TodolistVO;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SelectTodoAll implements Command {
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		
		DAO dao = new DAO();
	      List<TodolistVO> TodoList = dao.TodoAll();
	      HttpSession session = request.getSession();
	      MemberVO mvo = (MemberVO) session.getAttribute("profile");
	      String id = mvo.getuserId();
	      for (int i = 0; i < TodoList.size(); i++) {
	         TodoList.get(i).setprofileId(id);
	      }
	      
	   //   System.out.println(TodoList.get(1).getTodoTitle());
	   //   System.out.println(TodoList.get(1).getprofileId());
	      
	      request.setAttribute("TodoList", TodoList);
	      
	      return "SelectTodoAll";
	}
}