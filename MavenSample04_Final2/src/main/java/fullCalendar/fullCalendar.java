package fullCalendar;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.controller.Command;
import com.smhrd.database.DAO;
import com.smhrd.model.MemberVO;
import com.smhrd.model.TodolistVO;

public class fullCalendar implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		// userId profile session으로 가지고오기
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("profile");
		
		//  userId를 통해 로그인한 아이디의 todolist 불러오기
		TodolistVO tvo = new TodolistVO();
		tvo.setUserId(mvo.getuserId());
		DAO dao = new DAO();
		
		// calData에 todolist 주솟값들 모두 가져오기
		List<TodolistVO> calData = dao.TodoAll(tvo);
		
		// todolist의 title만 calTitle에 모아주기
		List<String> calTitle = new ArrayList<String>();
		for (int i = 0; i < calData.size(); i++) {
			calTitle.add(i, calData.get(i).getTodoTitle());
		}
		
		// 모아온 todoTitle 중복 제거 작업
		Collections.sort(calTitle);
	    Collections.reverse(calTitle);
	    
	    // sortcalTitle에 넣어서 fullcalendar에 전송
	    LinkedHashSet<String> set = new LinkedHashSet<>(calTitle);
	    List<String> sortcalTitle = new ArrayList<>(set);
	        
	    // 캘린더에 띄울 todolist내용 (fullcalendar쪽 넘어가서 foreach로 추출후 event에 붙여넣기)
		request.setAttribute("calData", calData);
		// 캘린더에 띄울 select option (foreach 사용 todo랑 동일)
		request.setAttribute("calTitle", sortcalTitle);
		
		return "Calendar";
	}

}
