package com.smhrd.controller;

import com.smhrd.database.DAO;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class userIdCheck implements Command {
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String userId = request.getParameter("userId");
		DAO dao = new DAO();
		String result = dao.userIdCheck(userId);

		try {
			response.getWriter().print(result);
		} catch (IOException var7) {
			var7.printStackTrace();
		}

		return null;
	}
}