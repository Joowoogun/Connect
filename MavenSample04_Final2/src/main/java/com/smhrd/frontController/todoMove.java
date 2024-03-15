package com.smhrd.frontController;

import com.smhrd.model.MemberVO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet({"/todoMove"})
public class todoMove extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("요청이 들어옴");
		String data = request.getParameter("sendData");
		System.out.println("데이터확인 >> " + data);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		MemberVO vo = new MemberVO();
		vo.setuserId("admin");
		vo.setaddress("01012345678");
		vo.setEmail("woody1@hanmail.net");
	}
}