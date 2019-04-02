<%@page import="bean.users.NotificationBean"%>
<%@page import="services.users.UserService"%>
<%@page import="bean.bookbean.BookBean"%>
<%@page import="utils.*" %>
<%@page import="java.util.*" %>
<%@ page import="admin.services.AdminServices"%>
<%@include file="inc/header.jsp"%>
<div id="soft-all-wrapper">
	<%@include file="inc/side-menue.jsp"%>
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Notifications</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
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
									<th>User</th>
									<th>Notification Message</th>
									<th>Date</th>
									<th class="text-center">Action</th>
								</tr>
							</thead>
							<tbody>
						<%
							List<NotificationBean> list = null;
							list = us.getAllNotificationByUser(ub);
							int sno = 1;
							if(list.size() > 1){
									for (NotificationBean bean : list) {
								%>
								<tr>
									<td><%=sno%></td>
									<td><%=bean.getAgentId()%></td>
									<td><%=bean.getMessage()%></td>
									<td><%=bean.getDate()%></td>
									<td align="right">
										<a href="${base_url}/user/notification/markAsRead/<%=bean.getId()%>" title="Mark As Read" class="btn btn-info">
											<i class="fa fa-cart"></i> Read
										</a>
										<a href="${base_url}/user/notification/markAsRead/<%=bean.getId()%>" title="Mark As Read" class="btn btn-info">
											<i class="fa fa-cart"></i> Mark As Read
										</a>
										<a href="${base_url}/user/notification/markAsRead/<%=bean.getId()%>" title="Mark As Read" class="btn btn-danger">
											<i class="fa fa-trash"></i>
										</a> 
									</td>
								</tr>
								<%
									sno++;
								}
							}
							else { %>
								<tr> 
									<td colspan="5">
										<div class="alert alert-info text-center">
											No Notification Found
										</div>
									</td>
								</tr>
							<% } %>
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