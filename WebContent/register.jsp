<%@ include file="WEB-INF/include/header.jsp"%>

<div class="container">
	<div class="row">
		<div class="col-sm-6 col-md-4 col-md-offset-4">
			<div class="account-wall">
				<img class="profile-img"
					src="<c:url value='/resources/img/photo.png' />" alt="">
				<form action="register" method="POST" class="form-signin">

					<%
						if (request.getAttribute("errorMessage") != null) {
					%>
					<div class="form-group">
						<div class="alert alert-danger">${errorMessage}</div>
					</div>
					<%
						}
						if (session.getAttribute("successMessage") != null) {
					%>
					<div class="form-group">
						<div class="alert alert-success">${successMessage}</div>
					</div>
					<%
						session.removeAttribute("successMessage");
						}
					%>

					<div class="form-group">
						<input type="text" name="firstName" value="${firstName}"
							class="form-control" placeholder="First Name" required autofocus>
					</div>
					<div class="form-group">
						<input type="text" name="lastName" value="${lastName}"
							class="form-control" placeholder="Last Name" required>
					</div>
					<div class="form-group">
						<input type="email" name="email" value="${email}"
							class="form-control" placeholder="Email" required>
					</div>
					<div class="form-group">
						<input type="password" name="password" class="form-control"
							placeholder="Password" required>
					</div>
					<div class="form-group">
						<input type="password" name="confirmPassword" class="form-control"
							placeholder="Confirm Password" required>
					</div>
					<div class="form-group">
						<button class="btn btn-lg btn-primary btn-block" type="submit">
							Sign in</button>
					</div>
					<a href="#" class="pull-right need-help">Need help? </a> <span
						class="clearfix"></span>
				</form>
				<div class="text-center">
					<a href="${base_url}" class="text-center btn btn-info">Go to
						Login</a>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="WEB-INF/include/footer.jsp"%>