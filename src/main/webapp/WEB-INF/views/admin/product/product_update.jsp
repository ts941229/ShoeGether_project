<%@page import="com.koreait.shoegether.domain.Product"%>
<%@page import="com.koreait.shoegether.domain.TopCategory"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	List<TopCategory> topList = (List)request.getAttribute("topList");
	Product product = (Product)request.getAttribute("product");
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
		
	<!-- ----------------------------------------------------------------------------------------- -->
	
	<main class="page-center">
		<article class="sign-up">
			<h1 class="sign-up__title">상품 수정</h1>
			<form class="sign-up-form form">
			
				<!-- 탑 카테고리 -->
				<label class="form-label-wrapper">
					<p class="form-label">브랜드</p>
					<select class="form-input" type="text" name="topcategory_id" required>
						<option class="form-input" value="0">브랜드 선택</option>
						<%for(TopCategory topCategory : topList){ %>
						<option class="form-input" value="<%=topCategory.getTopcategory_id()%>"><%=topCategory.getTop_name() %></option>
						<% }%>
					</select>
				</label>
				
				<label class="form-label-wrapper">
					<p class="form-label">분류</p>
					<select class="form-input" type="text" name="subcategory_id" required>
						<option class="form-input" value="0">분류</option>
					</select>
				</label>
				
				<label class="form-label-wrapper">
					<p class="form-label"></p>
					<input class="form-input" name="name" type="text" value="<%=product.getName() %>" required>
				</label>
				
				<label class="form-label-wrapper">
					<p class="form-label"></p>
					<input class="form-input" name="detail" type="email" value="<%=product.getDetail() %>" required>
				</label>
				
				<label class="form-label-wrapper">
					<p class="form-label"></p>
					<input class="form-input" name="price" type="email" value="<%=product.getPrice() %>" required>
				</label>
				
				<label class="form-label-wrapper">
					<p class="form-label">상품 이미지</p>
					<input class="form-input" name="photo" type="file" required>
				</label>
				
				<button type="button" class="form-btn primary-default-btn transparent-btn" onClick="regist()">상품 수정</button>
				
				<input type="hidden" name="product_id" value="<%=product.getProduct_id()%>">
			</form>
		</article>
	</main>
	
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
$(function(){
	//bsCustomFileInput.init();
	
	$("select[name='topcategory_id']").change(function(){
		getSubList($(this).val());
	});
});

function getSubList(topcategory_id){
	console.log(topcategory_id);
	$.ajax({
		url:"/admin/category/topdetail?topcategory_id="+topcategory_id,
		type:"GET",
		success:function(result, status, xhr){
			$("select[name=subcategory_id]").html("");
			var tag="";
			tag+="<option class='form-input' value='0'>분류</option>";
			for(var i=0; i<result.length; i++){
				var json = result[i];
				tag+="<option class='form-input' value='"+json.subcategory_id+"'>"+json.sub_name+"</option>";
			}
			$("select[name=subcategory_id]").append(tag);
		}
	});
}

function regist(){
	if(confirm("상품을 수정하시겠습니까?\n확인 버튼을 누르시면 상품 목록으로 이동합니다.")){
		$("form").attr({
			action:"/admin/product/update",
			method:"POST",
			enctype:"multipart/form-data"
		});
		$("form").submit();
	}
}
</script>

</html>