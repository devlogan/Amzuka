<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="f" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
			var onClickDelete = function(href){
				var r=confirm("Do you want to delete");
				if(r==true)
					{
					window.location.href="${rootdir}/deleteProduct/"+href;
							
					}
				}
			var onClickUpdate = function(href){
				var r=confirm("Do you want to update")
				if(r==true){
			    window.location.href="${rootdir}/updateProduct/"+href;
				}
			}
		
</script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta charset="ISO-8859-1">
<title>Amzuka Store</title>
<style>
.list-style {
	min-width: auto !important;
	width: 100%;
	border-radius: unset !important
}

.list-button-dropdown {
	border-radius: unset !important
}

.list-style a:hover {
	background-color: #e2d0ed;
	text-decoration: none
}
</style>
</head>

<body>
	<jsp:include page="header.jsp" />

	<c:if test="${not empty message }">
		<div class="alert alert-success">${mesasge}</div>
	</c:if>

	<div class="container">
		<h2>Product List</h2>
		<div class="btn-group">
			<button type="button"
				class="btn btn-secondary dropdown-toggle list-button-dropdown"
				data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				Choose Category<i class="fa fa-caret-down" style="margin-left: 10px"></i>
			</button>

			<div class="dropdown-menu dropdown-menu row list-style">
				<c:forEach items="${sessionScope.categoryList}" var="categoryObj">
					<a class="dropdown-item col-md-12 col-sm-12"
						href="${rootdir}/getAllProductsByCategory/${categoryObj.categoryId}?user=0"
						type="button">${categoryObj.categoryName}</a>
				</c:forEach>
			</div>
		</div>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>Product Id</th>
					<th>Product Name</th>
					<th>Price</th>
					<th>Quantity</th>
					<th colspan="2" align="center">Image</th>
					<th colspan="2" align="center">Operation</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach items="${productList}" var="product">
					<tr>
						<td>${product.productId}</td>
						<td>${product.productName}</td>
						<td>${product.price}</td>
						<td>${product.quantity}</td>
						<td><img src="${images}/${product.imgName}"
							style="height: 150px; width: 90px" /></td>

						<c:if test="${not empty product.imgName1}">
							<td><img src="${images}/${product.imgName1}"
								style="height: 150px; width: 90px" /></td>
						</c:if>

						<c:if test="${empty product.imgName1}">
							<td style="color: red">No image added</td>
						</c:if>

						<td><button type="button"
								onclick="onClickDelete(${product.productId})"
								class="btn btn-primary btn-sm a-btn-slide-text">
								<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
								<span><strong>Delete</strong></span>
							</button></td>
						<td><button type="button"
								onclick="onClickUpdate(${product.productId})"
								class="btn btn-primary btn-sm a-btn-slide-text">
								<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
								<span><strong>Edit</strong></span>
							</button></td>

					</tr>
				</c:forEach>
			</tbody>

		</table>
	</div>

	<jsp:include page="footer.jsp" />
</body>
</html>