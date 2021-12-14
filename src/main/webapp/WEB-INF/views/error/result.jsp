<%@ page contentType="text/html; charset=UTF-8"%>
<%
	RuntimeException e = (RuntimeException)request.getAttribute("e");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%=e %>
</body>
</html>