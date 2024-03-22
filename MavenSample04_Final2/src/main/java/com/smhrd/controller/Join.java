package com.smhrd.controller;

import com.smhrd.database.DAO;
import com.smhrd.model.MemberVO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Join implements Command {
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String userName = request.getParameter("userName");
		String userId = request.getParameter("userId");
		String pw = request.getParameter("pw");
		String userImg = request.getParameter("userImg");
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		MemberVO vo = new MemberVO(userName, userId, pw, userImg, address, email);
		DAO dao = new DAO();
		int row = dao.join(vo);
		if (row > 0) {
			request.setAttribute("userId", userId);
			return "index";
		} else {
			return "redirect:/gopage-register.do";
		}
	}
}