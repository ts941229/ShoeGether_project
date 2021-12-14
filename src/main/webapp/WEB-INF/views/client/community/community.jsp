<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.koreait.shoegether.domain.Board"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<%
	Member member = (Member)session.getAttribute("member");
	/* out.print(member.getName()); */
	 List<Board> boardList = (List)request.getAttribute("boardList");

		int totalRecord=boardList.size();//총 게시물 수
		int pageSize=5;//총 게시물을 몇건씩 나누어서 보여줄지를 결정짓는 변수, 즉 페이지당 보여줄 레코드 수
		int totalPage=(int)Math.ceil((float)totalRecord/pageSize); //총 페이지 수(나머지 숨겨진 데이터를 보기위한 페이지 분할된 총 수)
		int blockSize=10;
		int currentPage=1;//현재 페이지
		if(request.getParameter("currentPage")!=null){
			currentPage=Integer.parseInt(request.getParameter("currentPage"));
		}
		int firstPage=currentPage- ((currentPage-1)%blockSize);
		int lastPage=firstPage+(blockSize-1);
		int curPos=(currentPage-1)*pageSize;//페이지당 List의 시작 index구하기
		int num=totalRecord - curPos;
%>
<html lang="en">

<head>
<title>Zay Shop - Contact</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

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

<!-- Load map styles -->
<link rel="stylesheet"
	href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css"
	integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A=="
	crossorigin="" />
	
</head>
<style>
a {
	text-decoration: none
}
.styled-table {
	border-collapse: collapse;
	margin: auto;
	width: 800px;
	font-size: 0.9em;
	font-family: sans-serif;
	margin-top: 100px;
	margin-bottom: 100px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
}

.styled-table thead tr {
	background-color: #58ab6e;
	color: #ffffff;
	text-align: left;
}

.styled-table th, .styled-table td {
	padding: 12px 15px;
}

.styled-table tbody tr {
	border-bottom: 1px solid #dddddd;
}

.styled-table tbody tr:nth-of-type(even) {
	background-color: #f3f3f3;
}

.styled-table tbody tr:last-of-type {
	border-bottom: 2px solid #58ab6e;
}

.btn {
	width:80px;
	height: 40px;
	background: #58ab6e;
	margin: auto;
	color: #f3f3f3;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(function(){
	$("button[type='button']").click(function(){
				
		registBoard();
	});
});
function registBoard(){
	//서버에 로그인 요청 
	$("button[type='button']").attr({
		"action":"/client/registBoard",
		"method":"GET"
	});		
	$("form").submit();
}
</script>
<body>
	<!-- 탑네비 and 헤더 -->
	<%@ include file="../inc/header.jsp"%>

	
	</div> 

	<!-- 게시판 -->
	<table style="border: 2px solid black" class="styled-table">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>등록일</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
		
			<%for (int i =0; i<=pageSize;i++){ %>
			<%	Board board = boardList.get(i); %>
			<tr>
				<td><%=board.getBoard_id()%></td>
				<td>
				<a href="community/detail?board_id=<%=board.getBoard_id() %>"><%=board.getTitle()%></a>
				</td>
				<td><%=board.getWriter()%></td>
				<td><%=board.getDate()%></td>
				<td><%=board.getHit()%></td>
			</tr>
			<%
			}
			%>
		</tbody>

		<tr class="numba" style="color: #58ab6e; font-weight: bold">
			<td height="20" colspan="5" align="center">
			<a href="/bewb/board/list.jsp?currentPage=<%=firstPage-1%>">◀</a>
			<%for(int i=firstPage;i<=lastPage;i++){%>
				<%if(i>totalPage)break;  %>
				<a href="/board/list.jsp?currentPage=<%=i%>" <%if(currentPage==i){%>class="pageNum"<%}%>   >[<%=i%>]</a>
			<%}%>
			<a href="/board/list.jsp?currentPage=<%=lastPage+1%>">▶</a>
			</td>
		</tr>
		<form action="community/write" method="GET">
		<tr>
			<td>
				<button class=btn >등록</button></a>
			</td>
		</tr>
		</form>	

	</table>
		
		
	<!-- 푸터 -->
	<%@ include file="../inc/footer.jsp"%>

	<!-- Start Script -->
	<script src="/resources/client/assets/js/jquery-1.11.0.min.js"></script>
	<script src="/resources/client/assets/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="/resources/client/assets/js/bootstrap.bundle.min.js"></script>
	<script src="/resources/client/assets/js/templatemo.js"></script>
	<script src="/resources/client/assets/js/custom.js"></script>
	<!-- End Script -->
</body>

</html>

