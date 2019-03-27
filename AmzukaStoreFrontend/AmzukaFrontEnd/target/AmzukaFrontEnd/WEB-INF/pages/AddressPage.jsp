<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="header.jsp" />
<style>
.footer-wrapper-address-page .footer-position {
	position: relative
}

.wrapper-container {
	width: 100%;
	margin-top: 30px
}

.address-card {
	margin: 5px;
	padding: 15px;
	border: 1px solid gray;
}

.card-action a {
	margin-right: 15px
}

.name, .mobile-num {
	font-weight: 600
}

.addresscard-wrapper {
	margin-left: 15px
}

.address-button {
	font-family: 'Futura', sans-serif;
	width: 400px;
	height: 43px;
	background-color: #5f6060;
	color: #fff;
	border: none;
	font-weight: 600;
	margin-bottom: 10px;
	align-self: center;
}

.address-title {
	margin-bottom: 10px;
	font-weight: 600;
	font-size: 20px;
	font-family: 'Futura', sans-serif
}

.address-input:focus {
	box-shadow: 1px 2px;
}

.address-wrapper {
	font-family: 'Century Gothic', sans-serif;
	font-size: 13px
}
</style>
<!---Showing Customer Address here---> 
<div class="row wrapper-container">
	<div class="col-md-6 col-sm-12 addresscard-wrapper">
		<div class="heading-address">Address Book</div>
		<c:choose>
			<c:when test="${not empty addressList}">
				<c:forEach items="${addressList}" var="address">
					<div class="col-md-3 col-sm-12 address-card">
						<div class="name content-font-address">${address.name}</div>
						<div class="mobile-num content-font-address">Mob no:
							${address.mobileNo}</div>
						<div class="address-line content-font-address">${address.houseNo},${address.streetName}</div>
						<div class="address-line content-font-address">${address.district},${address.city}</div>
						<div class="address-line content-font-address">${address.state}-${address.pincode}</div>
						<div class="card-action">
							<a href="${rootdir }/deleteAddress?address=${address.id}"><i class="fa fa-close"></i></a><!-- <a href="#"><i class="fa fa-edit"></i></a>--><a
								href="${rootdir}/confirmationPage?address=${address.id}"
								class="btn"> Deliver Here </a>
						</div>
					</div>
				</c:forEach>

			</c:when>
			<c:otherwise>
				No existing address available
			</c:otherwise>
		</c:choose>
	</div>

    <!--- Address Form to add new address ---> 
	<div class="col-md-4 col-sm-12 col-md-offset-1">

		<div class="heading-address address-title">Add New Address</div>
		<f:form action="${rootdir}/addAddress" method="post"
			modelAttribute="addressObj">

			<div class="form-group address-wrapper">
				<label for="name">Name:</label>
				<f:input type="text" class="form-control address-input:focus"
					id="name" placeholder="Name" path="name" />
				<f:errors class="input-errors" path="name" />
			</div>

			<div class="form-group address-wrapper">
				<label for="houseNo">House no.</label>
				<f:input type="text" class="form-control" id="houseNo"
					placeholder="House no." path="houseNo" />
				<f:errors class="input-errors" path="houseNo" />
			</div>

			<div class="form-group address-wrapper">
				<label for="streetName">Street Name:</label>
				<f:input type="text" class="form-control" id="streetName"
					placeholder="Street Name" path="streetName" />
				<f:errors class="input-errors" path="streetName" />
			</div>

			<div class="form-group address-wrapper">
				<label for="district">District:</label>
				<f:input type="text" class="form-control" id="city"
					placeholder="District" path="district" />
				<f:errors class="input-errors" path="district" />
			</div>

			<div class="form-group address-wrapper">
				<label for="city">City:</label>
				<f:input type="text" class="form-control" id="state"
					placeholder="City" path="city" />
				<f:errors class="input-errors" path="city" />
			</div>

			<div class="form-group address-wrapper">
				<label for="state">State:</label>
				<f:input type="text" class="form-control" id="pincode"
					placeholder="State" path="state" />
				<f:errors class="input-errors" path="state" />
			</div>
			<div class="form-group address-wrapper">
				<label for="pincode">Pin Code:</label>
				<f:input type="text" class="form-control" id="pincode"
					placeholder="Pincode" path="pincode" />
				<f:errors class="input-errors" path="pincode" />
			</div>

			<div class="form-group address-wrapper">
				<label for="mobileNo">Mobile no.</label>
				<f:input type="text" class="form-control" id="mobileNo"
					placeholder="Mobile No." path="mobileNo" />
				<f:errors class="input-errors" path="mobileNo" />
			</div>

			<button type="submit" class="address-button">Add Address</button>
		</f:form>

	</div>
</div>
<div>
	<jsp:include page="footer.jsp" />
</div>