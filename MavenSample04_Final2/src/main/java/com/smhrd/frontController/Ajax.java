package com.smhrd.frontController;

import com.google.gson.Gson;
import com.smhrd.model.MemberVO;
import com.smhrd.model.TodolistVO;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet({ "/Ajax" })
public class Ajax extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("요청이 들어옴");
		String data = request.getParameter("sendData");
		System.out.println("데이터확인 >> " + data);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		TodolistVO vo = new TodolistVO();
		
		vo.setDo_Status(data);
		
		Gson gson = new Gson();
		   // 도구 사용하기
		   String json = gson.toJson(vo);
		   
		   // 출력해보기
		   out.print(json);
		   
		   return;
		   
	}
}