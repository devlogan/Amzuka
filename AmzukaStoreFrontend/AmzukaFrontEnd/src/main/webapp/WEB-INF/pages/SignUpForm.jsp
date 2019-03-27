<%@taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="header.jsp" />
<script>
var check = function() {
	  if (document.getElementById('password').value ==
	    document.getElementById('confirm_password').value) {
	    document.getElementById('message').style.color = 'green';
	    document.getElementById('message').innerHTML = 'matching';
	  } else {
	    document.getElementById('message').style.color = 'red';
	    document.getElementById('message').innerHTML = 'not matching';
	  }
	}
</script>
<style>
.register-button {
	font-family: 'Futura', sans-serif;
	width: 300px;
	height: 43px;
	background-color: #5f6060;
	color: #fff;
	border: none;
	font-weight: 600;
	margin-bottom: 10px
}
</style>
<div class="container" style="margin-top:50px">
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
				<f:input type="password" class="form-control" id="password" path="password" onkeyup='check();' />
				<f:errors class="input-errors" path="password" />
			</div>

			<div class="form-group">
				<label for="confirmPassword">Confirm Password:</label>
				<f:input type="password" class="form-control" id="confirm_password" path="cnfPassword" onkeyup='check();'/>
				<span id='message'></span>
			</div>

			<div class="form-group">
				<label for="phone">Contact Number:</label>
				<f:input type="text" class="form-control" path="mobileNo" />
				<f:errors class="input-errors" path="mobileNo" />
			</div>

			<button type="submit" class="btn register-button">Create My
				Account</button>
		</f:form>
	</fieldset>
</div>
<jsp:include page="footer.jsp" />