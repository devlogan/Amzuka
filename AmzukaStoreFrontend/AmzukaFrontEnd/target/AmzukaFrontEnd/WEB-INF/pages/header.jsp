<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>

<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div  class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="${rootdir}">
      <img style="height: 50px; width: 250px; margin-top: -15px; margin-left: -15px; margin-right: -10px;" alt="Amzuka" src="${images}/websitelogo1.png"></a>
    </div>
    <ul class="nav navbar-nav">
      
      <li><a href="#">About Us</a></li>
      
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Admin <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="${rootdir }/addCategory">Add Category</a></li>
          <li><a href="${rootdir }/viewAllCategories">View Categories</a></li>
          <li><a href="${rootdir }/addSupplier">Add Supplier</a></li>
          <li><a href="${rootdir }/viewAllSuppliers">View Suppliers</a></li>
          <li><a href="${rootdir }/addProduct">Add Product</a></li>
          <li><a href="${rootdir }/viewAllProducts">View Products</a></li>
        </ul>
      </li>
      
    </ul>
    
     <form class="navbar-form navbar-left" action="/action_page.php">
      <div class="form-group">
        <input type="text" class="form-control" placeholder="Search">
      </div>
      <button type="submit" class="btn btn-default">Submit</button>
    </form>
    
    <ul class="nav navbar-nav navbar-right">
      <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </ul>
  </div>
</nav>
  
<!--  <div class="container">
  <h3>Right Aligned Navbar</h3>
  <p>The .navbar-right class is used to right-align navigation bar buttons.</p>
</div>-->


</body>
</html>