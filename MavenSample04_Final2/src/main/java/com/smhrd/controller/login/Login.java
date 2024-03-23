package com.smhrd.controller.login;

import com.smhrd.controller.Command;
import com.smhrd.database.DAO;
import com.smhrd.model.ContestVO;
import com.smhrd.model.MemberVO;
import com.smhrd.model.ScrapListVO;

import java.util.ArrayList;
import java.util.List;

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
		ScrapListVO svo = new ScrapListVO();
		svo.setUserId(userId);
		DAO dao = new DAO();
		MemberVO resultVo = dao.login(vo);
		List<ContestVO> resultCon = dao.ClickContestInfo();
		System.out.println(resultCon);
		List<ScrapListVO> resultScrap = dao.SelectScrapAll(svo);
		System.out.println("로그인할때 불러온 스크랩리스트 주소 >> "+resultScrap);
//		System.out.println("불러온 스크랩 리스트 >> " + resultScrap);
		
		if (resultVo != null) {
			HttpSession session = request.getSession();
			session.setAttribute("profile", resultVo);
			session.setAttribute("conProfile", resultCon);
			session.setAttribute("scrapProfile", resultScrap);
			// id pw 일치하면 index(공모전페이지로)
			return "redirect:/goindex.do";
		}else {
			// id pw 일치하지않으면 다시 로그인페이지로
			return "redirect:/gopage-login.do";
		}
		

	}
}