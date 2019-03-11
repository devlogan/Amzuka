<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!--   <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
-->
<style>
.payment-wrapper {
	font-family: 'Century Gothic', sans-serif;
	font-size: 13px
}

.payment-button {
	font-family: 'Futura', sans-serif;
	width: 400px;
	height: 43px;
	background-color: #5f6060;
	color: #fff;
	border: none;
	font-weight: 600;
	margin-bottom: 10px
}
</style>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="container-fluid">
		<div style="width: 50%; margin: 0 auto;">
			<span class="anchor" id="formPayment"></span>
			<hr class="my-5">

			<!-- form card cc payment -->
			<div class="card card-outline-secondary">
				<div class="card-body">
					<h3 class="text-center">Credit Card Payment</h3>
					<hr>
					<div>
						<!--    <a class="close font-weight-normal initialism" data-dismiss="alert" href="#"><samp>×</samp></a> 
                                CVC code is required.-->
					</div>
					<f:form action="${rootdir}/successfulPage" method="post"
						modelAttribute="customerObj" class="form" role="form"
						autocomplete="off">
						<div class="form-group payment-wrapper">
							<label for="cc_name">Card Holder's Name</label> <input
								type="text" class="form-control" id="cc_name"
								pattern="\w+ \w+.*" title="First and last name"
								required="required">
						</div>
						<div class="form-group payment-wrapper">
							<label>Card Number</label> <input type="text"
								class="form-control" autocomplete="off" maxlength="20"
								pattern="\d{16}" title="Credit card number" required="">
						</div>
						<div class="form-group row payment-wrapper">
							<label class="col-md-12">Card Exp. Date</label>
							<div class="col-md-4 payment-wrapper">
								<select class="form-control" name="cc_exp_mo" size="0">
									<option value="01">01</option>
									<option value="02">02</option>
									<option value="03">03</option>
									<option value="04">04</option>
									<option value="05">05</option>
									<option value="06">06</option>
									<option value="07">07</option>
									<option value="08">08</option>
									<option value="09">09</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>
								</select>
							</div>
							<div class="col-md-4 payment-wrapper">
								<select class="form-control" name="cc_exp_yr" size="0">
									<option>2018</option>
									<option>2019</option>
									<option>2020</option>
									<option>2021</option>
									<option>2022</option>
								</select>
							</div>
							<div class="col-md-4 payment-wrapper">
								<input type="text" class="form-control" autocomplete="off"
									maxlength="3" pattern="\d{3}"
									title="Three digits at back of your card" required=""
									placeholder="CVC">
							</div>
						</div>

						<hr>
						<div class="form-group row">
							<div class="col-md-6">
								<button type="reset" class="btn btn-default btn-lg btn-block">Cancel</button>
							</div>
							<div class="col-md-6">
								<button type="submit"
									class="btn btn-lg btn-block payment-button">Place
									Order</button>
							</div>
						</div>
					</f:form>
				</div>
			</div>
		</div>
	</div>


	<jsp:include page="footer.jsp" />
</body>

</html>