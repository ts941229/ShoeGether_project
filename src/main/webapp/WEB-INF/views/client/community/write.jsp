<%@ page contentType="text/html; charset=UTF-8"%>
<%
Member member = (Member)session.getAttribute("member");
String ts_name = member.getName();
%>
<!DOCTYPE html>
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
<style>
 body {
	font-family: Arial, Helvetica, sans-serif;
}

* {
	box-sizing: border-box;
}

input[type=text], select, textarea {
	width: 100%;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
	margin-top: 6px;
	margin-bottom: 16px;
	resize: vertical;
}

input[type=submit] {
	background-color: #04AA6D;
	color: white;
	padding: 12px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

input[type=submit]:hover {
	background-color: #45a049;
}

 .container2 {
	border-radius: 5px;
	background-color: #f2f2f2;
	padding: 20px;
}  
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(function() {
		$("input[type='button']").click(function() {
		
			registBoard();
		});
	});
	function registBoard() {
		//서버에 로그인 요청 
		$("form[name=writeboard]").attr({
			"action" : "/client/writeboard",
			"method" : "POST"
		});
		$("form").submit();
	}

</script>
</head>
<body>
	<%@ include file="../inc/header.jsp"%>
	 <h3>Contact Form</h3>

	<div class="container2">
		<form name="writeboard">
			<input type="hidden" name="writer" value="<%=ts_name%>">
			<label for="lname">제목</label> <input type="text" id="lname" name="title"
				placeholder="제목..."> <label for="subject">내용</label>

			<textarea id="subject" name="content" placeholder="내용..."
				style="height: 200px"></textarea>

			<input type="button" value="등록">
		</form>
	</div> 
	
	
	 <%@ include file="../inc/footer.jsp"%> 
</body>
</html>
