package com.smhrd.controller;

import com.smhrd.database.DAO;
import com.smhrd.model.TodolistVO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class todoDel implements Command {
   public String execute(HttpServletRequest request, HttpServletResponse response) {
      String content = request.getParameter("txt");
      int todoIdx = Integer.parseInt(request.getParameter("todoId"));
      TodolistVO vo = new TodolistVO(content, todoIdx);
      DAO dao = new DAO();
      dao.todoDel(vo);
      dao.TodoAll();
      return "redirect:/SelectTodoAll.do";
   }
}