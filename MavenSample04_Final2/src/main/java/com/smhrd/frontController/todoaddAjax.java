package com.smhrd.frontController;

import java.io.IOException;
import java.io.PrintWriter;

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

@WebServlet("/todoaddAjax")
public class todoaddAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 세션에서 로그인한 정보의 아이디를 가져오기
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("profile");
		String userId = mvo.getuserId();
		// todoadd 를 누르면 전송되는 값을 리퀘스트로가져오는작업
		String addTodoTitle = request.getParameter("addTodoTitle");
		String addYourTitle = request.getParameter("addYourTitle");
		String addContent = request.getParameter("addContent");
		String addStatus = request.getParameter("addStatus");
		String addStartDate = request.getParameter("addStartDate");
		String addStartTime = request.getParameter("addStartTime");
		String addEndDate = request.getParameter("addEndDate");
		String addEndTime = request.getParameter("addEndTime");
		TodolistVO vo = new TodolistVO();
		vo.setUserId(userId);
		//addTodoTitle" : addTodoTitle,
		
		
		
		// 집적입력 했을경우 간편선택 했을경우 분류해서
		if(addYourTitle.equals("")) {
			addYourTitle = addTodoTitle ;
		}
		vo.setTodoTitle(addYourTitle);
		vo.setContent(addContent);
		vo.setDo_Status(addStatus);
		vo.setDo_startDate(addStartDate);
		vo.setDo_startTime(addStartTime);
		vo.setDo_endDate(addEndDate);
		vo.setDo_endTime(addEndTime);
		// DAO 메소드 사용
		DAO dao = new DAO();
		dao.addTodo(vo);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		// 성공시 보내는 값
		out.print(addYourTitle);
		
		System.out.println("addTodoAjax 동작완료");
		
		return;
	}

}
