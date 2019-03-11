<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<c:set var="rootdir" value="${pageContext.request.contextPath}"
	scope="application" />
<spring:url value="/resources/images" var="images" scope="session" />
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro'
	rel='stylesheet' type='text/css'>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Century Gothic">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Futura">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Tangerine">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
body {
	font-family: 'Source Sans Pro', sans-serif;
	color: 'Black'
}

nav {
	font-family: 'Source Sans Pro', sans-serif;
	color: 'Black'
}

.dropdown:hover .dropdown-menu {
	display: block;
	margin-top: 0;
	//
	remove
	the
	gap
	so
	it
	doesn't
	close
}

.custom-dropdown {
	width: 100% !important
}

.custom-nav-style {
	border-bottom: 1px solid gray;
	width: 100%;
	border-radius: unset;
	margin: 0px !important;
}

.brand-logo {
	height: 140px;
	width: 250px;
	margin-top: -60px;
	margin-left: -15px;
	margin-right: -10px;
}

.navbar-header {
	font-weight: 600;
	color: black;
}

.custom-head a {
	font-size: 14px
}

.mega-menu {
	border: none;
	padding-top: 20px;
}

.custom-head .nav-itm:hover {
	background: #fff !important;
	border-bottom: 1px solid black;
	padding-bottom: 25px;
	text-shadow: 0px 1px #595959;
}

.custom-head-user .nav-itm-user:hover {
	background: #fff !important;
	border-bottom: 1px solid black;
	padding-bottom: 10px;
}

.footer-position {
	text-align: center;
	width: 100%;
	position: absolute;
	bottom: 0
}

.dec-btn, .inc-btn {
	font-size: 18px;
	font-weight: 600;
	padding-bottom: 10px
}

.cart-wrapper {
	width: 100%;
}

.heading-font {
	font-family: 'Futura', sans-serif;
	background-color: #5f6060;
	color: #fff;
	font-weight: 600;
}

.content-font {
	font-family: 'Century Gothic', sans-serif;
	font-size: 18px
}

.content-font-address {
	font-family: 'Century Gothic', sans-serif;
	font-size: 13px
}

.notes-font {
	font-family: 'Tangerine', serif;
	font-size: 20px;
	font-weight: 600
}

.checkout-color {
	background-color: #5f6060;
	color: #fff
}

.checkout-color:hover {
	color: #fff;
}

.cart-class {
	border-radius: 0px;
}

.heading-address {
	font-family: 'Futura', sans-serif;
	font-weight: 600;
	font-size: 18px
}

.fullwidth {
	width: 100%
}

.footer-wrapper-index-page .footer-position {
	position: relative;
	width: 100%
}

.input-errors {
	color: red;
	font-family: 'Tangerine', serif;
	font-size: 20px
}

.caraousel-image {
	height: 600px !important;
	width: 100%;
}
</style>
</head>

<body>

	<nav
		class="navbar navbar-expand-lg navbar-light bg-light custom-nav-style">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="${rootdir}"> <img
					class="brand-logo" alt="Amzuka" src="${images}/logo.jpg"></a>
			</div>
			<ul class="nav navbar-nav" style="color: black;">
				<li class="custom-head"><a class="nav-itm" href="#"><b
						class="navbar-header">New Arrivals</b></a></li>
				<li class="dropdown custom-head"><a
					class="dropdown-toggle nav-itm" data-toggle="dropdown"
					data-hover="dropdown" href="#"><b class="navbar-header">SHOP
							BY CATEGORY</b> </a>
					<ul class="dropdown-menu mega-menu custom-head">
						<c:forEach items="${sessionScope.categoryList}" var="categoryObj">
							<li><a
								href="${rootdir}/getAllProductsByCategory/${categoryObj.categoryId}?user=1">${categoryObj.categoryName}</a></li>
						</c:forEach>
					</ul></li>

				<li class="custom-head"><a class="nav-itm" href="#"><b
						class="navbar-header">ABOUT US</b></a></li>
				<li class="custom-head"><a class="nav-itm" href="#"><b
						class="navbar-header">CONTACT US</b></a></li>

				<sec:authorize access="hasAuthority('Admin')">
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#"><b class="navbar-header">ADMIN</b>
							<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="${rootdir }/addCategory">Add Category</a></li>
							<li><a href="${rootdir }/viewAllCategories">View
									Categories</a></li>
							<li><a href="${rootdir }/addSupplier">Add Supplier</a></li>
							<li><a href="${rootdir }/viewAllSuppliers">View
									Suppliers</a></li>
							<li><a href="${rootdir }/addProduct">Add Product</a></li>
							<li><a href="${rootdir }/viewAllProducts">View Products</a></li>
						</ul></li>

				</sec:authorize>
			</ul>

			<ul class="nav navbar-nav navbar-right">
				<sec:authorize access="isAnonymous()">

					<li class="custom-head-user"><a class="nav-itm-user"
						href="${rootdir }/registerCustomer"><span
							class="fa fa-user-plus"></span><b class="navbar-header"> Sign
								Up</b></a></li>
					<li class="custom-head-user"><a class="nav-itm-user"
						href="${rootdir }/login"><span class="fa fa-sign-in"></span><b
							class="navbar-header"> Login</b></a></li>
				</sec:authorize>

				<sec:authorize access="isAuthenticated()">
					<li class="dropdown custom-head"><a class="dropdown-toggle"><b
							class="navbar-header">${sessionScope.customerObj.customerName}</b><i
							class="fa fa-caret-down" style="margin-left: 10px; color: black;"></i></a>
						<ul class="dropdown-menu custom-dropdown">
							<li><a href="${rootdir}/logout"><span
									class="glyphicon glyphicon-log-out"></span> Logout</a></li>
						</ul></li>
				</sec:authorize>


				<sec:authorize access="hasAuthority('Customer')">
					<li class="custom-head"><a href="${rootdir}/viewCart"><span
							class="fa fa-shopping-bag"></span><b class="navbar-header">Bag(${itemsCount})</b></a></li>
				</sec:authorize>
			</ul>
		</div>
	</nav>

	<!--  <div class="container">
  <h3>Right Aligned Navbar</h3>
  <p>The .navbar-right class is used to right-align navigation bar buttons.</p>
</div>-->


</body>
</html>