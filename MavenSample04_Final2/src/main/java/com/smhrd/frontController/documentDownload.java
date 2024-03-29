package com.smhrd.frontController;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.Writer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.database.DAO;
import com.smhrd.model.DocumentVO;

@WebServlet("/documentDownload")
public class documentDownload extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    // 진입하나 확인해봐
	    System.out.println("ajax 다운로드 진입");
	    // 한글 인코딩
	    request.setCharacterEncoding("utf-8");
	    // 인덱스 번호 가져오기
	    int fileIdx = Integer.parseInt(request.getParameter("fileIdx"));
	    // 인덱스 번호가 맞는 자료의 전체를 불러오기(추가로 Mapper 안만들수있음.)
	    DAO dao = new DAO();
	    DocumentVO vo = dao.DocumentClick(fileIdx);
	    // 가져온 vo에서 파일이름과 데이터 가져오기
	    InputStream fileData = vo.getFileData();
	    String fileName = vo.getFileName();
	    
	    // 응답 헤더 설정
	    response.setContentType("application/octet-stream");
	    response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");

	    // 응답 출력 스트림 가져오기
	    OutputStream out = response.getOutputStream();

	    // 파일 데이터 읽어서 출력 스트림에 쓰기
	    byte[] buffer = new byte[4096];
	    int bytesRead;
	    while ((bytesRead = fileData.read(buffer)) != -1) {
	        out.write(buffer, 0, bytesRead);
	    }

	    // 스트림 닫기
	    fileData.close();
	    out.flush();
	    out.close();
	}

}
