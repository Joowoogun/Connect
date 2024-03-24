package com.smhrd.controller.scrap;

import java.util.ArrayList;
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
		  ScrapListVO svo = new ScrapListVO();
	      HttpSession session = request.getSession();
	      // 로그인한 userId가져오기
	      MemberVO mvo = (MemberVO) session.getAttribute("profile");
	      // selectscrapall할때 사용할 userId 설정 (로그인된걸로)
	      svo.setUserId(mvo.getuserId());
	      // userId가 일치하는 스크랩리스트 가지고오기
	      List<ScrapListVO> scrapList = dao.SelectScrapAll(svo);
	      // 공모전 제목 가지고오기
	      System.out.println("스크랩리스트 눌렀을때 null뜨냐? >> "+scrapList);
	      // 공모전 conIdx 가지고오기
	      List<ContestVO> ClickContestInfo = dao.ClickContestInfo();
	      
	      for (int i = 0; i < ClickContestInfo.size(); i++) {
	    	  System.out.println((i+1)+"몇 번째 >> "+ClickContestInfo.get(i).getConName());
	      }
	      
	      List<String> scrapconNamesList = new ArrayList<String>();
			for (int i = 0; i < scrapList.size(); i++) {
				scrapconNamesList.add(i, scrapList.get(i).getConName());
			}
	      
	      request.setAttribute("contest", ClickContestInfo);
	      request.setAttribute("scrapconNamesList", scrapconNamesList);
//	      String id = mvo.getuserId();
//	         // 셀렉트 할때 본인의 아이디의 것만 남겨놓고 리스트에서 제거
//	         for (int i = 0; i < scrapList.size()-1; i++) {
//	            if (!scrapList.get(i).getUserId().equals(id)) {
//	               scrapList.remove(i);
//	               i--;
//	         }
//	      }
	          System.out.println("보내지는 리스트 수 >> " + scrapList.size());
		
		request.setAttribute("scrapList", scrapList);
		return "Scrap";
	}

}
