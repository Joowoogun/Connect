package com.smhrd.controller.contest;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.smhrd.model.ContestVO;
import com.smhrd.model.ScrapListVO;
import com.smhrd.controller.Command;
import com.smhrd.database.DAO;

public class ClickContestInfo implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		// conIdx가 index에 2개존재
		// index에서 conIdx는 contestinfo로부터 가지고온것
		// scrap에서 conIdx는 scrapList로부터 가지고온것
		// index에서 공모전을 클릭하든 scrap에서 공모전을 클릭하든 알아서 정보가 들어가게한것
		DAO dao = new DAO();
		String userId = request.getParameter("userId");
		int conIdx = Integer.parseInt(request.getParameter("conIdx"));
		try {
			System.out.println(conIdx);
		} catch (Exception e) {
			System.out.println("스크랩버튼을 눌렀을떄 불러올 conidx가 없습니다.");
		}
		ScrapListVO svo = new ScrapListVO();
		svo.setUserId(userId);
		List<ScrapListVO> scrapList = dao.SelectScrapAll(svo);
		
		// scrapconNamesList에 scrap이 되어있는 공모전 이름들을 담아줌
		List<String> scrapconNamesList = new ArrayList<String>();
		for (int i = 0; i < scrapList.size(); i++) {
			scrapconNamesList.add(i, scrapList.get(i).getConName());
		}
		List<ContestVO> ClickContestInfo = dao.ClickContestInfo();
		request.setAttribute("contest", ClickContestInfo.get(conIdx-1));
		request.setAttribute("scrapconNamesList", scrapconNamesList);
		return "crawling";
		
	}
}
