package document;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.controller.Command;
import com.smhrd.database.DAO;
import com.smhrd.model.DocumentVO;
import com.smhrd.model.MemberVO;

public class documentSelect implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// 세션에 저장된 현재 로그인된 아이디 불러오기
		HttpSession session = request.getSession();
	    MemberVO mvo = (MemberVO) session.getAttribute("profile");
	    String userId = mvo.getuserId();
	    // DAO 를 활용하여 메퍼활용 DB에서 정보가져오기 유저가 작성한 전체 게시글을 불러온다.
		DAO dao = new DAO();
		List<DocumentVO> list = dao.DocumentSelect(userId);
		request.setAttribute("DocumentList", list);
		
		return "Document";
	}

}
