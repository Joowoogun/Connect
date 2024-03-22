package com.smhrd.controller;

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
		DAO dao = new DAO();
		MemberVO resultVo = dao.login(vo);
		List<ContestVO> resultCon = dao.ClickContestInfo();
		List<ScrapListVO> resultScrap = dao.SelectScrapAll();
		System.out.println("불러온 스크랩 리스트 >> " + resultScrap);
		System.out.println(resultScrap.get(0).getConName());
		System.out.println(resultScrap.get(1).getConName());
		System.out.println(resultScrap.get(2).getConName());
		ArrayList<String> scrapconName = new ArrayList<String>();
		for (int i = 0; i < resultScrap.size(); i++) {
			scrapconName.add(resultScrap.get(i).getConName());
		}
		System.out.println("불러온 스크랩 리스의 conidx 값들 >> " + scrapconName);
		
		if (resultVo != null) {
			HttpSession session = request.getSession();
			session.setAttribute("profile", resultVo);
			session.setAttribute("conProfile", resultCon);
			session.setAttribute("scrapProfile", scrapconName);
		}
		

		return "redirect:/goindex.do";
	}
}