package document;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.controller.Command;
import com.smhrd.database.DAO;
import com.smhrd.model.DocumentVO;

public class documentDelete implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		int fileIdx = Integer.parseInt(request.getParameter("fileIdx"));
		String work = request.getParameter("work");
		DAO dao = new DAO();
		  // 게시물을 통째로 지우는 기능
		if(work.equals("postDelete")) {
			dao.DocumentDelete(fileIdx);
			return "redirect:/documentSelect.do";
			// 파일만 제거하는 기능 실제로는 update문이다.
		}else if(work.equals("fileDelete")){
			// 기능 작동
			dao.DocumentfileDelete(fileIdx);
			// DocumentEdit 페이지는 불러올때 세션에 저장된 idx의 값을 가져와서 출력하기 때문에 해준다.
			DocumentVO vo =dao.DocumentClick(fileIdx);
			request.setAttribute("DocumentView", vo);
			return "DocumentEdit";
		}else {
			return "redirect:/documentSelect.do";
		}
	}

}
