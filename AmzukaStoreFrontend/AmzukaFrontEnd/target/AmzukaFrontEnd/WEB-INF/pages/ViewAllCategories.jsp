<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
			var onClickDelete = function(href){
				var r=confirm("Do you want to delete");
				if(r==true)
					{
					window.location.href="${rootdir}/deleteCategory/"+href;
							
					}
				}
			var onClickUpdate = function(href){
				var r=confirm("Do you want to update")
				var isUpdateTrue="false";
			    window.location.href="${rootdir}/updateCategory/"+href;
				
			}
		
</script>
<meta charset="ISO-8859-1">
<title>Amzuka Store</title>
</head>

<body>
<jsp:include page="header.jsp"/>
     
     <c:if test="${not empty message }">
     <div class="alert alert-success">	
		${mesasge}
	 </div> 
     </c:if>
     
 <div class="container">
  <h2>Category List</h2>
  <p>All the categories you need</p>            
  <table class="table table-bordered">
    <thead>
      <tr>
        <th>Category Id</th>
        <th>Category Name</th>
        <th>Category Description</th>
        <th colspan="2" align="center">Operation</th>
      </tr>
    </thead>
    
    <tbody>
    <c:forEach items="${categoryList}" var="category">
      <tr>
        <td>${category.categoryId}</td>
        <td>${category.categoryName}</td>
        <td>${category.categoryDesc}</td>
        
          <td><button type="button" onclick="onClickDelete(${category.categoryId})" class="btn btn-primary btn-sm a-btn-slide-text">
          <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
          <span><strong>Delete</strong></span> 
         </button></td>
        <td><button type="button" onclick="onClickUpdate(${category.categoryId})" class="btn btn-primary btn-sm a-btn-slide-text">
        <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
        <span><strong>Edit</strong></span> 
        </button></td>
      </tr>
      </c:forEach>
     </tbody>
     
  </table>
</div>
     
     
</body>
</html>