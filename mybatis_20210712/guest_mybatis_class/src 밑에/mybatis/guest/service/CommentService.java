package mybatis.guest.service;

import java.util.*;

import mybatis.guest.model.Comment;
import mybatis.guest.session.CommentRepository;

public class CommentService {
	
	/*싱글톤패턴*/
	private static CommentService service;
	
	/*싱글톤패턴*/
	private CommentService() { }
	
	public static CommentService getInstance(){
		if( service == null) service = new CommentService();
		return service;
	}
	
	/*CommentRepository 가져오기*/
	CommentRepository repo = new CommentRepository();
	
	
	public Integer insertComment(Comment c) {
		return repo.insertComment(c);
	}
	
	
	// 1번 방법
//	public List<Comment> selectComment()
//	{
//		return repo.selectComment();
//	}
	 
	// 2번 방법
	public List<Comment> selectComment(HashMap map)
	{
		return repo.selectComment(map);
	}
	 
	// 1번 방법
	public Comment selectCommentByPK(long commentNo) {
		return repo.selectCommentByPK(commentNo);
	}

	
	
	
	public Comment delectCommentByPK(long commentNo) {
		return repo.delectCommentByPK(commentNo);
	}
	
	public Comment modifyComment(long commentNo) {
		return repo.modifyComment(commentNo);
	}
		
	public HashMap selectEmployee() {
		return (HashMap) repo.selectEmployee(); 
	}
	
}