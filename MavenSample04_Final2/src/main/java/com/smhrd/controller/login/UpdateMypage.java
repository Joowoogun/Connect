package com.smhrd.controller.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.controller.Command;
import com.smhrd.database.DAO;
import com.smhrd.model.MemberVO;

public class UpdateMypage implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String userId = request.getParameter("userId");
		String UpdateEmail = request.getParameter("UpdateEmail");
		String UpdatePassword = request.getParameter("UpdatePassword");
		String UpdateAddress = request.getParameter("UpdateAddress");
		if(UpdatePassword.equals("")) {
			// 비밀번호 입력안할경우 현재 아이디의 비밀번호를 그대로 넣어줘 null 값이 없게한다.
			MemberVO sessionvo = (MemberVO) session.getAttribute("profile");
			UpdatePassword = sessionvo.getPw();
		}
		// 업데이트할 정보들을 VO에 넣어준다.
		MemberVO vo = new MemberVO(null, userId, UpdatePassword, null, UpdateAddress, UpdateEmail);
		// 업데이트후 다시 Mypage 가는 클래스로 돌아간다.
		DAO dao = new DAO();
		dao.update(vo);
		return "redirect:/Mypage.do";
	}

}
