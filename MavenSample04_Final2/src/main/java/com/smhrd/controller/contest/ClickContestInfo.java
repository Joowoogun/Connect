package com.smhrd.controller.contest;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.smhrd.model.ContestVO;
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
		String conName = request.getParameter("conName");
		System.out.println(conName);
		int conIdx = Integer.parseInt(request.getParameter("conIdx"));
		System.out.println(conIdx);
		List<String> conNamesList = new ArrayList<>();
		for (int i = 0; ; i++) {
		    String conNames = request.getParameter("scrapconName" + i);
		    if (conNames == null) {
		        break;
		    }
		    conNamesList.add(conNames);
		}
		System.out.println("conNamesList >> "+conNamesList);
		List<ContestVO> ClickContestInfo = dao.ClickContestInfo();
		System.out.println(conIdx);
		request.setAttribute("contest", ClickContestInfo.get(conIdx-1));
		request.setAttribute("scrapconNames", conNamesList);
		System.out.println("쿠크냐 아브냐 >> " + ClickContestInfo.get(conIdx-1));
		return "contestEx";
		
	}
}
