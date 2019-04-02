<%@page import="bean.users.UserBean"%>
<%@page import="bean.bookbean.BookIssueBean"%>
<%@page import="bean.bookbean.BookBean"%>
<%@page import="utils.*"%>
<%@page import="java.util.*"%>
<%@ page import="admin.services.AdminServices"%>
<%@ page import="services.users.UserService"%>
<%@include file="inc/header.jsp"%>
<div id="soft-all-wrapper">
	<%@include file="inc/side-menue.jsp"%>
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Book Request</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<div class="row" style="padding-top: 50px;">
			<form action="${base_url}/user/Books.jsp" method="post">
				<div class="col-md-10">
					<div class="form-group">
						<input type="text" name="search" class="form-control"
							placeholder="Enter Title, Author Name, Book Name, etc">
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
		<div class="row" style="padding: 50px">
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
					<div class="table-title">
						<div class="row">
							<div class="col-md-6">
								<p>
									<span style="font-size: 18px; font-weight: bold;">
										Book Request Approval 
									</span> 
								</p>
							</div>
						</div>
					</div>
					<div class="table-responsive" style="padding: 20px 0px 20px 0px">
						<table class="table table-striped table-hover">
							<thead>
								<tr>
									<th>S.NO</th>
									<th>User Name</th>
									<th>Book Title</th>
									<th>Book Book Author</th>
									<th>Book Publisher</th>
									<th>Request Date</th>
									<th>Book Available Copies</th>
									<th class="text-center">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
									AdminServices as = new AdminServices();
									List<BookIssueBean> list = null;
									String keyWord = request.getParameter("search");
									if (keyWord != null) {
										list = as.getAllBookRequests();
									} else {
										list = as.getAllBookRequests();
									}
									int sno = 1;
									for (BookIssueBean bean : list) {
										BookBean bk = bean.getBook();
										UserBean userb = bean.getUser();
								%>
								<tr>
									<td><%=sno%></td>
									<td><%=userb.getFirstName()+" "+userb.getLastName()%></td>
									<td><%=bk.getBookTitle()%></td>
									<td><%=bk.getBookAuthor()%></td>
									<td><%=bk.getBookPublisher()%></td>
									<td><%=bean.getRequestDate()%></td>
									<td><%=bk.getAvailableCopies()%></td>
									<td class="text-center">
										<%
										if (bean.getStatus().equals("0")) {
										%> 
										<a href="${base_url}/admin/book/acceptRequest/<%=bean.getId()%>"
											title="Accept Book Request" class="btn btn-info"> <i
												class="fa fa-cart"></i> Accept
										</a> 
										<% } if(bean.getStatus().equals("1")){ %>
										<a href="${base_url}/admin/book/decline/<%=bean.getId()%>"
										title="Request For Issue Book" class="btn btn-warning"> <i
											class="fa fa-cart"></i> Decline
										</a>
										<%
	 									} if(bean.getStatus().equals("2")) {
	 									%>
	 									<a href="${base_url}/admin/book/acceptRejected/<%=bean.getId()%>"
										title="Request For Issue Book" class="btn btn-success"> <i
											class="fa fa-cart"></i> Accept Rejected
										</a>
										<% } %>
									</td>
								</tr>
								<%
									sno++;
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