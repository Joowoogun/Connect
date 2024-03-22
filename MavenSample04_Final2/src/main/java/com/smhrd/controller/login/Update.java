package com.smhrd.controller.login;

import com.smhrd.controller.Command;
import com.smhrd.database.DAO;
import com.smhrd.model.MemberVO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Update implements Command {
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String pw = request.getParameter("pw");
		String userImg = request.getParameter("userImg");
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		HttpSession session = request.getSession();
		MemberVO sessionvo = (MemberVO) session.getAttribute("profile");
		String userId = sessionvo.getuserId();
		MemberVO vo = new MemberVO();
		vo.setuserId(userId);
		vo.setPw(pw);
		vo.setUserImg(userImg);
		vo.setaddress(address);
		vo.setEmail(email);
		DAO dao = new DAO();
		dao.update(vo);
		request.getSession().setAttribute("profile", vo);
		return "redirect:/gomain.do";
	}
}