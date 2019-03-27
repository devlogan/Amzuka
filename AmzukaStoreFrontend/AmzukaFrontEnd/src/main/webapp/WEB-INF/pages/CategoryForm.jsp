<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Category Form</title>
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>

	<div class="container">
		<h1>Category</h1>


		<c:choose>
			<c:when test="${categoryObj.categoryId != '0'}">
				<c:set var="submit" value="${rootdir}/updateCategoryProcess" />
			</c:when>
			<c:otherwise>
				<c:set var="submit" value="${rootdir}/addCategoryProcess" />
			</c:otherwise>
		</c:choose>

		<f:form action="${submit}" method="post" modelAttribute="categoryObj">

			<c:if test="${categoryObj.categoryId != '0' }">
				<div class="form-group col-md-6">
					<label for="categoryName">Category Id:</label>
					<f:input type="text" class="form-control" path="categoryId"
						readonly="true" />
				</div>
			</c:if>



			<div class="form-group col-md-6">
				<label for="categoryName">Category Name:</label>
				<f:input type="text" class="form-control"
					placeholder="Enter Category Name" path="categoryName" />
				<f:errors style="color:red" path="categoryName" />
			</div>
			<div class="form-group col-md-6">
				<label for="categoryDesc">Category Description:</label>
				<f:input type="text" class="form-control"
					placeholder="Enter Category Description" path="categoryDesc" />
				<f:errors style="color:red" path="categoryDesc" />
			</div>
			<br>
			<div class="col-md-12">
				<button type="submit" class="btn btn-default">Submit</button>
			</div>


		</f:form>

	</div>



</body>
</html>