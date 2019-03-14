<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Thank You!</title>
<style>
.homepage-button {
	font-family: 'Futura', sans-serif;
	width: 250px;
	height: 43px;
	background-color: #5f6060;
	color: #fff;
	border: none;
	font-weight: 600;
	margin-bottom: 100px
	padding-top:10px;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp" />

	<div class="jumbotron text-xs-center" style="background-color:#fff">
		<h1 class="display-3">Thank You for shopping with us!</h1>
	
		<hr>
		<p>
			Having trouble? <a href="">Contact us</a>
		</p>
		<p class="lead">
			<a class="btn homepage-button " href="${rootdir }" role="button">Continue
				to homepage</a>
		</p>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>