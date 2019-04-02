<%@include file="WEB-INF/include/header.jsp"%>
<div class="container">
	<div class="row">
		<div class="col-sm-6 col-md-4 col-md-offset-4">
			<div class="account-wall text-center">
				<img class="profile-img"
					src="<c:url value='/resources/img/photo.png' />"
					alt="">
				<form action="login" method="POST" class="form-signin">
					<%
						if (session.getAttribute("errorMessage") != null) {
					%>
					<div class="form-group">
						<div class="alert alert-danger">${errorMessage}</div>
					</div>
					<% session.removeAttribute("errorMessage"); } %>
					
					<%
						if (session.getAttribute("errorMessageLogin") != null) {
					%>
					<div class="form-group">
						<div class="alert alert-danger">${errorMessageLogin}</div>
					</div>
					<% session.removeAttribute("errorMessageLogin"); } %>
				
					<div class="form-group">
						<input type="text" name="email" class="form-control" value="${email}" placeholder="Email" required autofocus>
					</div> 
					<div class="form-group">
						<input type="password" name="password" class="form-control" placeholder="Password" required>
					</div>
					<div class="form-group">
						<button class="btn btn-lg btn-primary btn-block" type="submit">	Sign in</button>
					</div>
					<label class="checkbox pull-left"> 
						<input type="checkbox" value="remember-me"> Remember me
					</label> 
					<a href="#" class="pull-right need-help">Need help? </a>
					<span class="clearfix"></span>
				</form>
				<a href="${base_url}/register.jsp" class="text-center btn btn-info">Create an account </a>
			</div>
		</div>
	</div>
</div>
<%@ include file="WEB-INF/include/footer.jsp"%>