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
    <c:when test="${supplierObj.supplierId != '0'}">
       <c:set var="submit" value="${rootdir}/updateSupplierProcess" />
    </c:when>   
    <c:otherwise>
       <c:set var="submit" value="${rootdir}/addSupplierProcess" />
    </c:otherwise>
    </c:choose>
	
	 <f:form action="${submit}" method="post" modelAttribute="supplierObj">
	  
	    <c:if test="${supplierObj.supplierId != '0'}">
        <div  class="form-group col-md-6">
      		<label for="supplierId">Supplier Id:</label>
      		<f:input  type="text" class="form-control"  path="supplierId" readonly="true"/>
    	</div>
	    </c:if>
	    
	 
	    
		<div class="form-group col-md-6">
      		<label for="supplierName">Supplier Name:</label>
      		<f:input type="text" class="form-control"  placeholder="Enter Supplier Name" path="supplierName"/>
      		<f:errors style="color:red" path="supplierName"/>
    	</div>
    	<div class="form-group col-md-6">
      		<label for="supplierAdd">Supplier Address:</label>
      		<f:input type="text" class="form-control" placeholder="Enter Supplier Description" path="supplierAdd"/>
      		<f:errors style="color:red" path="supplierAdd"/>
    	</div>
    	<br>
    	<div class="col-md-12">
    	<button type="submit" class="btn btn-default">Submit</button>
        </div>
 

    </f:form>
   
	</div>
	
<jsp:include page="footer.jsp"/>
	
</body>
</html>