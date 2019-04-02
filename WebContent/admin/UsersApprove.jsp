<%@page import="bean.users.AuthBean"%>
<%@page import="bean.users.NotificationBean"%>
<%@page import="services.users.UserService"%>
<%@page import="bean.bookbean.BookBean"%>
<%@page import="utils.*"%>
<%@page import="java.util.*"%>
<%@ page import="admin.services.AdminServices"%>
<%@include file="inc/header.jsp"%>
<div id="soft-all-wrapper">
	<%@include file="inc/side-menue.jsp"%>
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">User Approval</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<div class="row" style="padding-top: 50px;">
			<form action="${base_url}/admin/UsersApprove.jsp" method="post">
				<div class="col-md-10">
					<div class="form-group">
						<input type="text" name="search" class="form-control"
							placeholder="Enter First Name, Last Name, etc">
					</div>
				</div>
				<div class="col-md-2">
					<div class="form-group">
						<button class="form-control btn btn-info">
							<i class="fa fa-search"></i> Search
						</button>
					</div>
				</div>
			</form>
		</div>
		<%
			if (session.getAttribute("successMessage") != null) {
		%>
		<div class="row" style="padding: 50px 50px 0px 50px;">
			<div class="col-md-12">
				<div class="alert alert-success"><%=session.getAttribute("successMessage")%></div>
			</div>
		</div>
		<%
			session.removeAttribute("successMessage");
			}
		%>
		<!-- row -->
		<div class="row" style="padding-top: 20px;">
			<div class="col-lg-12">
				<div class="table-wrapper">
					<!-- <div class="table-title">
						<div class="row">
							<div class="col-md-6">
								<h2>
									<b>Books Management</b>
								</h2>
							</div>
						</div>
					</div> -->
					<div class="table-responsive" style="padding: 20px 0px 20px 0px">
						<table class="table table-striped table-hover">
							<thead>
								<tr>
									<th>S.NO</th>
									<th>User Name</th>
									<th>User Email</th>
									<th>User Role</th>
									<th>Status</th>
									<th class="text-center">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
									//UserService us = new UserService();
									List<UserBean> list = null;
									String keyWord = request.getParameter("search");
									if(keyWord != null){
										list = us.getAllUsersByKeyWord(keyWord);

									}
									else{
										list = us.getAll();
									}
									
									int sno = 1;
									if (list.size() > 1) {
										for (UserBean bean : list) {
											RolesBean rb = bean.getRoles();
											if(rb.getId() == 1){
												continue;
											}
											AuthBean auth = us.getEmailByUser(bean);
								%>
								<tr>
									<td><%=sno%></td>
									<td><%=bean.getFirstName() + " " + bean.getLastName()%></td>
									<th><%=auth.getEmail()%>
									<td><%=rb.getRole()%></td>
									<th>
									<td>
										<%
											if (bean.getStatus().equals("2")) {
												out.print("<label class='label label-danger'> Banned</label>");
											}
											else if (bean.getStatus().equals("1")) {
												out.print("<label class='label label-success'> Active </label>");
											} 
											else if(bean.getStatus().equals("0")) {
												out.print("<label class='label label-warning'>In-Active</label>");
											}
										%>
									</td>
									<td align="right">
									<% if(!bean.getStatus().equals("1")){ %>
									<a
										href="${base_url}/admin/users/active/<%=bean.getId()%>"
										title="Mark As Read" class="btn btn-info"> Active
									</a>
									<% } if(!bean.getStatus().equals("0")){ %> 
									<a
										href="${base_url}/admin/users/deactive/<%=bean.getId()%>"
										title="Mark As Read" class="btn btn-warning"> Deactive
									</a> 
									<% } if(!bean.getStatus().equals("2")){ %>
									<a
										href="${base_url}/admin/users/banned/<%=bean.getId()%>"
										title="Banned" class="btn btn-danger">
										Banned
									</a>
									<% } %>
									</td>
								</tr>
								<%
									sno++;
										}
									} else {
								%>
								<tr>
									<td colspan="6">
										<div class="alert alert-info text-center">No
											Record Found </div>
									</td>
								</tr>
								<%
									}
								%>
							</tbody>
						</table>
					</div>
					<!-- <div class="clearfix">
						<div class="hint-text">
							Showing <b>5</b> out of <b>25</b> entries
						</div>
						<ul class="pagination">
							<li class="page-item disabled"><a href="#">Previous</a></li>
							<li class="page-item"><a href="#" class="page-link">1</a></li>
							<li class="page-item"><a href="#" class="page-link">2</a></li>
							<li class="page-item active"><a href="#" class="page-link">3</a></li>
							<li class="page-item"><a href="#" class="page-link">4</a></li>
							<li class="page-item"><a href="#" class="page-link">5</a></li>
							<li class="page-item"><a href="#" class="page-link">Next</a></li>
						</ul>
					</div> -->
				</div>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
	</div>
	<!-- /#page-wrapper -->
</div>
<%@ include file="inc/footer.jsp"%>