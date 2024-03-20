package com.smhrd.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.smhrd.model.ContestVO;
import com.smhrd.database.DAO;

public class ClickContestinfo implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		DAO dao = new DAO();
		List<ContestVO> ClickContestInfo = dao.ClickContestInfo();
		// 공모전 정보중 첫번째 인덱스에 저장된 값을 가지고옴
		int conNum = Integer.parseInt(request.getParameter("conNum"));
		request.setAttribute("contest", ClickContestInfo.get(conNum));
		return "contestEx";

	}
}
