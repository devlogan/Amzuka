<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product Form</title>
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>

	<div class="container">
		<h1>Product</h1>

		<!-- choosing view for Add Or Update Product -->
		<c:choose>
			<c:when test="${productObj.productId != '0'}">
				<c:set var="submit" value="${rootdir}/updateProductProcess" />
			</c:when>
			<c:otherwise>
				<c:set var="submit" value="${rootdir}/addProductProcess" />
			</c:otherwise>
		</c:choose>

		<f:form action="${submit}" method="post" modelAttribute="productObj"
			enctype="multipart/form-data">

			<c:if test="${productObj.productId != '0'}">
				<div class="form-group col-md-6">
					<label for="productName">Product Id:</label>
					<f:input type="text" class="form-control" path="productId"
						readonly="true" />
				</div>
			</c:if>

			<div class="form-group col-md-6">
				<label for="productName">Product Name:</label>
				<f:input type="text" class="form-control"
					placeholder="Enter Product Name" path="productName" />
				<f:errors style="color:red" path="productName" />
			</div>
			<div class="form-group col-md-6">
				<label for="price">Price:</label>
				<f:input type="number" class="form-control"
					placeholder="Enter Product Price" path="price" />
				<f:errors style="color:red" path="price" />
			</div>
			<div class="form-group col-md-6">
				<label for="quantity">Quantity :</label>
				<f:input type="number" class="form-control"
					placeholder="Enter Product Price" path="quantity" />
				<f:errors style="color:red" path="quantity" />
			</div>

			<div class="form-group">
				<label for="categoryId">CategoryId:</label>
				<f:select path="categoryId" class="form-control">
					<f:option value="0">-----Select Category-----</f:option>
					<c:forEach items="${sessionScope.categoryList}" var="categoryObj">
						<f:option value="${categoryObj.categoryId}">${categoryObj.categoryName}</f:option>
					</c:forEach>
				</f:select>
				<f:errors style="color:red" path="categoryId" />
			</div>
			<div class="form-group">
				<label for="path">SupplierId:</label>
				<f:select path="supplierId" class="form-control">
					<f:option value="0">-----Select Supplier-----</f:option>
					<c:forEach items="${sessionScope.supplierList}" var="supplierObj">
						<f:option value="${supplierObj.supplierId}">${supplierObj.supplierName} - ${supplierObj.supplierId}</f:option>
					</c:forEach>
				</f:select>
				<f:errors style="color:red" path="supplierId" />
			</div>

			<div class="form-group">
				<label for="pimage1">Upload Image1:</label>
				<f:input type="file" class="form-control" path="pImage" />
				<f:errors style="color:red" path="pImage" />
			</div>

			<div class="form-group">
				<label for="pimage1">Upload Image2:</label>
				<f:input type="file" class="form-control" path="pImage1" />
				<f:errors style="color:red" path="pImage1" />
			</div>

			<br>
			<div class="col-md-12">
				<button type="submit" class="btn btn-default">Submit</button>
			</div>


		</f:form>

	</div>



</body>
</html>