<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
* {
	font-family: 'Century Gothic', sans-serif;
}

.td-align {
	text-align: center;
}

.td-align-total {
	text-align: right;
}
</style>
</head>

<script>
var myFun = function(){
	window.location = "${rootdir}/paymentPage";
}
</script>
<jsp:include page="header.jsp" />

<br>
<div class="container-fluid" style="width: 100%">

	<div class="col-md-8 col-sm-6 col-xs-12">
		<!--SHIPPING METHOD-->
		<div class="panel panel-default cart-class">
			<div class="panel-heading text-center heading-font">
				<h4>Order Items</h4>
			</div>
			<div class="panel-body">
				<c:forEach items="${cartItems}" var="item">
					<table class="table borderless">
						<thead>
							<tr>
								<td class="content-font"><strong>Your Cart: # item</strong></td>
								<td class="td-align">Price</td>
								<td class="td-align">Quantity</td>
								<td class="td-align-total">Total</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="col-md-3">
									<div class="media content-font">
										<a class="thumbnail pull-left" href="#"> <img
											class="media-object" src="${images}/${item.product.imgName}"
											style="width: 72px; height: 72px;">
										</a>
										<div class="media-body">
											<h5 class="media-headings">${item.product.productName}</h5>
										</div>
									</div>
								</td>
								<td class="text-center content-font">${item.price}</td>
								<td class="text-center content-font"><span class="inc-dec">${item.quantity}
								</span></td>
								<td class="text-right content-font">${item.quantity*item.price}</td>
							</tr>
						</tbody>
					</table>
				</c:forEach>
			</div>
		</div>
	</div>
	<div class="col-md-4 col-sm-6 col-xs-12 ">
		<!--REVIEW ORDER-->
		<div class="panel panel-default cart-class">
			<div class="panel-heading text-center heading-font">
				<h4>Review Order</h4>
			</div>
			<div class="panel-body">
				<div class="col-md-12">
					<div class="heading-address">${addressObj.name}</div>
					<div class="content-font-address">${addressObj.houseNo},
						${addressObj.streetName},</div>
					<div class="content-font-address">${addressObj.district}
						,${addressObj.city},</div>
					<div class="content-font-address">${addressObj.state}-
						${addressObj.pincode}</div>
				</div>
				<div class="col-md-12">
					<hr>
					<div class="col-md-12">
						<strong>Order Total</strong>
						<div class="pull-right content-font">
							<span>$</span><span>${totalCost+200}</span>
						</div>
						<hr>
					</div>

					<button type="button" onClick="myFun()"
						class="btn btn-lg btn-block content-font checkout-color">Place
						Order</button>

				</div>

			</div>
			<!--REVIEW ORDER END-->

		</div>
	</div>
</div>



<jsp:include page="footer.jsp" />

</body>
</html>