<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!------ Include the above in your HEAD tag ---------->

<script>
	var myFun = function() {
		window.location = "${rootdir}/getAddressPage";
	}
</script>
<style>
.footer-margin{
margin-bottom:500px
}
</style>

<jsp:include page="header.jsp" />

<c:if test="${msg!=null}">
	<div class="row cart-wrapper">
		<h1 class="panel-heading text-center footer-margin">Empty Cart</h1>
	</div>
</c:if>

<c:if test="${msg==null}">
	<div class="row cart-wrapper">
		<br>
		<div class="col-md-12">

			<div class="col-md-8 col-sm-6 col-xs-12">
				<!--SHIPPING METHOD-->
				<div class="panel panel-default cart-class">
					<div class="panel-heading text-center heading-font">
						<h4>Current Cart</h4>
					</div>
					<div class="panel-body">
						<c:forEach items="${cartItems}" var="item">
							<table class="table borderless">
								<thead>
									<tr>
										<td class="content-font"><strong>Your Cart: #
												item</strong></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="col-md-3">
											<div class="media content-font">
												<a class="thumbnail pull-left" href="#"> <img
													class="media-object"
													src="${images}/${item.product.imgName}"
													style="width: 72px; height: 72px;">
												</a>
												<div class="media-body">
													<h5 class="media-headings">${item.product.productName}</h5>
													<c:choose>
														<c:when test="${item.quantity<item.product.quantity}">
															<span class="text-success"><strong>In
																	Stock</strong></span>
														</c:when>
														<c:otherwise>
															<span class="text-danger"><strong>Out Of
																	Stock</strong></span>
														</c:otherwise>
													</c:choose>
												</div>
											</div>
										</td>
										<td class="text-center content-font">${item.price}</td>
										<td class="text-center content-font"><span
											class="inc-dec"> <a class="btn dec-btn content-font"
												href="${rootdir}/decreaseQuantity/${item.itemId}?deleteItem=0">-</a>${item.quantity}
												<a class="btn inc-btn content-font"
												href="${rootdir}/increaseQuantity/${item.itemId}">+</a>
										</span></td>
										<td class="text-right content-font">${item.quantity*item.price}</td>
										<td class="text-right"><a
											href="${rootdir}/decreaseQuantity/${item.itemId}?deleteItem=1"
											type="button" class="btn btn-danger"> <i
												class="fa fa-trash-o"></i>
										</a></td>
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
							<strong>Subtotal (# item)</strong>
							<div class="pull-right content-font">
								<span class="fa fa-inr"></span><span>${totalCost}</span>
							</div>
						</div>
						<div class="col-md-12">
							<small>Shipping</small>
							<div class="pull-right content-font">
								<span>200</span>
							</div>
							<hr>
						</div>
						<div class="col-md-12">
							<strong>Order Total</strong>
							<div class="pull-right content-font">
								<span class="fa fa-inr"></span><span>${totalCost+200}</span>
							</div>
							<hr>
						</div>

						<button type="button" onClick="myFun()"
							class="btn btn-lg btn-block content-font checkout-color">Checkout</button>

					</div>

				</div>
				<!--REVIEW ORDER END-->

			</div>
		</div>
	</div>
</c:if>



<jsp:include page="footer.jsp" />