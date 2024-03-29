package document;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.controller.Command;
import com.smhrd.database.DAO;

public class documentDelete implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		int fileIdx = Integer.parseInt(request.getParameter("fileIdx"));
		DAO dao = new DAO();
		dao.DocumentDelete(fileIdx);
		return "redirect:/documentSelect.do";
	}

}
