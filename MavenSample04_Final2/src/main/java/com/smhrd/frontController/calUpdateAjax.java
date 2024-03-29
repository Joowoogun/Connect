package com.smhrd.frontController;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.smhrd.database.DAO;
import com.smhrd.model.TodolistVO;

@WebServlet("/calUpdateAjax")
public class calUpdateAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setCharacterEncoding("UTF-8");
		
		String do_startDate = request.getParameter("do_startDate");
	    String do_endDate = request.getParameter("do_endDate");
	    String do_Status = request.getParameter("do_Status");
	    String content =request.getParameter("content");
	    int calIdx = Integer.parseInt(request.getParameter("id"));
	    String do_startTime = request.getParameter("do_startTime");
	    String do_endTime = request.getParameter("do_endTime");
	    String todoTitle = request.getParameter("todoTitle");
	
	    TodolistVO cvo = new TodolistVO();
	    cvo.setTodoTitle(todoTitle);
	    cvo.setContent(content);
	    cvo.setTodoIdx(calIdx);
	    cvo.setDo_startDate(do_startDate);
	    cvo.setDo_endDate(do_endDate);
	    cvo.setDo_Status(do_Status);
	    cvo.setDo_startTime(do_startTime);
	    cvo.setDo_endTime(do_endTime);
	    
	    System.out.println("잘담겨있니? >> "+cvo);
	    
	    DAO dao = new DAO();
	    if(content==null) {
	    	dao.caltodoDel(cvo);
	    }else {
	    	dao.caltodoUpdate(cvo);
	    }
	
	    PrintWriter out = response.getWriter();
	
	    Gson gson = new Gson();
        // 도구 사용하기
       String json = gson.toJson(cvo.getTodoTitle());
        
        // 출력해보기
        out.print(json);
     System.out.println("sendData > "+json);   
     
        return;
	
	
	
	}

}
