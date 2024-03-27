package com.smhrd.frontController;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
import com.smhrd.model.ScrapListVO;

@WebServlet("/calScrapAjax")
public class calScrapAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("profile");
		String userId = mvo.getuserId();
		String todoTitle = request.getParameter("select");
		DAO dao = new DAO();
		ScrapListVO svo = new ScrapListVO();
		svo.setUserId(userId);
		List<ScrapListVO> calScrap = dao.SelectScrapAll(svo);
		List<String> calScrapTitle = new ArrayList<String>();
		for (int i = 0; i < calScrap.size(); i++) {
			calScrapTitle.add(i, calScrap.get(i).getConName());
		}
			Gson gson = new Gson();
			String json = gson.toJson(calScrap);
			System.out.println("calscrpa json 출력 >>"+ json);
			PrintWriter out = response.getWriter();
			out.print(json);
		
			return;
	
	}

}
