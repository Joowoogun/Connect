package com.smhrd.controller;

import com.smhrd.database.DAO;
import com.smhrd.model.MemberVO;
import com.smhrd.model.TodolistVO;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SelectTodoAll implements Command {
   public String execute(HttpServletRequest request, HttpServletResponse response) {

      DAO dao = new DAO();
      List<TodolistVO> TodoList = dao.TodoAll();
      HttpSession session = request.getSession();
      MemberVO mvo = (MemberVO) session.getAttribute("profile");
      String id = mvo.getuserId();

      String title = null;
      String todoid = null;
      // 셀렉트 할때 본인의 아이디의 것만 남겨놓고 리스트에서 제거
      for (int i = 0; i < TodoList.size(); i++) {
         if (!TodoList.get(i).getUserId().equals(id)) {
            TodoList.remove(i);
            i--;
         }
      }
      // Todo에서 .equals 값으로 사용할 아이디를 추가로 넣어줌
      System.out.println("mvo id >> " + id);
      for (int i = 0; i < TodoList.size(); i++) {
         TodoList.get(i).setprofileId(id);
      }

      // Placeholder에 출력할 타이틀 이름 + 비교할 타이틀 이름이다.
      ArrayList<String> Titleset = new ArrayList<>();
      for (int i = 0; i < TodoList.size(); i++) {
         String result = TodoList.get(i).getTodoTitle();
         Titleset.add(i, result);
      }
      System.out.println("정렬 전: " + Titleset);
      // 리스트 정렬
      Collections.sort(Titleset);
       Collections.reverse(Titleset);
      // 리스트 안의 중복값을 제거후 다시 새로운리스트로 변경
      LinkedHashSet<String> set = new LinkedHashSet<>(Titleset);
        List<String> newTitleset = new ArrayList<>(set);
        // 내부의 데이터들 확인
      System.out.println("중복제거 + 정렬 후: " + newTitleset);
      
      title = newTitleset.get(0);

      System.out.println("PlaceHolder에 띄울 타이틀 마지막 확인 >> " + title);
      // 전체 정보리스트
      request.setAttribute("TodoList", TodoList);
      // 타이틀 한개
      request.setAttribute("TodoTitle", title);
      // option으로 띄울 타이틀리스트
      request.setAttribute("TodoOption", newTitleset);
      return "Todo";
      // 원하는 번호만 빼오고 싶다? 가설1) select -> where todotitle = 1, 2
      // 가설 2번 데이터를 불러와서 if

   }
}