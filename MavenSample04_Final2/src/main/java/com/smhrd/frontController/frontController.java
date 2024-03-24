package com.smhrd.frontController;

import com.smhrd.controller.Command;
import com.smhrd.controller.contest.ClickContestInfo;
import com.smhrd.controller.login.Join;
import com.smhrd.controller.login.Login;
import com.smhrd.controller.login.Logout;
import com.smhrd.controller.login.Update;
import com.smhrd.controller.scrap.SelectScrapAll;
import com.smhrd.controller.todo.SelectTodoAll;
import com.smhrd.controller.todo.addTodo;
import com.smhrd.controller.todo.todoChageTitle;
import com.smhrd.controller.todo.todoContentEdit;
import com.smhrd.controller.todo.todoTitle;

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
		this.map.put("Logout.do", new Logout());
		this.map.put("Update.do", new Update());
		this.map.put("SelectTodoAll.do", new SelectTodoAll());
		this.map.put("addTodo.do", new addTodo());
		this.map.put("SelectTodoAll.do", new SelectTodoAll());
		this.map.put("todoTitle.do", new todoTitle());
		this.map.put("ClickContestInfo.do", new ClickContestInfo());
		this.map.put("todoTitle.do", new todoTitle());
	    this.map.put("todoChageTitle.do", new todoChageTitle());
	    this.map.put("SelectScrapAll.do", new SelectScrapAll());
	    this.map.put("todoContentEdit.do", new todoContentEdit());
		
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