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
			<li><a href="${base_url}/admin/index.jsp"><i
					class="fa fa-dashboard fa-fw"></i> Dashboard</a></li>
			<li>
				<a href="${base_url}/admin/Books.jsp">
					<i class="fa fa-book"></i> Books
				</a>
			</li>
			<li>
				<a href="${base_url}/admin/BookRequest.jsp">
					<% 
					AdminServices adminServices = new AdminServices();
					//UserService us = new UserService();
					//UserBean ub = (UserBean) session.getAttribute("user");
					%>
					<i class="fa fa-book"></i> Book Request <span class="sidebar-label"><%=adminServices.getRequestCount()%></span>
				</a>
			</li>
			<li>
				<a href="${base_url}/admin/UsersApprove.jsp">
					<i class="fa fa-user"></i> Users
				</a>
			</li>
			<li>
				<a href="${base_url}/admin/notifications.jsp">
					<i class="fa fa-bell"></i> Notifications <span class="sidebar-label"><% if(us.getNotificationsCount(ub) > -1) out.print(us.getNotificationsCount(ub)); %></span>
				</a>
			</li>
			<li>
				<a href="${base_url}/admin/notifications.jsp">
					<i class="fa fa-envelope fa-fw"></i> Messages
				</a>
			</li>
			<%-- <li><a href="#"> <i class="fa fa-book"></i>Books<span
					class="fa arrow"></span>
			</a>
				<ul class="nav nav-second-level">
					<li><a href="${base_url}/admin/AddBook.jsp">Add Book</a> <a
						href="${base_url}/admin/AddBook.jsp">Add Book</a></li>
				</ul> <!-- /.nav-second-level --></li>
			<li><a href="tables.html"><i class="fa fa-table fa-fw"></i>
					Tables</a></li>
			<li><a href="forms.html"><i class="fa fa-edit fa-fw"></i>
					Forms</a></li>
			<li><a href="#"><i class="fa fa-wrench fa-fw"></i> UI
					Elements<span class="fa arrow"></span></a>
				<ul class="nav nav-second-level">
					<li><a href="panels-wells.html">Panels and Wells</a></li>
					<li><a href="buttons.html">Buttons</a></li>
					<li><a href="notifications.html">Notifications</a></li>
					<li><a href="typography.html">Typography</a></li>
					<li><a href="icons.html"> Icons</a></li>
					<li><a href="grid.html">Grid</a></li>
				</ul> <!-- /.nav-second-level --></li>
			<li><a href="#"><i class="fa fa-files-o fa-fw"></i> Sample
					Pages<span class="fa arrow"></span></a>
				<ul class="nav nav-second-level">
					<li><a href="blank.html">Blank Page</a></li>
					<li><a href="login.html">Login Page</a></li>
				</ul> <!-- /.nav-second-level --></li> --%>
		</ul>
	</div>
	<!-- /.sidebar-collapse -->
</div>