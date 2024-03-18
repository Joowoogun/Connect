package com.smhrd.database;

import com.smhrd.model.MemberVO;
import com.smhrd.model.TodolistVO;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class DAO {
	private SqlSessionFactory factory = MySqlSessionManager.getSqlSessionFactory();

	// 회원정보저장
	public int join(MemberVO vo) {
		SqlSession session = this.factory.openSession(true);
		int row = session.insert("join", vo);
		session.close();
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
	public List<TodolistVO> TodoAll() {
		SqlSession session = this.factory.openSession(true);
		List<TodolistVO> resultList = session.selectList("TodoAll");
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
}