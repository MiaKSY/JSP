
// **********************************************************
// **********************************************************
// MVC 패턴 공부하는 중입니다. SERVICE를 이용해서 한번 거쳐서 하세요!
// **********************************************************
// **********************************************************


package guest.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class MessageDao {

	// Single Pattern 
	private static MessageDao instance;
	
	// DB 연결시  관한 변수 
	private static final String 	dbDriver	=	"oracle.jdbc.driver.OracleDriver";
	private static final String		dbUrl		=	"jdbc:oracle:thin:@127.0.0.1:1521:xe";
	private static final String		dbUser		=	"hr";
	private static final String		dbPass		=	"1234";
	
	
	
	//--------------------------------------------
	//#####	 객체 생성하는 메소드 
	public static MessageDao	getInstance() throws MessageException
	{
		if( instance == null )
		{
			instance = new MessageDao();
		}
		return instance;
	}
	
	private MessageDao() throws MessageException
	{
	
		try{
			
			/********************************************
				1. 오라클 드라이버를 로딩
					( DBCP 연결하면 삭제할 부분 )
			*/
			Class.forName(dbDriver);

		}catch( Exception ex ){
			throw new MessageException("방명록 ) DB 연결시 오류  : " + ex.toString() );	
		}
		
	}
	
	
	/*
	 * 메세지를 입력하는 함수
	 */
	public int insert(Message rec) throws MessageException
	{
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		try{

			// 1. 연결객체(Connection) 얻어오기
			con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			// 2. sql 문장 만들기
			// 시퀀스
			String sql= "INSERT INTO guesttb(MESSAGE_ID, GUEST_NAME, PASSWORD, MESSAGE) VALUES(seq_guestTb_messageId.nextval,?,?,?)";
			// 3. 전송객체 얻어오기
			ps = con.prepareStatement(sql);
			ps.setString(1, rec.getGuestName());
			ps.setString(2, rec.getPassword());
			ps.setString(3, rec.getMessage());
			// 4. 전송하기
			result = ps.executeUpdate();
		
				
		}catch( Exception ex ){
			throw new MessageException("방명록 ) DB에 입력시 오류  : " + ex.toString() );	
		} finally{
			if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }
			if( con  != null ) { try{ con.close(); } catch(SQLException ex){} }
		}
		return result;
	
	}
	
	/*
	 * 메세지 목록 전체를 얻어올 때
	 */
	public List<Message> selectList() throws MessageException
	{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Message> mList = new ArrayList<Message>();
		boolean isEmpty = true;
		
		try{
			// 1. Connection 얻어오기
			con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			// 2. SQL 문장 쓰기
			String sql = "SELECT * FROM guesttb ORDER BY 1";
			// 3. 전송객체
			ps = con.prepareStatement(sql);
			// 4. 전송
			rs = ps.executeQuery();

			// if 문을 쓰지 않고 while 문을 쓰는 이유? 
			// 다음줄이 true 면 수행하고, false 면 그만두기 위해서
			while(rs.next())
			{
				Message msg = new Message();
				
				msg.setMessageId(rs.getInt("MESSAGE_ID"));
				msg.setGuestName(rs.getString("GUEST_NAME"));
				msg.setPassword(rs.getString("PASSWORD"));
				msg.setMessage(rs.getString("MESSAGE"));
						
				// 블럭 안에서 만든 것은 블럭이 끝나는 순간 사라진다. 
				// 그러니까 외부에 저장을 해준다.
				mList.add(msg);
			}
			
			// if 문만 쓰고, if-else 를 쓰지 않는 이유는?
			// 이미 try-catch, Collections 로 예외처리를 해준 상태이기 때문에
			// 여기서 굳이 else를 또 써준다면 논리적 모순이 있다. 
			if( mList.isEmpty() == true ) {
				return Collections.emptyList();
			} 
			return mList;
			
		}catch( Exception ex ){
			throw new MessageException("방명록 ) DB에 목록 검색시 오류  : " + ex.toString() );	
		} finally{
			if( rs   != null ) { try{ rs.close();  } catch(SQLException ex){} }
			if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }
			if( con  != null ) { try{ con.close(); } catch(SQLException ex){} }
		}		
	}
	

	/* -------------------------------------------------------
	 * 현재 페이지에 보여울 메세지 목록  얻어올 때
	 */
	public List<Message> selectList(int firstRow, int endRow) throws MessageException
	{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Message> mList = new ArrayList<Message>();
		boolean isEmpty = true;
		
		try{


			
			if( isEmpty ) return Collections.emptyList();
			
			return mList;
		}catch( Exception ex ){
			throw new MessageException("방명록 ) DB에 목록 검색시 오류  : " + ex.toString() );	
		} finally{
			if( rs   != null ) { try{ rs.close();  } catch(SQLException ex){} }
			if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }
			if( con  != null ) { try{ con.close(); } catch(SQLException ex){} }
		}		
	}
	
	
	
	/* -------------------------------------------------------
	 * 메세지 전체 레코드 수를 검색
	 */
	
	public int getTotalCount() throws MessageException{
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int count = 0;

		try{


			return  count;
			
		}catch( Exception ex ){
			throw new MessageException("방명록 ) DB에 목록 검색시 오류  : " + ex.toString() );	
		} finally{
			if( rs   != null ) { try{ rs.close();  } catch(SQLException ex){} }
			if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }
			if( con  != null ) { try{ con.close(); } catch(SQLException ex){} }
		}			
	}
	
	/*
	 * 메세지 번호와 비밀번호에 의해 메세지 삭제
	 */
	public int delete( int messageId, String password ) throws MessageException
	{
		// JDBC 절차 작성
		int result = 0;
		Connection con = null;
		PreparedStatement ps = null;
		
		try{
			// 연결객체 얻어오기
			con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			// SQL 문장 만들기
			String sql = "DELETE FROM guesttb WHERE message_id=? AND password=?";
			// 전송객체 얻어오기
			ps = con.prepareStatement(sql);
			ps.setInt(1, messageId);
			ps.setString(2, password);
			// 전송
			result = ps.executeUpdate();
			
			return result;
			
		}catch( Exception ex ){
			throw new MessageException("방명록 ) DB에 삭제시 오류  : " + ex.toString() );	
		} finally{
			if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }
			if( con  != null ) { try{ con.close(); } catch(SQLException ex){} }
		}		
	}
}
