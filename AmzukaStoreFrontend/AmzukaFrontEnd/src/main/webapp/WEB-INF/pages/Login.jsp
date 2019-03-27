<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Century Gothic">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Futura">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Tangerine">
<style type="text/css">
.login-title, .login-subhead, .logout-message {
	display: block;
}

.wrapper-container {
	margin: 0 auto;
}

.form-input {
	width: 400px;
	padding-left: 15px;
	background-color: #fff !important;
	height: 43px;
	margin: 10px 0;
	border: none;
	outline: none;
	border: 1px solid grey;
	padding-bottom: 5px
}

.form-input:focus {
	box-shadow: 1px 2px;
}

.login-button {
	font-family: 'Futura', sans-serif;
	width: 400px;
	height: 43px;
	background-color: #5f6060;
	color: #fff;
	border: none;
	font-weight: 600;
	margin-bottom: 10px
}

.input-wrapper, .login-title, .logout-message, .login-subhead {
	text-align: center;
}

.login-subhead {
	margin-bottom: 30px;
	font-size: 16px
}

.login-title {
	margin-bottom: 10px;
	font-weight: 600;
	font-size: 20px;
	font-family: 'Futura', sans-serif
}

.signup-text {
	font-family: 'Tangerine', serif;
	font-size: 20px;
	font-weight: 600
}

.input-wrapper, .login-subhead {
	font-family: 'Century Gothic', sans-serif
}

.login-container {
	margin: 0 auto;
	float: none !important;
	padding: 40px;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp" />


	<div class="row wrapper-container center-block">

		<div
			class="col-md-6 col-sm-12 login-container justify-content-md-center"
			style="padding: 40px">

			<form action="login" method='POST'>
				<span class="login-title"> Login </span> <span class="login-subhead">Please
					enter your e-mail and password:</span>
				<div class="input-wrapper">
					<input class="form-input" type="email" name="email"
						placeholder="email" required>
				</div>

				<div class="input-wrapper">
					<input class="form-input" type="password" name="password"
						placeholder="password" required>
				</div>

				<input type="hidden" name="${_csrf.parameterName }"
					value="${_csrf.token }" />
				<div class="input-wrapper">
					<button class="login-button">Login</button>
				</div>

				<div class="text-center signup-text">
					<p>
						Don't have Account? <a href="${rootdir }/registerCustomer"
							class="txt2 hov1"> Create One </a>
					</p>
				</div>
			</form>


		</div>
	</div>
	<div>
		<jsp:include page="footer.jsp" />
	</div>
</body>