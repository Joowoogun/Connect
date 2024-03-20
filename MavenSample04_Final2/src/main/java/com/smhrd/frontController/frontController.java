package com.smhrd.frontController;

import com.smhrd.controller.ClickContestinfo;
import com.smhrd.controller.Command;
import com.smhrd.controller.Join;
import com.smhrd.controller.Login;
import com.smhrd.controller.Logout;
import com.smhrd.controller.SelectAll;
import com.smhrd.controller.SelectScrapAll;
import com.smhrd.controller.SelectTodoAll;
import com.smhrd.controller.Update;
import com.smhrd.controller.addTodo;
import com.smhrd.controller.todoChageTitle;
import com.smhrd.controller.todoDel;
import com.smhrd.controller.todoTitle;
import com.smhrd.controller.userIdCheck;
import java.io.IOException;
import java.util.HashMap;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet({"*.do"})
public class frontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HashMap<String, Command> map = new HashMap();

	public void init() throws ServletException {
		this.map.put("Join.do", new Join());
		this.map.put("Login.do", new Login());
		this.map.put("SelectAll.do", new SelectAll());
		this.map.put("Logout.do", new Logout());
		this.map.put("Update.do", new Update());
		this.map.put("SelectTodoAll.do", new SelectTodoAll());
		this.map.put("userIdCheck.do", new userIdCheck());
		this.map.put("addTodo.do", new addTodo());
		this.map.put("SelectTodoAll.do", new SelectTodoAll());
		this.map.put("todoDel.do", new todoDel());
		this.map.put("todoTitle.do", new todoTitle());
		this.map.put("ClickContestInfo.do", new ClickContestinfo());
		this.map.put("todoTitle.do", new todoTitle());
	    this.map.put("todoChageTitle.do", new todoChageTitle());
	    this.map.put("SelectScrapAll.do", new SelectScrapAll());
		
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		String cp = request.getContextPath();
		String path = uri.substring(cp.length() + 1);
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String finalPath = null;
		Command com = (Command) this.map.get(path);
		if (path.startsWith("go")) {
			finalPath = path.replace("go", "").replace(".do", "");
		} else {
			finalPath = com.execute(request, response);
		}

		if (finalPath != null) {
			if (finalPath.contains("redirect:/")) {
				response.sendRedirect(finalPath.split("/")[1]);
			} else {
				RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/views/" + finalPath + ".jsp");
				rd.forward(request, response);
			}
		}

	}
}