package com.smhrd.controller.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.controller.Command;
import com.smhrd.database.DAO;
import com.smhrd.model.MemberVO;

public class Mypage implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// <a>태그에 동봉된 유저아이디를 가져와서 DB에서 자료를 가져오기
		HttpSession session = request.getSession();
		MemberVO sessionvo = (MemberVO) session.getAttribute("profile");
		String userId = sessionvo.getuserId();
		MemberVO vo = new MemberVO();
		vo.setuserId(userId);
		DAO dao = new DAO();
		MemberVO resultvo = dao.GetProfile(vo);
		session.setAttribute("GetProfile", resultvo);
		return "page-mypage";
	}

}
