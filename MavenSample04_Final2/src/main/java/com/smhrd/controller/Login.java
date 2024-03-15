package com.smhrd.controller;

import com.smhrd.database.DAO;
import com.smhrd.model.MemberVO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Login implements Command {
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String userId = request.getParameter("userId");
		String pw = request.getParameter("pw");
		MemberVO vo = new MemberVO();
		vo.setuserId(userId);
		vo.setPw(pw);
		DAO dao = new DAO();
		MemberVO resultVo = dao.login(vo);
		if (resultVo != null) {
			HttpSession session = request.getSession();
			session.setAttribute("profile", resultVo);
		}

		return "redirect:/gomain.do";
	}
}