<%@taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="header.jsp" />


<div class="container">
	<fieldset>
		<legend>Register</legend>
		<f:form action="${rootdir}/register" method="post"
			modelAttribute="CustomerObj">

			<div class="form-group">
				<label for="email">Email : </label>
				<f:input type="email" class="form-control" path="email" />
				<f:errors class="input-errors" path="email" />
			</div>

			<div class="form-group">
				<label for="Name"> Name:</label>
				<f:input type="text" class="form-control" path="customerName" />
				<f:errors class="input-errors" path="customerName" />
			</div>

			<div class="form-group">
				<label for="password">Password:</label>
				<f:input type="password" class="form-control" path="password" />
				<f:errors class="input-errors" path="password" />
			</div>

			<div class="form-group">
				<label for="confirmPassword">Confirm Password:</label>
				<f:input type="password" class="form-control" path="cnfPassword" />
				<f:errors class="input-errors" path="cnfPassword" />
			</div>

			<div class="form-group">
				<label for="phone">Contact Number:</label>
				<f:input type="text" class="form-control" path="mobileNo" />
				<f:errors class="input-errors" path="mobileNo" />
			</div>

			<button type="submit" class="btn btn-primary">Create My
				Account</button>
		</f:form>
	</fieldset>
</div>