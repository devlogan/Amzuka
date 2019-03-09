<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="header.jsp"/>

	<div class="container">

		<c:choose>
			<c:when test="${not empty addressList}">
				<table class="table table-hover">
			<tr>
			    <th>Name</th>
				<th>House No.</th>
				<th>Street Name</th>
				<th>District</th>
				<th>City</th>
				<th>State</th>
				<th>Pincode</th>
				<th>Mobile No.</th>
			</tr>
			
			<c:forEach items="${addressList}" var="address">
			<tr>
			    <td>${address.name}</td>
				<td>${address.houseNo}</td>
				<td>${address.streetName}</td>
				<td>${address.district}</td>
				<td>${address.city}</td>
				<td>${address.state}</td>
				<td>${address.pincode}</td>
				<td>${address.mobileNo}</td>
				<th>Update</th>
				<th>Delete</th>
				<th>
					<a href="${rootdir}/confirmationPage?address=${address.id}" class="btn btn-info">
						Deliver to this Address
					</a>
				</th>
			</tr>
			</c:forEach>
			
		</table>
	
			</c:when>
			<c:otherwise>
				No existing address available
			</c:otherwise>
		</c:choose>	
	
	
	<h1>Add New Address</h1>
	<f:form action="${rootdir}/addAddress" method="post" modelAttribute="addressObj">
	    
	    <div class="form-group">
      		<label for="name">Name:</label>
      		<f:input type="text" class="form-control" id="name" placeholder="Name" path="name"/>
      		<f:errors style="color:red" path="name"/>	
    	</div>
	    
		<div class="form-group">
      		<label for="houseNo">House no.</label>
      		<f:input type="text" class="form-control" id="houseNo" placeholder="House no." path="houseNo"/>
      		<f:errors style="color:red" path="houseNo"/>	
    	</div>
    	
    	<div class="form-group">
      		<label for="streetName">Street Name:</label>
      		<f:input type="text" class="form-control" id="streetName" placeholder="Street Name" path="streetName"/>
      		<f:errors style="color:red" path="streetName"/>	
    	</div>
    	
    	<div class="form-group">
      		<label for="district">District:</label>
      		<f:input type="text" class="form-control" id="city" placeholder="District" path="district"/>
      		<f:errors style="color:red" path="district"/>	
    	</div>
    	
    	<div class="form-group">
      		<label for="city">City:</label>
      		<f:input type="text" class="form-control" id="state" placeholder="City" path="city"/>
      		<f:errors style="color:red" path="city"/>	
    	</div>
    	
    	<div class="form-group">
      		<label for="state">State:</label>
      		<f:input type="text" class="form-control" id="pincode" placeholder="State" path="state"/>
      		<f:errors style="color:red" path="state"/>	
    	</div>
    	<div class="form-group">
      		<label for="pincode">Pin Code:</label>
      		<f:input type="text" class="form-control" id="pincode" placeholder="Pincode" path="pincode"/>
      		<f:errors style="color:red" path="pincode"/>	
    	</div>
    	
    	<div class="form-group">
      		<label for="mobileNo">Mobile no.</label>
      		<f:input type="text" class="form-control" id="mobileNo" placeholder="Mobile No." path="mobileNo"/>
      		<f:errors style="color:red" path="mobileNo"/>	
    	</div>
    	
    	<button type="submit" class="btn btn-default">Add Address</button>
    </f:form>	
	</div>
<div style="margin-top:300px">
<jsp:include page="footer.jsp"/>
</div>