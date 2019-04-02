<%@page import="bean.users.UserBean"%>
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
				<h1 class="page-header">Books</h1>
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
									<span style="font-size: 18px; font-weight: bold;">Books
										Result </span> <span style="font: 12px;"> - Maximum 5 Books
										allowed</span>
								</p>
							</div>
						</div>
					</div>
					<div class="table-responsive" style="padding: 20px 0px 20px 0px">
						<table class="table table-striped table-hover">
							<thead>
								<tr>
									<th>S.NO</th>
									<th>Title</th>
									<th>Author</th>
									<th>Publisher</th>
									<th>Status</th>
									<th class="text-center">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
									AdminServices as = new AdminServices();
									List<BookBean> list = null;
									String keyWord = request.getParameter("search");
									if (keyWord != null) {
										list = as.getBookByKeyWord(keyWord);
									} else {
										list = as.getAllBooks();
									}
									int sno = 1;
									for (BookBean bean : list) {
										
								%>
								<tr>
									<td><%=sno%></td>
									<td><%=bean.getBookTitle()%></td>
									<td><%=bean.getBookAuthor()%></td>
									<td><%=bean.getBookPublisher()%></td>
									<td>
										<%
										if (bean.getAvailableCopies() != 0) {
												out.print("Available");
										} else {
												out.print("Sorry Book is not Available");
										}
										%>
									</td>
									<td class="text-center">
									<% 
								if(us.getBookIssueRequestByBookBeanUserBean(bean, ub, -1, "1") != null){ %>
										<% out.print("<label class='label label-success'>Already Reserved</label>"); %>	
								<% } 
								else{ %>
										<% 	//Long countlimit = us.getBookIssueLimit(ub);
										
											if (us.getBookIssueRequestByBookBeanUserBean(bean, ub, -1, "0") != null) {
										%> 
											<a href="${base_url}/user/book/remove/<%=bean.getId()%>"
												title="Request For Issue Book" class="btn btn-warning"> <i
													class="fa fa-cart"></i> Remove Request
											</a> 
										<%
	 										} else {
	 									%>
		 									<a href="${base_url}/user/book/issue/<%=bean.getId()%>"
											title="Request For Issue Book" class="btn btn-info"> <i
												class="fa fa-cart"></i> Get Book
											</a>  
										<% } 
									}
										%>
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