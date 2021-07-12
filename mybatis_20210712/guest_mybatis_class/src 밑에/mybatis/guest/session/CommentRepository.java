package mybatis.guest.session;

import java.io.*;
import java.util.*;

import mybatis.guest.model.Comment;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.*;



public class CommentRepository 
{
	//	private final String namespace = "CommentMapper";

	private SqlSessionFactory getSqlSessionFactory() {
		
		InputStream inputStream;
		try {
			inputStream = Resources.getResourceAsStream("mybatis-config.xml");
		} catch (IOException e) {
			throw new IllegalArgumentException(e);
		}
		// 클래스를 공장처럼 만드는 SqlSessionFactory
		// 세션을 만드는 SqlSessionFactoryBuilder()
		SqlSessionFactory sessFactory =  new SqlSessionFactoryBuilder().build(inputStream);
		return sessFactory;
	}
	 
	
//	public List<Comment> selectComment(){
//		SqlSession sqlSess = getSqlSessionFactory().openSession();
//		try {
//			String statement = "CommentMapper.selectComment";
//			return sqlSess.selectList(statement);
//		}finally { 
//			sqlSess.close();
//		}
//	}
	

	public List<Comment> selectComment(HashMap map){
		SqlSession sqlSess = getSqlSessionFactory().openSession();
		try {
			String statement = "CommentMapper.selectComment";
			return sqlSess.selectList(statement, map);
		}finally { 
			sqlSess.close();
		}
	}
	
	
	
	public Integer insertComment(Comment c) {
		// 연결을 담당하는
		// 우리가 그동안 JDBC에서 connectoin 이라고 불렀던 것이
		// mybatis 에서는 sqlSession이다.
		SqlSession sqlSess = getSqlSessionFactory().openSession();
		// ▲ 세션을 하나 얻어온다.
		try {
			// 매퍼 이름이 딱 맞아야 한다. ▼
			String statement = "CommentMapper.insertComment";
			int result = sqlSess.insert(statement,c);
			// ********************************
			// JDBC 는 오토커밋이었지만, Mybatis 는 따로 commit 해주어야 한다.
			if(result > 0) {
				sqlSess.commit();
			}else {
				sqlSess.rollback();
			}
			return result;
		}finally {
			sqlSess.close();
		}
		
	}
	
	
	
	// 방법 1
//	public Comment selectCommentByPK(long commentNo) {
//		SqlSession sqlSess = getSqlSessionFactory().openSession();
//		try {
//			return sqlSess.selectOne("CommentMapper.selectCommentByPK",commentNo);
//		}finally {
//			sqlSess.close();
//		}
//	}
	
	
	// 방법 2
	public Comment selectCommentByPK(long commentNo) {
		SqlSession sqlSess = getSqlSessionFactory().openSession();
		try {
			HashMap map = new HashMap();
			map.put("commentNo", commentNo);
			return sqlSess.selectOne("CommentMapper.selectComment",map);
		}finally {
			sqlSess.close();
		}
	}

	
	
	public Comment delectCommentByPK(long commentNo) {
		SqlSession sqlSess = getSqlSessionFactory().openSession();
		try {
			return sqlSess.selectOne("CommentMapper.delectCommentByPK",commentNo);
		}finally {
			sqlSess.close();
		}
	}

	
	
	public Comment modifyComment(long commentNo) {
		SqlSession sqlSess = getSqlSessionFactory().openSession();
		try {
			return sqlSess.selectOne("CommentMapper.modifyComment",commentNo);
		}finally {
			sqlSess.close();
		}
	}
	
	
	public List<HashMap> selectEmployee(){
		SqlSession sqlSess = getSqlSessionFactory().openSession();
		try {
			String statement = "EmployeeMapper.empSelect";
			return sqlSess.selectList(statement);
		}finally { 
			sqlSess.close();
		}
	}
	
	
	
}
