<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Supplier Form</title>
</head>
<body>
    
    <jsp:include page="header.jsp"></jsp:include>
    
	<div class="container">
	<h1>Supplier</h1>
	
	
	<c:choose>
    <c:when test="${not empty SupplierObj.supplierName}">
       <c:set var="submit" value="${rootdir}/updateSupplierProcess" />
    </c:when>   
    <c:otherwise>
       <c:set var="submit" value="${rootdir}/addSupplierProcess" />
    </c:otherwise>
    </c:choose>
	
	 <f:form action="${submit}" method="post" modelAttribute="supplierObj">
	  
	    <c:if test="${not empty SupplierObj.supplierName}">
        <div  class="form-group col-md-6">
      		<label for="supplierId">Category Id:</label>
      		<f:input  type="text" class="form-control"  path="supplierName" readonly="true"/>
    	</div>
	    </c:if>
	    
	 
	    
		<div class="form-group col-md-6">
      		<label for="categoryName">Supplier Name:</label>
      		<f:input type="text" class="form-control"  placeholder="Enter Category Name" path="supplierName"/>
    	</div>
    	<div class="form-group col-md-6">
      		<label for="categoryDesc">Supplier Description:</label>
      		<f:input type="text" class="form-control" placeholder="Enter Category Description" path="supplierDesc"/>
    	</div>
    	<br>
    	<div class="col-md-12">
    	<button type="submit" class="btn btn-default">Submit</button>
        </div>
 

    </f:form>
   
	</div>
	

	
</body>
</html>