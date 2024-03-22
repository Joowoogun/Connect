package com.smhrd.controller.login;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;
import com.smhrd.controller.Command;
import com.smhrd.database.DAO;
import com.smhrd.model.MemberVO;

public class EmailCheck implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		// 1. 요청 데이터 꺼내오기(1개)
		String email = request.getParameter("email");
		
		// 2. DAO 생성
		DAO dao = new DAO();
		
		// 3. dao.check() 기능 사용하기
		// 4. 결과값 반환
		String result =dao.EmailCheck(email);
		System.out.println("조회결과 >> "+result);
		
		try {
			// try-catch가 필요한 이유는 ? 
			// >> response.getWritre() 메소드 안에 이미 IOException을 사용하려면
			// 예외 처리를 하라고 잡혀져 있기 때문이다.
			response.getWriter().print(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		return null;
	}
	

}
