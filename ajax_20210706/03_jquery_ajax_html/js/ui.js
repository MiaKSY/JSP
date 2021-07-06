$(document).ready(function(){
	
	$("#container").addClass("start");

	$("nav li").click(function(){
		$("#container").css("max-width", "100%")
		
		var id=$(this).attr("data-rol");    
		$("nav li").removeClass("on");    
		$(this).addClass("on");    
		$(".content").removeClass("prev this next");     
		//클릭 시 가지고 있던 클래스를 모두 지운다 
		
		$("#" + id).addClass("this").prevAll().addClass("prev");    
		//클릭한 메뉴와 매칭 되는 id에 this 클래스를 지정하고 그 앞의 모든 <section> 태그는 .prev클래스를 지정한다    
		$("#" + id).nextAll().addClass("next");    
		//클릭한 메뉴와 매칭 되는 id의 뒤에 오는 <section> 태그는 .next 클래스를 지정한다     
	});

	
	//********************************************************
	//ajax 사용하기
	$(".book_roll li").click(function(){
	// book_roll클래스에서 li 요소가 클릭되었을 때
		
		// (1) 이벤트 발생한 li 요소에서 data-url 값 가져오기
										// 모바일 스타일
										// 변수이름에 data- 를 쓰면
										// data() 함수를 쓸 수 있다.
		var liurl = $(this).data('url')
		// 잘 되나 확인
		// alert(liurl)
		
		// (2)  class='notebook' 지정한 article의 요소에 ajax로 파일을 받아서 지정
		$.ajax({
			type : 'get',
			url : liurl,
			dataType : 'html',
			success : function(data){
				$('.notebook').html(data);
			}
		})
		// 잘 되는지 확인!
		// 너무 잘 된다!!
		
	});
});

