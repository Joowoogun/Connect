package document;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.controller.Command;
import com.smhrd.database.DAO;
import com.smhrd.model.DocumentVO;
import com.smhrd.model.MemberVO;
import com.smhrd.model.TodolistVO;

public class documentWrite implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// 세션에서 현재 로그인 되어있는 아이디 가져오기
		HttpSession session = request.getSession();
	    MemberVO mvo = (MemberVO) session.getAttribute("profile");
	    String userId = mvo.getuserId();
	    DAO dao = new DAO();
		// form 에서 온 데이터 받아오기
		String PostTitle = request.getParameter("postTitle");
		String PostContent = request.getParameter("postContent");
		String PostFilename = request.getParameter("file");
		System.out.println("파일 이름 출력>> "+PostFilename);
		// work 라는 값을 같이보내 무슨 작업을 하는지 명확하게 전달가능.
		String Work = request.getParameter("work");
		// 파일 업로드 구현후 파일 이름을 넣을곳 임시로 temp 넣어둠
		PostFilename= "temp";
		// 값들중 null 이 없는지 확인하기위해 프린트문
		// dvo안에 값넣기 
		DocumentVO dvo = new DocumentVO();
		if(Work.equals("write")) {
			// 작성쪽에선 인덱스를 같이 안보내기 때문에 인덱스가 0 이면 그냥 작성만됨;
			// 작성 해야하는 정보들 
			dvo.setUserId(userId);
			dvo.setFileName(PostFilename);
			dvo.setDataContent(PostContent);
			dvo.setPostTitle(PostTitle);
			dao.DocumentAdd(dvo);
			// 작성완료후 목록으로 넘어간다.
			return "redirect:/documentSelect.do";
		}else if(Work.equals("edit")) {
			// 인덱스가 0이 아니면 동작하는 구역
			// 업데이트 구문에 사용될 값들.
			int fileIdx = Integer.parseInt(request.getParameter("fileIdx"));
			dvo.setFileIdx(fileIdx);
			dvo.setDataContent(PostContent);
			dvo.setPostTitle(PostTitle);
			// 업데이트 후 다시 불러오는 작업
			dao.DocumentEdit(dvo);
			dao.DocumentClick(fileIdx);
			// dvo 안에 인덱스 값이 있기때문에 불러오는 매퍼 사용가능
			request.setAttribute("DocumentView", dvo);
			// 뷰쪽의 마이베티스로 불러오는 Attribute 값을 통일해서 보내준다 documentView.java 에서 확인가능
			return "DocumentView";
		}else {
			return "redirect:/documentSelect.do";
		}
	}
}
