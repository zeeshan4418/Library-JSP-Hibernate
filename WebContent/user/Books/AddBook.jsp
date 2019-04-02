<%@include file="../inc/header.jsp"%>
<style>
.switch {
	position: relative;
	display: inline-block;
	width: 60px;
	height: 34px;
}

.switch input {
	opacity: 0;
	width: 0;
	height: 0;
}

.slider {
	position: absolute;
	cursor: pointer;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: #ccc;
	-webkit-transition: .4s;
	transition: .4s;
}

.slider:before {
	position: absolute;
	content: "";
	height: 26px;
	width: 26px;
	left: 4px;
	bottom: 4px;
	background-color: white;
	-webkit-transition: .4s;
	transition: .4s;
}

input:checked+.slider {
	background-color: #2196F3;
}

input:focus+.slider {
	box-shadow: 0 0 1px #2196F3;
}

input:checked+.slider:before {
	-webkit-transform: translateX(26px);
	-ms-transform: translateX(26px);
	transform: translateX(26px);
}

/* Rounded sliders */
.slider.round {
	border-radius: 34px;
}

.slider.round:before {
	border-radius: 50%;
}
</style>
<div id="soft-all-wrapper">
	<%@include file="../inc/side-menue.jsp"%>
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Books</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<%
			if (session.getAttribute("errorMessage") != null) {
		%>
		<div class="row" style="padding: 50px">
			<div class="col-md-12">
				<div class="alert alert-danger"><%=session.getAttribute("errorMessage")%></div>
			</div>
		</div>
		<%
			}
		%>
		<form action="${base_url}/admin/book/add" method="post">
			<div class="row" style="padding: 50px;">
				<div class="col-md-6">
					<div class="form-group">
						<label>Enter Title <span class="text-danger">*</span></label> <input
							type="text" name="bookTitle" value="${bookTitle}" placeholder="Enter Book Title"
							class="form-control" required />
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label>Enter Author <span class="text-danger">*</span></label> <input
							type="text" name="bookAuthor" value="${bookAuthor}"
							placeholder="Enter Book Author Name" class="form-control"
							required />
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label>Enter Publisher <span class="text-danger">*</span></label>
						<input type="text" name="bookPublisher" value="${bookPublisher}"
							placeholder="Enter Book Publisher Name" class="form-control"
							required />
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label>Enter Total Copies <span class="text-danger">*</span></label>
						<input type="number" min="1" name="bookCopies" value="${bookCopies}"
							placeholder="Enter Book Total Copies" class="form-control"
							required />
					</div>
				</div>
				<div class="col-md-12">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label> Enter Book URL <span class="text-danger">*</span></label>
								<input name="bookLink" value="${bookLink}" placeholder="Enter URL" type="text"
									class="form-control" />
							</div>
						</div>
						<div class="col-sm-6 col-md-6 col-lg-6"></div>
					</div>
				</div>
				<div class="col-md-12">
					<div class="row">
						<div class="col-md-4">
							<label style="padding: 10px">Book Status </label> 
							<label class="switch">  
							<input name="bookStatus" type="checkbox" <% if(request.getAttribute("bookStatus") == "1"){ out.print("checked"); } %> />
								<span class="slider round"></span>
							</label>
						</div>
						<div class="col-md-8"></div>
					</div>
				</div>
				<div class="col-md-12" style="padding-top: 100px;">
					<div class="text-center">
						<button type="submit" class="btn btn-primary">Add</button>
						<button class="btn btn-danger" id="reset">Reset</button>
					</div>
				</div>
			</div>
		</form>
	</div>
	<!-- /#page-wrapper -->
</div>
<%@ include file="../inc/footer.jsp"%>
<script type="text/javascript">
	
</script>