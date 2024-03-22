package com.smhrd.controller.scrap;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.controller.Command;
import com.smhrd.database.DAO;
import com.smhrd.model.ContestVO;
import com.smhrd.model.MemberVO;
import com.smhrd.model.ScrapListVO;

public class SelectScrapAll implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		DAO dao = new DAO();
	      List<ScrapListVO> scrapList = dao.SelectScrapAll();

	      HttpSession session = request.getSession();
	      MemberVO mvo = (MemberVO) session.getAttribute("profile");
	      String conName = request.getParameter("conName");
	      int conNum = Integer.parseInt(request.getParameter("conNum"));
	      System.out.println("SelectScarpAll >> "+conName);
	      System.out.println("SelectScarpAll >> "+conNum);
	      List<ContestVO> ClickContestInfo = dao.ClickContestInfo();
	      for (int i = 0; i < ClickContestInfo.size(); i++) {
	    	  System.out.println((i+1)+"몇 번째 >> "+ClickContestInfo.get(i).getConName());
	      }
	      
	      request.setAttribute("contest", ClickContestInfo);
	      
	      String id = mvo.getuserId();
	         // 셀렉트 할때 본인의 아이디의 것만 남겨놓고 리스트에서 제거
	         for (int i = 0; i < scrapList.size()-1; i++) {
	            if (!scrapList.get(i).getUserId().equals(id)) {
	               scrapList.remove(i);
	               i--;
	         }
	      }
	          System.out.println("보내지는 리스트 수 >> " + scrapList.size());
		
		request.setAttribute("scrapList", scrapList);
		
		return "Scrap";
	}

}
