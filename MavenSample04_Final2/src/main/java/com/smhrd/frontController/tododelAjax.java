package com.smhrd.frontController;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.database.DAO;
import com.smhrd.model.TodolistVO;

@WebServlet("/tododelAjax")
public class tododelAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		// todo 에서 비동기 삭제 버튼을 누를시 전송되는 데이터 가져오기
		System.out.println("ajax 도착");
		int todoIdx = Integer.parseInt(request.getParameter("tododelIdx"));
		// 임시 출력
		System.out.println("DelAjax에 전송된 인덱스 값 >> "+todoIdx);
		// 삭제 Mapper에 동봉할 자료들 vo에 넣어놓기
		TodolistVO vo = new TodolistVO();
		vo.setTodoIdx(todoIdx);
		// DAO 불러와 메소드작동
		DAO dao = new DAO();
	    dao.todoDel(vo);
		return;
	}

}
