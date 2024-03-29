package document;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.smhrd.controller.Command;
import com.smhrd.database.DAO;
import com.smhrd.model.DocumentVO;
import com.smhrd.model.MemberVO;

public class documentWrite implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("uft-8");
		
		// 세션에서 현재 로그인 되어있는 아이디 가져오기
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("profile");
		String userId = mvo.getuserId();
		DAO dao = new DAO();
		// form 에서 온 데이터 받아오기

		// 파일 업로드 관련 변수 및 가져오는방법
		Part filePart;
		InputStream fileData = null;
		String PostfileName = null;
		try {
			filePart = request.getPart("file");
			PostfileName = getFileName(filePart);
			System.out.println("파일 이름 >> "+ PostfileName);
			fileData = filePart.getInputStream();
			System.out.println("파일 데이터 >> "+fileData);

		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("file에서 받아오지못해요");
		} catch (ServletException e) {
			e.printStackTrace();
		}
		// 
		String PostTitle = request.getParameter("postTitle");
		String PostContent = request.getParameter("postContent");
		// work 라는 값을 같이보내 무슨 작업을 하는지 명확하게 전달가능.
		String Work = request.getParameter("work");
		// 값들중 null 이 없는지 확인하기위해 프린트문
		// dvo안에 값넣기
		DocumentVO dvo = new DocumentVO();
		if (Work.equals("write")) {
			// 작성쪽에선 인덱스를 같이 안보내기 때문에 인덱스가 0 이면 그냥 작성만됨;
			// 작성 해야하는 정보들
			dvo.setUserId(userId);
			dvo.setFileName(PostfileName);
			dvo.setDataContent(PostContent);
			dvo.setPostTitle(PostTitle);
			dvo.setFileData(fileData);
			dao.DocumentAdd(dvo);
			// 작성완료후 목록으로 넘어간다.
			return "redirect:/documentSelect.do";
		} else if (Work.equals("edit")) {
			// 인덱스가 0이 아니면 동작하는 구역
			// 업데이트 구문에 사용될 값들.
			int fileIdx = Integer.parseInt(request.getParameter("fileIdx"));
			dvo.setFileIdx(fileIdx);
			dvo.setDataContent(PostContent);
			dvo.setPostTitle(PostTitle);
			// 업데이트 메소드
			System.out.println("filedata 확인용 "+fileData);
			if(PostfileName==null) {
				// 변경할 파일 데이터가 없으면 그냥 텍스트및 제목만 업데이트
				System.out.println("파일변경 X");
				dao.DocumentEdit(dvo);
			}else {
				// 변경할 파일 데이터가 있으면 dvo에 추가로 저장하여 파일업데이트 실행.
				System.out.println("파일변경 O");
				dvo.setFileName(PostfileName);
				dvo.setFileData(fileData);
				dao.DocumentfileEdit(dvo);
			}
			// 수정한 페이지로 이동하기 위해 현재 idx활용하여 값을 다시 불러온다음 view로 넘어간다.
			DocumentVO vo =dao.DocumentClick(fileIdx);
			// dvo 안에 인덱스 값이 있기때문에 불러오는 매퍼 사용가능
			request.setAttribute("DocumentView", vo);
			// 뷰쪽의 마이베티스로 불러오는 Attribute 값을 통일해서 보내준다 documentView.java 에서 확인가능
			return "DocumentView";
		}
		else {
			return "redirect:/documentSelect.do";
		}

	}

	// 파일 업로드시 이름 가져오는 메소드
	private String getFileName(Part part) {
		for (String content : part.getHeader("content-disposition").split(";")) {
			if (content.trim().startsWith("filename")) {
				return content.substring(content.indexOf("=") + 1).trim().replace("\"", "");
			}
		}
		return null;

	}
}