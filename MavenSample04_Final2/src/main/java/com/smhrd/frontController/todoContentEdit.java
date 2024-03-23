package com.smhrd.frontController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.database.DAO;
import com.smhrd.model.TodolistVO;

@WebServlet("/todoContentEdit")
public class todoContentEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		// 가져온 content 내용및 인덱스 변수저장
		String content = request.getParameter("content");
		int todoIdx = Integer.parseInt(request.getParameter("idx"));
		// mapper에서 mybatis로 사용하기 위해 vo에 저장 후 메소드 작동
		TodolistVO vo = new TodolistVO(content, todoIdx);
		DAO dao = new DAO();
		dao.TodoContentUpdate(vo);
		// ajax 비동기 이기 때문에 리턴값이 없다.
		return;
	}
}
