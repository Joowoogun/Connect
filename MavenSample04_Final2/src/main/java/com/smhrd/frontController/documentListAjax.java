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
import com.smhrd.model.DocumentVO;
import com.smhrd.model.MemberVO;

@WebServlet("/documentListAjax")
public class documentListAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("Doc Ajax 도착");
		
		// 한글 인코딩
		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("uft-8");
		
		// 세션에서 아이디 가져오기
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("profile");
		String userId = mvo.getuserId();
		
		// 아이디로 매퍼를 활용하여 DB에서 정보 가져오기
		DAO dao = new DAO();
		List<DocumentVO> listvo = dao.DocumentSelect(userId);
		
		// Ajax에서 활용하기 위해 Json 으로 변환
		Gson gson = new Gson();
		String json = gson.toJson(listvo);
		System.out.println(json);
		
		// 보내주기
		PrintWriter out = response.getWriter();
		out.print(json);
		return;
	}

}
