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
				<h1 class="page-header">Books</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<div class="row" style="padding-top: 50px;">
			<form action="${base_url}/admin/Books.jsp" method="post">
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
		<div class="row" style="padding-top: 50px;">
			<div class="col-lg-12">
				<div class="table-wrapper">
					<div class="table-title">
						<div class="row">
							<div class="col-md-6">
								<h2>
									<b>Books Management</b>
								</h2>
							</div>
							<div class="col-md-6 text-right">
								<a href="${base_url}/admin/Books/Book.jsp"
									class="btn btn-primary"> <i class="fa fa-plus"></i> <span>Add
										Book</span>
								</a>
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
									<th>Available Copies</th>
									<th>Total Copies</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<%
									AdminServices as = new AdminServices();
									List<BookBean> list = null;
									String keyWord = request.getParameter("search");
									if(keyWord != null){
										list = as.getBookByKeyWord(keyWord);
									}
									else{
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
									<td><%=bean.getAvailableCopies()%></td>
									<td><%=bean.getTotalCopies()%></td>
									<td>
										<a href="${base_url}/admin/Books/Book.jsp?id=<%=bean.getId()%>" title="Edit" class="btn btn-info">
											<i class="fa fa-edit"></i>
										</a> 
										<%
 										if (bean.getBookStatus().equals("0")) {
 										%> 
 										<a href="${base_url}/admin/book/enable/<%=bean.getId()%>" title="Enable" class="btn btn-info">
											<i class="fa fa-eye"></i>
										</a>
										<%
										} else {
										%> 
										<a href="${base_url}/admin/book/disable/<%=bean.getId()%>" title="Disable" class="btn btn-warning"><i
											class="fa fa-remove"></i>
										</a> <%
 										}
 										%> 
 										<a href="${base_url}/admin/book/delete/<%=bean.getId()%>" title="Delete" class="btn btn-danger">
 											<i class="fa fa-trash"></i>
										</a>
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