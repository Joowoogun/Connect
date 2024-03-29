package com.smhrd.database;

import com.smhrd.model.MemberVO;
import com.smhrd.model.ScrapListVO;
import com.smhrd.model.ContestVO;
import com.smhrd.model.DocumentVO;
import com.smhrd.model.TodolistVO;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class DAO {
	private SqlSessionFactory factory = MySqlSessionManager.getSqlSessionFactory();
	

	// 선택한 옵션의 투두리스트만 불러오기
	   public List<TodolistVO> SelectTodoOption(TodolistVO vo){
	      SqlSession session = this.factory.openSession(true);
	      List<TodolistVO> resultList = session.selectList("SelectTodoOption",vo);
	      session.close();
	      return resultList;
	   }

	// 회원정보저장
	public int join(MemberVO vo) {
		int row = 0;
		try {
			SqlSession session = this.factory.openSession(true);
			row = session.insert("join", vo);
			session.close();
		} catch (Exception e) {
			row=0;
	}
		return row;
	}
	// 로그인기능
	public MemberVO login(MemberVO vo) {
		SqlSession session = this.factory.openSession(true);
		MemberVO resultVo = (MemberVO) session.selectOne("login", vo);
		session.close();
		return resultVo;
	}

	// 회원정보 전부 조회
	public List<MemberVO> selectAll() {
		SqlSession session = this.factory.openSession(true);
		List<MemberVO> resultList = session.selectList("selectAll");
		session.close();
		return resultList;
	}

	// 회원정보 수정
	public void update(MemberVO vo) {
		SqlSession session = this.factory.openSession(true);
		session.update("update", vo);
		session.close();
	}

	//Todolist 추가
	public List<TodolistVO> addTodo(TodolistVO vo) {
		SqlSession session = this.factory.openSession(true);
		List<TodolistVO> result = (List) session.selectOne("addTodo", vo);
		session.close();
		return result;
	}

	// Todolist 정보 불러오기 
	// 2024 03 24 수정 todolist userId 연동
	public List<TodolistVO> TodoAll(TodolistVO vo) {
		SqlSession session = this.factory.openSession(true);
		List<TodolistVO> resultList = session.selectList("TodoAll",vo);
		session.close();
		return resultList;
	}

	// 유저아이디 확인 (빨강 초록으로)
	public String userIdCheck(String userId) {
		SqlSession session = this.factory.openSession(true);
		String senduserId = (String) session.selectOne("userIdCheck", userId);
		session.close();
		return senduserId;
	}

	// todolist 삭제
	public void todoDel(TodolistVO vo) {
		SqlSession session = this.factory.openSession(true);
		session.delete("todoDel", vo);
		session.close();
	}
	
	public void todoDelScrap(TodolistVO vo) {
		SqlSession session = this.factory.openSession(true);
		session.delete("todoDelScrap", vo);
		session.close();
	}

	// 이메일체크하기 (빨강 초록)
	public String EmailCheck(String email) {
		// 1. 세션 빌려오기
		SqlSession session = factory.openSession(true);
		// 2. 세션 사용하기 -> select 구문 데이터 한개만 조회
		String result = session.selectOne("EmailCheck", email);
		// 3. 세션 반납하기
		session.close();
		// 4. 결과창 확인하기
		return result;

	}

	public void todoUpdate(TodolistVO vo) {
		SqlSession session = factory.openSession(true);
		session.update("todoUpdate", vo);
		session.close();
	}
	
	// 카테고리별 투두리스트 변환
	public List<TodolistVO> TodoTitle() {
		SqlSession session = this.factory.openSession(true);
		List<TodolistVO> resultList = session.selectList("TodoAll");
		session.close();
		return resultList;
	}
	
	public List<ContestVO> ClickContestInfo() {
		SqlSession session = this.factory.openSession(true);
		List<ContestVO> resultList = session.selectList("ClickContestInfo");
		session.close();
		return resultList;
	}
	
	   public void changeTodoTitle(TodolistVO vo) {
		      SqlSession session = factory.openSession(true);
		      session.update("changeTodoTitle", vo);
		      session.close();
		   }
	   
	public List<ScrapListVO> addScrap(ScrapListVO vo) {
		SqlSession session = this.factory.openSession(true);
		List<ScrapListVO> result = (List) session.selectOne("addScrap", vo);
		session.close();
		return result;
	}
	
	public void delScrap(ScrapListVO vo) {
		SqlSession session = factory.openSession(true);
		session.delete("delScrap", vo);
		session.close();
	}
	
	public List<ScrapListVO> SelectScrapAll(ScrapListVO vo) {
		SqlSession session = factory.openSession(true);
		List<ScrapListVO> resultList = session.selectList("SelectScrapAll", vo);
		session.close(); 
		return resultList;
	}
	
	public void TodoContentUpdate(TodolistVO vo) {
	      SqlSession session = factory.openSession(true);
	       session.update("TodoContentUpdate", vo);
	       session.close();
	      }

	public void calUpdate(TodolistVO vo) {
		SqlSession session = factory.openSession(true);
		session.update("calUpdate", vo);
		session.close();
	}
	
	public void caltodoUpdate(TodolistVO cvo) {
		SqlSession session = factory.openSession(true);
		session.update("caltodoUpdate", cvo);
		session.close();
	}
	
	public void DocumentAdd(DocumentVO vo) {
        SqlSession session = factory.openSession(true);
        session.insert("DocumentAdd", vo);
        session.close();
     }

     public List<DocumentVO> DocumentSelect(String userId) {
        SqlSession session = this.factory.openSession(true);
        List<DocumentVO> resultList = session.selectList("DocumentSelect", userId);
        session.close();
        return resultList;
     }

     public DocumentVO DocumentClick(int fileIdx) {
        SqlSession session = this.factory.openSession(true);
        DocumentVO result = session.selectOne("DocumentClick", fileIdx);
        session.close();
        return result;

     }

     public void DocumentEdit(DocumentVO vo) {
        SqlSession session = factory.openSession(true);
        session.update("DocumentEdit", vo);
        session.close();
     }
     
     public void DocumentfileEdit(DocumentVO vo) {
        SqlSession session = factory.openSession(true);
        session.update("DocumentfileEdit", vo);
        session.close();
     }
     
     
     public void DocumentDelete(int vo) {
        SqlSession session = this.factory.openSession(true);
        session.delete("DocumentDelete", vo);
        session.close();
     }
     // 딜리트 라고 써잇지만 실제로는 null 로 업데이트 하는 기능이다.
     public void DocumentfileDelete(int vo) {
        SqlSession session = this.factory.openSession(true);
        session.update("DocumentfileDelete", vo);
        session.close();
     }

	public void caltodoDel(TodolistVO cvo) {
		SqlSession session = this.factory.openSession(true);
	      session.delete("caltodoDel", cvo);
	      session.close();		
	}
}