<%@page import="bean.users.UserBean"%>
<%@page import="services.users.UserService"%>
<%@page import="admin.services.AdminServices"%>
<div class="navbar-default sidebar" role="navigation">
	<div class="sidebar-nav navbar-collapse">
		<ul class="nav" id="side-menu">
			<li class="sidebar-search">
				<div class="input-group custom-search-form">
					<input type="text" class="form-control" placeholder="Search...">
					<span class="input-group-btn">
						<button class="btn btn-default" type="button">
							<i class="fa fa-search"></i>
						</button>
					</span>
				</div> <!-- /input-group -->
			</li>
			<% 
				UserService us = new UserService();
				//UserBean ub = (UserBean) session.getAttribute("user");
			%>
			<li>
				<a href="${base_url}/user/index.jsp"><i
					class="fa fa-dashboard fa-fw"></i> Dashboard</a>
			</li>
			<li>
				<a href="${base_url}/user/Books.jsp">
					<i class="fa fa-book"></i> Books
				</a>
			</li>
			<li>
				<a href="${base_url}/user/notifications.jsp">
					<i class="fa fa-book"></i> Notifications 
					<% if(us.getNotificationsCount(ub) < 0){ %>
					<span class="sidebar-label">
						<%=us.getNotificationsCount(ub)%>
					</span> 
					<% } %>
				</a>
			</li>
		</ul>
	</div>
	<!-- /.sidebar-collapse -->
</div>