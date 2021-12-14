<%@page import="java.util.List"%>
<%@page import="com.koreait.shoegether.domain.Comments"%>
<%@page import="com.koreait.shoegether.domain.Board"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String ts_name = "무언가";
	if(session==null)ts_name = "없다";
	Member member = (Member)session.getAttribute("member");
	ts_name = member.getName();
	
	List<Comments> list = (List)request.getAttribute("commentsList");
	Board board = (Board)request.getAttribute("board");
	int board_id  = board.getBoard_id();
	out.print("board_id는" + board.getBoard_id()+"session의 name은"+ ts_name+"댓글 개수"+list.size());
%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="apple-touch-icon"
	href="/resources/client/assets/img/apple-icon.png">
<link rel="shortcut icon" type="image/x-icon"
	href="/resources/client/assets/img/favicon.ico">

<link rel="stylesheet"
	href="/resources/client/assets/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/resources/client/assets/css/templatemo.css">
<link rel="stylesheet" href="/resources/client/assets/css/custom.css">

<!-- Load fonts style after rendering the layout styles -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
<link rel="stylesheet"
	href="/resources/client/assets/css/fontawesome.min.css">

<title>contact - Space Science Website Template</title>
<!-- <link rel="stylesheet" href="css/style.css" type="text/css">  -->
<style>
#contact .form-control {
	border-radius: 0px;
	border-color: #f0f0f0;
	box-shadow: none;
	font-size: 16px;
	margin-top: 12px;
	margin-bottom: 12px;
	-webkit-transition: all ease-in-out 0.4s;
	transition: all ease-in-out 0.4s;
}

#contact .form-control:focus {
	border-bottom: 2px solid #999999;
}

#contact input {
	height: 55px;
	border: none;
	border-bottom: 1px solid #f0f0f0;
}

#contact button#submit {
	background: #000000;
	border: none;
	border-radius: 50px;
	color: #ffffff;
	font-weight: 300;
	height: 55px;
	padding-bottom: 10px;
	margin-top: 24px;
}

#contact button#submit:hover {
	background: #d7b065;
	color: #ffffff;
}

#contact {
	text-align: center;
}

#contact {
	position: relative;
	padding-top: 80px;
	padding-bottom: 80px;
}



/*==================================== */
.col-md-12 {
	position: relative;
	min-height: 1px;
	padding-right: 15px;
	padding-left: 15px
}

.col-md-4 col-sm-4 {
	float: left;
}
/* ddddddddddddddddd */
body {
	margin: 0;
	padding: 0;
	position: relative;
	width: auto;
}

body #page {
	background: #000000;
	margin: 0;
	overflow: hidden;
	padding: 0;
	width: auto;
	z-index: 3;
}

a {
	text-decoration: none;
	outline: none;
}

a:active {
	background: none;
}

img {
	border: none;
}

#body .header div form {
	display: block;
	margin: 0 auto;
	padding: 0;
	width: 461px;
}

#body .header div form input {
	background-color: #A3A3A3;
	border: medium none;
	color: #000000;
	display: block;
	font-family: Arial;
	font-size: 18px;
	font-weight: normal;
	height: 43px;
	line-height: 43px;
	margin: 0 0 29px;
	padding: 0 0 0 20px;
	text-align: left;
	text-transform: uppercase;
	width: 441px;
}

#body .header div form textarea {
	background-color: #A3A3A3;
	border: medium none;
	color: #000000;
	display: block;
	font-family: Arial;
	font-size: 18px;
	font-weight: normal;
	height: 98px;
	line-height: 24px;
	margin: 0 0 31px;
	overflow: auto;
	padding: 15px 0 0 20px;
	resize: none;
	text-align: left;
	text-transform: uppercase;
	width: 441px;
}

#body .header div form input#submit {
	background-color: #3c0f38;
	color: #ffffff;
	cursor: pointer;
	display: block;
	float: right;
	font-family: Arial;
	font-size: 14px;
	font-weight: normal;
	height: 31px;
	line-height: 31px;
	margin: 0;
	padding: 0;
	text-align: center;
	text-transform: uppercase;
	width: 120px;
}

#body .header div form input#submit:hover {
	background-color: #620031;
}
#top_cate{
	background-color: #59ab6e;
}
</style>
<!-- style ======================================================= -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
 $(function(){
	$("button[type='button']").click(function(){
				
		registComments();
	});
});
function registComments(){
	//서버에 로그인 요청 
	$("form[name=comments]").attr({
		"action":"/client/regist",
		"method":"POST"
	});		
	$("form").submit();
} 
</script>
</head>
<body>
	<%@ include file="../inc/header.jsp"%>
	<div id="page">
		<div id="body">
			<div class="header">
				<div class="contact">
					<h1>Contact</h1>
					<h2>DO NOT HESITATE TO CONTACT US</h2>
						<form action="index.html"> 
							<input type="text" name="Name" value="<%=board.getWriter()%>"> 
							
							<input type="text" name="Subject" value="<%=board.getTitle()%>">
							
						<textarea name="message" cols="50" rows="7"><%=board.getContent() %></textarea>
						<!-- <input type="submit" value="Send" id="submit"> -->
					 </form> 
				</div>
			</div>
		</div>
	</div>
	<!--  -->
	
	 <table border="1px" width="1000px" style="margin: auto">
                    <tr id="top_cate">
                      <th width="600px">내용 </th>
                     <th>작성자</th>
                      <th>날짜</th>
                   </tr>
                   <!--  ===================   -->
                   <%for(Comments comments : list){ %>
                    <tr>
                      <th width="600px"><%=comments.getContent() %> </th>
                      <th><%=comments.getWriter() %></th>
                      <th><%=comments.getDate() %></th>
                   </tr>
                   <%} %>
                   <!--  ===================   -->
	</table>
	
	<!--  -->
		<section id="contact">
		<div class="container">
			<div class="row">

				<div class="col-md-12 col-sm-12">
					<div class="wow fadeInUp section-title" data-wow-delay="0.2s">
						<h2>댓글</h2>
					
					</div>
				</div>
				

				<div class="col-md-12 col-sm-12">
					<!-- CONTACT FORM HERE -->
					<div class="wow fadeInUp" data-wow-delay="0.6s">
					
						 <form id="contact-form" name="comments"> 
						 	<input type="hidden" name="writer" value="<%=ts_name%>">
							<input type="hidden" name="board_id" value="<%=board_id%>"> 
							
							<div class="col-md-12 col-sm-12">
								<textarea class="form-control" rows="5" name="content"
									placeholder="Message"  style="width: 90%;"></textarea>
							</div>
						 </form> 
							<div class="col-md-offset-9 col-md-3 col-sm-offset-3 col-sm-6">
								<button id="submit" type="button" class="form-control"
									name="submit" style="width: 40%;">댓글 등록</button>
							</div>
						 
					</div>
				</div>

			</div>
		</div>
	</section>
	<%@ include file="../inc/footer.jsp"%>
</body>
</html>