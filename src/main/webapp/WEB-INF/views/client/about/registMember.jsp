<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Zay Shop - About Page</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="/resources/client/assets/img/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon" href="/resources/client/assets/img/favicon.ico">

    <link rel="stylesheet" href="/resources/client/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/client/assets/css/templatemo.css">
    <link rel="stylesheet" href="/resources/client/assets/css/custom.css">

    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="/resources/client/assets/css/fontawesome.min.css">
<!--
    
TemplateMo 559 Zay Shop

https://templatemo.com/tm-559-zay-shop

-->
<style>
body {
  font-family: Arial, Helvetica, sans-serif;
}

* {
  box-sizing: border-box;
}

/* style the container */
/* .container {
  position: relative;
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px 0 30px 0;
} 
 */
 /* style inputs and link buttons */
input,
.btn {
  width: 100%;
  padding: 12px;
  border: none;
  border-radius: 4px;
  margin: 5px 0;
  opacity: 0.85;
  display: inline-block;
  font-size: 17px;
  line-height: 20px;
  text-decoration: none; /* remove underline from anchors */
}

input:hover,
.btn:hover {
  opacity: 1;
}

/* add appropriate colors to fb, twitter and google buttons */
.fb {
  background-color: #3B5998;
  color: white;
}

.twitter {
  background-color: #55ACEE;
  color: white;
}

.google {
  background-color: #dd4b39;
  color: white;
}

/* style the submit button */
input[type=button] {
  background-color: #04AA6D;
  color: white;
  cursor: pointer;
}

input[type=button]:hover {
  background-color: #45a049;
}
/* Two-column layout */
.col {
  float: left;
  width: 50%;
  margin: auto;
  padding: 0 50px;
  margin-top: 6px;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* vertical line */
.vl {
  position: absolute;
  left: 50%;
  transform: translate(-50%);
  border: 2px solid #ddd;
  height: 175px;
}

/* text inside the vertical line */
.vl-innertext {
  position: absolute;
  top: 50%;
  transform: translate(-50%, -50%);
  background-color: #f1f1f1;
  border: 1px solid #ccc;
  border-radius: 50%;
  padding: 8px 10px;
}

/* hide some text on medium and large screens */
.hide-md-lg {
  display: none;
}

/* bottom container */
.bottom-container {
  text-align: center;
  background-color: #666;
  border-radius: 0px 0px 4px 4px;
}

/* Responsive layout - when the screen is less than 650px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 650px) {
  .col {
    width: 100%;
    margin-top: 0;
  }
  /* hide the vertical line */
  .vl {
    display: none;
  }
  /* show the hidden text on small screens */
  .hide-md-lg {
    display: block;
    text-align: center;
  }
}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(function(){
	$("input[value='regist']").click(function(){
		loginCheck();
	});
});
function loginCheck(){
	//서버에 로그인 요청 
	$("form").attr({
		"action":"/client/registMemberForm",
		"method":"post"
	});		
	$("form").submit();
}

</script>


</head>
<body >

    <!-- 탑네비 and 헤더 -->
    <%@ include file="../inc/header.jsp" %>
	<%="<br>" %>
	<%="<br>" %>

<div class="container">
  <form action="/action_page.php">
    <div class="row">
      <h2 style="text-align:center">회원가입</h2>
      <div class="vl">
        <!-- <span class="vl-innertext">or</span> -->
      </div>

      <div class="col">
       
      </div>

      <div class="col">
        <div class="hide-md-lg">
          <p>Or sign in manually:</p>
        </div>

        <input type="text" name="host_id" placeholder="ID..." required>
        <input type="password" name="password" placeholder="Password" required>
        <input type="text" name="name" placeholder="UserName" required>
        <input type="hidden" name="auth" value="client">
        <input type="button" value="regist">
      </div>
    </div>
  </form>
</div>

<!-- <div class="bottom-container">
  <div class="row">
    <div class="col">
      <a href="#" style="color:white" class="btn">Sign up</a>
    </div>
    <div class="col">
      <a href="#" style="color:white" class="btn">Forgot password?</a>
    </div>
  </div>
</div> -->
    <!--End Brands-->

    <!-- 푸터 -->
	<%-- <%@ include file="../inc/footer.jsp" %> --%>
    

    <!-- Start Script -->
    <script src="/resources/client/assets/js/jquery-1.11.0.min.js"></script>
    <script src="/resources/client/assets/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="/resources/client/assets/js/bootstrap.bundle.min.js"></script>
    <script src="/resources/client/assets/js/templatemo.js"></script>
    <script src="/resources/client/assets/js/custom.js"></script>
    <!-- End Script -->
</body>

</html>