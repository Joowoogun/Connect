package com.smhrd.database;

import com.smhrd.model.MemberVO;
import com.smhrd.model.TodolistVO;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class DAO {
	private SqlSessionFactory factory = MySqlSessionManager.getSqlSessionFactory();

	public int join(MemberVO vo) {
		SqlSession session = this.factory.openSession(true);
		int row = session.insert("join", vo);
		session.close();
		return row;
	}

	public MemberVO login(MemberVO vo) {
		SqlSession session = this.factory.openSession(true);
		MemberVO resultVo = (MemberVO) session.selectOne("login", vo);
		session.close();
		return resultVo;
	}

	public List<MemberVO> selectAll() {
		SqlSession session = this.factory.openSession(true);
		List<MemberVO> resultList = session.selectList("selectAll");
		session.close();
		return resultList;
	}

	public void update(MemberVO vo) {
		SqlSession session = this.factory.openSession(true);
		session.update("update", vo);
		session.close();
	}

	public List<TodolistVO> addTodo(TodolistVO vo) {
		SqlSession session = this.factory.openSession(true);
		List<TodolistVO> result = (List) session.selectOne("addTodo", vo);
		session.close();
		return result;
	}

	public List<TodolistVO> TodoAll() {
		SqlSession session = this.factory.openSession(true);
		List<TodolistVO> resultList = session.selectList("TodoAll");
		session.close();
		return resultList;
	}

	public String userIdCheck(String userId) {
		SqlSession session = this.factory.openSession(true);
		String senduserId = (String) session.selectOne("userIdCheck", userId);
		session.close();
		return senduserId;
	}

	public void todoDel(TodolistVO vo) {
		SqlSession session = this.factory.openSession(true);
		session.delete("todoDel", vo);
		session.close();
	}

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
}