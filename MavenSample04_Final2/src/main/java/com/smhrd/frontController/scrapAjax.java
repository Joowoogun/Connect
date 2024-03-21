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
import com.smhrd.model.ScrapListVO;

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
		System.out.println("Status 출력 >> "+Status);
		PrintWriter out = response.getWriter();
		//Status에 넣어서 데이터값 저장
		request.setAttribute("Status", Status);
		Gson gson = new Gson();
        // 도구 사용하기
       String json = gson.toJson(Status);
        DAO dao = new DAO();
       ScrapListVO vo = new ScrapListVO(userId, conIdx);
       System.out.println(Status);
        if(Status.equals("true")) {
        	dao.addScrap(vo);
        }else {
        	dao.delScrap(vo);
        }
        // 출력해보기
        out.print(json);
     System.out.println("sendData > "+json);   
     
        return;
	}
	
	
	
	}


