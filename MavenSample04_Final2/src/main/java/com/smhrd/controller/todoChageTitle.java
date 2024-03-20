package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.database.DAO;
import com.smhrd.model.MemberVO;
import com.smhrd.model.TodolistVO;


public class todoChageTitle implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// 바꿀 타이틀명 가져오기
		String title = request.getParameter("title");
		String titleName= request.getParameter("titleName");
		// 출력해서 확인해보기
		System.out.println("변경할 타이틀 이름 >> "+title+ "\n 현재 타이틀 >> "+titleName);
		// profile에있는 아이디값 가져오기
		HttpSession session = request.getSession();
		MemberVO vod = (MemberVO) session.getAttribute("profile");
		
		String id = vod.getuserId();
		TodolistVO vo = new TodolistVO(id, title, titleName);
		DAO dao = new DAO();
		System.out.println(vo.getTodoTitle());
		System.out.println(vo.getUserId());
		dao.changeTodoTitle(vo);
		
		return "redirect:/SelectTodoAll.do";
	}

}
