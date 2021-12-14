<%@page import="com.koreait.shoegether.domain.TopCategory"%>
<%@page import="com.koreait.shoegether.domain.SubCategory"%>
<%@page import="com.koreait.shoegether.domain.Product"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	List<Product> productList = (List)request.getAttribute("productList"); 
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Elegant Dashboard | Dashboard</title>
<!-- Favicon -->
<link rel="shortcut icon" href="/resources/admin/img/svg/logo.svg"
	type="image/x-icon">
<!-- Custom styles -->
<link rel="stylesheet" href="/resources/admin/css/style.min.css">
</head>

<body>
	<div class="layer"></div>
	<!-- ! Body -->
	<a class="skip-link sr-only" href="#skip-target">Skip to content</a>
	<div class="page-flex">

		<!-- 사이드 바 -->
		<%@ include file="../inc/sidebar.jsp"%>

		<div class="main-wrapper">

			<!-- 탑 네비 -->
			<%@ include file="../inc/topnavi.jsp"%>

			<!-- ----------------------------------------------------------------------------------------- -->
			

			<div class="users-table table-wrapper">
				<table class="posts-table">
					<thead>
						<tr class="users-table-info">
							<th>상품 이미지</th>
							<th>분류</th>
							<th>상품명</th>
							<th>상세내용</th>
							<th>브랜드</th>
							<th>가격</th>
							<th>관리</th>
						</tr>
					</thead>
					<tbody>
					
						<!-- 상품 하나 시작 -->
						<%for(Product product : productList){ %>
						<%
							SubCategory subCategory = product.getSubCategory();
							TopCategory topCategory = subCategory.getTopCategory();
						%>
						<tr>
							<td>
								<div class="categories-table-img">
									<picture>
									<img src="/resources/data/<%=product.getProd_img() %>"
										alt="category"></picture>
								</div>
							</td>
							<!-- 서브id로 서브name 가져와야함 product.getSubCategory().getSub_name() 현재는 null-->
							<td><span class="badge-active"><%=subCategory.getSub_name()%></span></td>
							<td><%=product.getName() %></td>
							<td><%=product.getDetail() %></td>
							<td><span class="badge-pending"><%=topCategory.getTop_name() %></span></td>
							<td><%=product.getPrice() %></td>
							<td><span class="p-relative">
									<button class="dropdown-btn transparent-btn" type="button"
										title="More info">
										<div class="sr-only">More info</div>
										<i data-feather="more-horizontal" aria-hidden="true"></i>
									</button>
									<ul class="users-item-dropdown dropdown">
										<li><a href="javascript:getUpdate(<%=product.getProduct_id()%>)">Edit</a></li>
										<li><a href="javascript:getDelete(<%=product.getProduct_id()%>)">Trash</a></li>
									</ul>
							</span></td>
						</tr>
						<%} %>
						<!-- 상품 하나 끝 -->
						
					</tbody>
				</table>
			</div>
		</div>
		<!-- ----------------------------------------------------------------------------------------- -->
	</div>
	</div>
	<!-- Chart library -->
	<script src="/resources/admin/plugins/chart.min.js"></script>
	<!-- Icons library -->
	<script src="/resources/admin/plugins/feather.min.js"></script>
	<!-- Custom scripts -->
	<script src="/resources/admin/js/script.js"></script>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
function getUpdate(product_id){
	if(confirm("이 상품을 수정하시겠습니까?\n확인을 누르시면 상품 수정 페이지로 이동합니다.")){
		location.href="/admin/product/updateform?product_id="+product_id;
	}
}
function getDelete(product_id){
	if(confirm("이 상품을 삭제하시겠습니까?")){
		location.href="/admin/product/delete?product_id="+product_id;
	}
}
</script>

</html>