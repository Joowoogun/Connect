package com.smhrd.frontController;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.smhrd.database.DAO;
import com.smhrd.model.MemberVO;
import com.smhrd.model.TodolistVO;

@WebServlet("/todoSelectAjax")
public class todoSelectAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("profile");
		String userId = mvo.getuserId();
		String SelectTitle = request.getParameter("select");
		System.out.println("가져온값 확인 >> "+SelectTitle);
		TodolistVO vo = new TodolistVO();
		vo.setUserId(userId);
		vo.setTodoTitle(SelectTitle);
		
		DAO dao = new DAO();
		List<TodolistVO> SelectTodoOption = dao.SelectTodoOption(vo);
		System.out.println("사이즈 확인 >> "+SelectTodoOption.size());
		
		
		Gson gson = new Gson();
        // 도구 사용하기
		String json = gson.toJson(SelectTodoOption);
		System.out.println("Json 출력 >> "+json);
		System.out.println("Json length >>"+json.length());
		PrintWriter out = response.getWriter();
		out.print(json);
		
		System.out.println("TodoSelcetAjax 완료");
		return;
		

	}

}
