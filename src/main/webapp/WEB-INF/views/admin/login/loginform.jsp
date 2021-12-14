<%@ page contentType="text/html; charset=UTF-8"%><!DOCTYPE html><html lang="en"><head>  <meta charset="UTF-8">  <meta http-equiv="X-UA-Compatible" content="IE=edge">  <meta name="viewport" content="width=device-width, initial-scale=1.0">  <title>Elegant Dashboard | Sign In</title>  <!-- Favicon -->  <link rel="shortcut icon" href="/resources/admin/img/svg/logo.svg" type="image/x-icon">  <!-- Custom styles -->  <link rel="stylesheet" href="/resources/admin/css/style.min.css"></head><body><div class="layer"></div>	<main class="page-center">		<article class="sign-up">			<h1 class="sign-up__title">관리자 로그인</h1>			<p class="sign-up__subtitle"><!-- 부제목 --></p>						<form class="sign-up-form form">							<label class="form-label-wrapper">					<p class="form-label">관리자명</p>					<input name="admin_name" class="form-input" type="email" placeholder="" required>				</label>								<label class="form-label-wrapper">					<p class="form-label">비밀번호</p>					<input name="password" class="form-input" type="password" placeholder="" required>				</label>								<a class="link-info forget-link" href="##"><!-- 비밀번호를 잊으셨나요? --></a>				<label class="form-checkbox-wrapper">				<!-- <input class="form-checkbox" type="checkbox" required> -->				<!-- <span class="form-checkbox-label">Remember me next time</span>-->				</label>				<button type="button" class="form-btn primary-default-btn transparent-btn" onClick="login()">로그인</button>			</form>					</article>	</main><!-- Chart library --><script src="/resources/admin/plugins/chart.min.js"></script><!-- Icons library --><script src="/resources/admin/plugins/feather.min.js"></script><!-- Custom scripts --><script src="/resources/admin/js/script.js"></script></body><script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script><script>function login(){	$("form").attr({		"action":"/admin/login",		"method":"post"	});	$("form").submit();}</script></html>