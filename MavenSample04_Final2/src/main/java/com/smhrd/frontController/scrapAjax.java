package com.smhrd.frontController;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

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
import com.smhrd.model.TodolistVO;

@WebServlet("/scrapAjax")
public class scrapAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session = request.getSession();
	    MemberVO mvo = (MemberVO) session.getAttribute("profile");
	    // scrapStatus 데이터 가져오기
	    String userId = mvo.getuserId();
		String Status = request.getParameter("scrapStatus");
		int conIdx = Integer.parseInt(request.getParameter("conIdx"));
		String conName = request.getParameter("conName");
		System.out.println("Status 출력 >> "+Status);
		PrintWriter out = response.getWriter();
		//Status에 넣어서 데이터값 저장
		request.setAttribute("Status", Status);
		Gson gson = new Gson();
        // 도구 사용하기
       String json = gson.toJson(Status);
       
    // 현재 날짜와 시간 얻기
       Date now = new Date(); // 현재 날짜와 시간을 얻음

       // 날짜와 시간을 문자열로 변환
       SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
       SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");
       String formattedDate = dateFormat.format(now); // 날짜 형식 지정 (YYYY-MM-DD)
       String formattedTime = timeFormat.format(now); // 시간 형식 지정 (HH:mm:ss)

       // tvo 객체의 메서드를 사용하여 값을 설정
       
        DAO dao = new DAO();
       ScrapListVO vo = new ScrapListVO(userId, conIdx);
       TodolistVO tvo = new TodolistVO();
       tvo.setUserId(userId);
       tvo.setConIdx(conIdx);
       tvo.setTodoTitle(conName);
       tvo.setDo_Status("진행 중");
       tvo.setContent("설정한 내용");
       tvo.setDo_startDate(formattedDate);
       tvo.setDo_endDate(formattedDate);
       tvo.setDo_startTime(formattedTime);
       tvo.setDo_endTime(formattedTime);
       System.out.println(Status);
        if(Status.equals("true")) {
        	dao.addScrap(vo);
        	dao.addTodo(tvo);
        	System.out.println("스크랩이 추가되었습니다.");
        }else {
        	dao.delScrap(vo);
        	dao.todoDelScrap(tvo);
        	System.out.println("스크랩이 취소되었습니다.");
        }
        // 출력해보기
        out.print(json);
     System.out.println("sendData > "+json);   
     
        return;
	}
	
	
	
	}


