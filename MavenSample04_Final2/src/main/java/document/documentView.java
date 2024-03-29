package document;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.Session;
import com.smhrd.controller.Command;
import com.smhrd.database.DAO;
import com.smhrd.model.DocumentVO;

public class documentView implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		// A태그에 게시글 인덱스만 가져와서 DB로 보내 정보 가져오기
		int fileIdx = Integer.parseInt(request.getParameter("fileIdx"));
		// 무슨 작업을 하는지 알려주는 work 가져오기
		String Work = request.getParameter("work");
		// 하나의 DAO 문 만 사용하여 View 와 Edit 에 보여지는 값 둘다 활용
		DAO dao = new DAO();
		DocumentVO vo =  dao.DocumentClick(fileIdx);
		
		request.setAttribute("DocumentView", vo);
		// Edit 쪽에서만 아이디를 같이 보내기 때문에 처음 게시글 선택할때는 View로 가진다
		if(Work.equals("view")) {
			return "DocumentView";
		}
			return "DocumentEdit";
	}

}
