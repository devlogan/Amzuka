<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<c:set var="rootdir" value="${pageContext.request.contextPath}" scope="application" />
<spring:url value="/resources/images" var="images" scope="session"/>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro' rel='stylesheet' type='text/css'>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
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
    margin-top: 0; // remove the gap so it doesn't close
 }
  </style>
</head>
	
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div  class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="${rootdir}">
      <img style="height: 50px; width: 250px; margin-top: -15px; margin-left: -15px; margin-right: -10px;" alt="Amzuka" src="${images}/websitelogo1.png"></a>
    </div>
    <ul class="nav navbar-nav" style="color:black;">
    
    <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" href="#"><b>SHOP BY CATEGORY</b>
        </a>
        <ul class="dropdown-menu">
          <c:forEach items="${sessionScope.categoryList}" var="categoryObj">
          <li><a href="${rootdir}/getAllProductsByCategory/${categoryObj.categoryId}">${categoryObj.categoryName}</a></li>
          </c:forEach>
        </ul>
      </li>
      
      <li><a href="#"><b>ABOUT US</b></a></li>
      <li><a href="#"><b>CONTACT US</b></a></li>
      
      <sec:authorize access="hasAuthority('Admin')">
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"><b>ADMIN</b> <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="${rootdir }/addCategory">Add Category</a></li>
          <li><a href="${rootdir }/viewAllCategories">View Categories</a></li>
          <li><a href="${rootdir }/addSupplier">Add Supplier</a></li>
          <li><a href="${rootdir }/viewAllSuppliers">View Suppliers</a></li>
          <li><a href="${rootdir }/addProduct">Add Product</a></li>
          <li><a href="${rootdir }/viewAllProducts">View Products</a></li>
        </ul>
      </li>
      
      </sec:authorize>
       <sec:authorize access="hasAuthority('Customer')">
      <li><a href="${rootdir}/viewCart"><span class="glyphicon glyphicon-shopping-cart"></span><b>Bag(${itemsCount})</b></a></li>
      </sec:authorize>
    </ul>
    
    
     <form class="navbar-form navbar-left" action="/action_page.php">
      <div class="form-group">
        <input type="text" class="form-control" placeholder="Search">
      </div>
      <button type="submit" class="btn btn-default">Submit</button>
    </form>
    
     <ul class="nav navbar-nav navbar-right">
    <sec:authorize access="isAnonymous()">
   
      <li><a href="${rootdir }/registerCustomer"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="${rootdir }/login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </sec:authorize>
       
       <sec:authorize access="isAuthenticated()">
      	<li><p class="text-success">Welcome <strong>${sessionScope.customerObj.customerName}</strong></p></li>
      	<li><a href="${rootdir}/logout"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
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