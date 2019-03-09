<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Login</title>

<style type="text/css">

.container-login100 {
    width: 100%;
    min-height: 100vh;
    display: -webkit-box;
    display: -webkit-flex;
    display: -moz-box;
    display: -ms-flexbox;
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    align-items: center;
    padding: 15px;
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center;
    position: relative;
    z-index: 1;
}
.container-login100::before {
    content: "";
    display: block;
    position: absolute;
    z-index: -1;
    width: 100%;
    height: 100%;
    top: 0;
    left: 0;
   
    pointer-events: none;
}
@media (max-width: 480px)
.wrap-login100 {
    padding-left: 15px;
    padding-right: 15px;
}
.wrap-login100 {
    width: 390px;
    background: #fff;
    border-radius: 10px;
    overflow: hidden;
    box-shadow: 0 3px 20px 0px rgba(0, 0, 0, 0.1);
    -moz-box-shadow: 0 3px 20px 0px rgba(0, 0, 0, 0.1);
    -webkit-box-shadow: 0 3px 20px 0px rgba(0, 0, 0, 0.1);
    -o-box-shadow: 0 3px 20px 0px rgba(0, 0, 0, 0.1);
    -ms-box-shadow: 0 3px 20px 0px rgba(0, 0, 0, 0.1);
}
.p-b-30 {
    padding-bottom: 30px;
}
.p-t-80 {
    padding-top: 80px;
}
.login100-form {
    width: 100%;
}
.m-b-20 {
    margin-bottom: 20px;
}
.login100-form-title {
    display: block;
    font-family: SourceSansPro-Bold;
    font-size: 30px;
    color: #4b2354;
    line-height: 1.2;
    text-align: center;
}
.validate-input {
    position: relative;
}
.wrap-input100 {
    width: 100%;
    position: relative;
    background-color: #fff;
    border-radius: 20px;
}
.alert-validate::before {
    content: attr(data-validate);
    display: -webkit-box;
    display: -webkit-flex;
    display: -moz-box;
    display: -ms-flexbox;
    display: flex;
    align-items: center;
    position: absolute;
    width: 100%;
    min-height: 62px;
    background-color: #fff;
    border-radius: 20px;
    top: 0px;
    left: 0px;
    padding: 0 45px 0 22px;
    pointer-events: none;
    font-family: SourceSansPro-Bold;
    font-size: 16px;
    color: #fa4251;
    line-height: 1.2;
}
.input100 {
    font-family: SourceSansPro-Bold;
    font-size: 16px;
    color: #4b2354;
    line-height: 1.2;
    display: block;
    width: 100%;
    height: 62px;
    background: transparent;
    padding: 0 20px 0 23px;
}
input {
    outline: none;
    border: none;
}
.alert-validate .focus-input100 {
    box-shadow: 0 5px 30px 0px rgba(250, 66, 81, 0.1);
    -moz-box-shadow: 0 5px 30px 0px rgba(250, 66, 81, 0.1);
    -webkit-box-shadow: 0 5px 30px 0px rgba(250, 66, 81, 0.1);
    -o-box-shadow: 0 5px 30px 0px rgba(250, 66, 81, 0.1);
    -ms-box-shadow: 0 5px 30px 0px rgba(250, 66, 81, 0.1);
}
.focus-input100 {
    display: block;
    position: absolute;
    width: 100%;
    height: 100%;
    top: 0;
    left: 0;
    pointer-events: none;
    border-radius: 20px;
    box-shadow: 0 5px 30px 0px rgba(0, 0, 0, 0.1);
    -moz-box-shadow: 0 5px 30px 0px rgba(0, 0, 0, 0.1);
    -webkit-box-shadow: 0 5px 30px 0px rgba(0, 0, 0, 0.1);
    -o-box-shadow: 0 5px 30px 0px rgba(0, 0, 0, 0.1);
    -ms-box-shadow: 0 5px 30px 0px rgba(0, 0, 0, 0.1);
    -webkit-transition: all 0.4s;
    -o-transition: all 0.4s;
    -moz-transition: all 0.4s;
    transition: all 0.4s;
}
.btn-hide-validate {
    font-family: Material-Design-Iconic-Font;
    font-size: 15px;
    color: #fa4251;
    cursor: pointer;
    display: -webkit-box;
    display: -webkit-flex;
    display: -moz-box;
    display: -ms-flexbox;
    display: flex;
    align-items: center;
    justify-content: center;
    position: absolute;
    height: 62px;
    top: 0px;
    right: 23px;
}
.validate-input {
    position: relative;
}
.wrap-input100 {
    width: 100%;
    position: relative;
    background-color: #fff;
    border-radius: 20px;
}
.container-login100-form-btn {
    width: 100%;
    display: -webkit-box;
    display: -webkit-flex;
    display: -moz-box;
    display: -ms-flexbox;
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
}
.login100-form-btn {
    display: -webkit-box;
    display: -webkit-flex;
    display: -moz-box;
    display: -ms-flexbox;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 0 20px;
    min-width: 160px;
    height: 50px;
    background-color: #bd59d4;
    border-radius: 25px;
    font-family: SourceSansPro-SemiBold;
    font-size: 14px;
    color: #fff;
    line-height: 1.2;
    text-transform: uppercase;
    -webkit-transition: all 0.4s;
    -o-transition: all 0.4s;
    -moz-transition: all 0.4s;
    transition: all 0.4s;
    box-shadow: 0 10px 30px 0px rgba(189, 89, 212, 0.5);
    -moz-box-shadow: 0 10px 30px 0px rgba(189, 89, 212, 0.5);
    -webkit-box-shadow: 0 10px 30px 0px rgba(189, 89, 212, 0.5);
    -o-box-shadow: 0 10px 30px 0px rgba(189, 89, 212, 0.5);
    -ms-box-shadow: 0 10px 30px 0px rgba(189, 89, 212, 0.5);
}
.text-center {
    text-align: center!important;
}
.p-b-20 {
    padding-bottom: 20px;
}
.p-t-57 {
    padding-top: 57px;
}
.flex-c {
    display: -webkit-box;
    display: -webkit-flex;
    display: -moz-box;
    display: -ms-flexbox;
    display: flex;
    justify-content: center;
}
.p-b-112 {
    padding-bottom: 112px;
}
.txt1 {
    font-family: SourceSansPro-Regular;
    font-size: 16px;
    line-height: 1.4;
    color: #999999;
}
.login100-social-item {
    font-size: 25px;
    color: #3b5998;
    display: -webkit-box;
    display: -webkit-flex;
    display: -moz-box;
    display: -ms-flexbox;
    display: flex;
    justify-content: center;
    align-items: center;
    width: 50px;
    height: 50px;
    border-radius: 50%;
    background-color: #fff;
    margin: 5px;
    box-shadow: 0 5px 20px 0px rgba(0, 0, 0, 0.1);
    -moz-box-shadow: 0 5px 20px 0px rgba(0, 0, 0, 0.1);
    -webkit-box-shadow: 0 5px 20px 0px rgba(0, 0, 0, 0.1);
    -o-box-shadow: 0 5px 20px 0px rgba(0, 0, 0, 0.1);
    -ms-box-shadow: 0 5px 20px 0px rgba(0, 0, 0, 0.1);
}
</style>
</head>
<body background="${images}/login_img.jpg" bgcolor="white">
    <jsp:include page="header.jsp"/>
    
	       
	<div class="container-login100" >
	   
		<div class="wrap-login100 p-l-55 p-r-55 p-t-80 p-b-30" style="padding: 40px">
		<c:if test="${not empty msg}">
		     <div class="alert alert-info">${msg}</div>
	         </c:if>
		     
			<form class="login100-form validate-form" action="login" method='POST'>
				<span class="login100-form-title p-b-37">
					Login
				</span>

				<div class="wrap-input100 validate-input m-b-20">
					<input class="input100" type="email" name="email" placeholder="email" required>
					<span class="focus-input100"></span>
				</div>

				<div class="wrap-input100 validate-input m-b-25">
					<input class="input100" type="password" name="password" placeholder="password" required>
					<span class="focus-input100"></span>
				</div>
				
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
				<div class="container-login100-form-btn">
					<button class="login100-form-btn">
						Login
					</button>
				</div>

				<div class="text-center">
					<a href="#" class="txt2 hov1">
						Sign Up
					</a>
				</div>
			</form>

			
		</div>
	</div>
		<div id="dropDownSelect1"></div>
		<jsp:include page="footer.jsp"/>
</body>