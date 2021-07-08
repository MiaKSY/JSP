package mvc.simple;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 주석, 골뱅이(어노테이션), 시리얼번호, 내용 전부 지워주세요


public class SimpleControl extends HttpServlet {
       
	// jsp디렉토리 변수를 만들어줍니다.
	String jspDir = "/05_mvc_class/1_mvcSimple/";
	
	
	// 심플한 생성자 함수
    public SimpleControl() {
       
    }

    // get 방식으로 불려지면 doGet 함수가 불려진다.
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
		// get 방식이 불려와도, post 방식이 불려와도 똑같이 processRequest함수를 불러올 겁니다.
	}

	// post 방식으로 불려지면 doPost 함수가 불려진다.
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
		// get 방식이 불려와도, post 방식이 불려와도 똑같이 processRequest함수를 불러올 겁니다.
	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		// [1] 사용자의 요청(파라메터)를 받음
		// type 이라고 하는 파라메터를 가져와주세요
		String type = request.getParameter("type");
		 
		// [2] 사용자 요청에 따라 알맞은 기능을 수행
		 String value="";
		 if(type==null) {
			 // 타입이 없으면
			 value="안녕하세요";
		 } else {
			 // 타입이 없으면
			 value = "아무개님 화이팅";
		 }
				
		 // [3] 처리 결과를 request/session에 저장
		 request.setAttribute("param", value);
		 
		 // [4] 사용자가 볼 View 페이지를 포워딩 : <jsp:forward page=''/> 그런데 이거는 jsp 코드고, 지금 여기는 java니까 지금 이걸 쓸 수는 없다.
		 RequestDispatcher disp = request.getRequestDispatcher(
				 // 경로를 잡는 방법 1
				 	// "/05_mvc_class/1_mvcSimple/simpleView.jsp" 
		 			// ▲ 경로가 정확해야합니다.
				 // 경로를 잡는 방법 2
				 	// 위에다가jsp디렉토리 변수를 만들어줍니다.
				 	// 그 변수를 가져와서 사용합니다.
				 	jspDir + "simpleView.jsp"
		 			// ▲ 경로가 정확해야합니다.
				 
				 );
		 
		disp.forward(request, response);		 
		 // forward으로 합니다.
		 
		 
	}
	
	
	
}
