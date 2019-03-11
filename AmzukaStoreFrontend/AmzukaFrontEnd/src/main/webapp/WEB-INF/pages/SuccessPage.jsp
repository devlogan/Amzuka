<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Thank You!</title>
</head>
<body>
	<jsp:include page="header.jsp" />

	<div class="jumbotron text-xs-center">
		<h1 class="display-3">Thank You!</h1>
		<p class="lead">
			<strong>Please check your email</strong> for further instructions on
			how to complete your account setup.
		</p>
		<hr>
		<p>
			Having trouble? <a href="">Contact us</a>
		</p>
		<p class="lead">
			<a class="btn btn-primary btn-sm" href="${rootdir }" role="button">Continue
				to homepage</a>
		</p>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>