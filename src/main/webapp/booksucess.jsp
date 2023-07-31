
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin:Add Books</title>
<%@include file="allCss.jsp"%>
</head>
<body style="background-color: #f0f2f2">
	<%@include file="navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
					<h4 class="text-center">Add Books</h4>
						<div class="text-center" style="color: green;">
						<h7>Book added successfully </h7>
						</div> 
						<form action="add" method="post" enctype="multipart/form-data">

							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Book Name*</label> <input type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									required="required" name="bookname">
							</div>
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Author Name*</label> <input type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									required="required" name="author">
							</div>
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Price*</label> <input type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									required="required" name="price">
							</div>
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Book Categories</label><select id="inputState" name="categories" class="form-control">
								<option selected="selected">--select--</option>
								<option value="New">New Book</option>
								</select>
							</div>

							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Book Status</label>
								<select id="inputState" name="status" class="form-control">
								<option selected="selected">--select--</option>
								<option value="Active">Active</option>
								<option value="Inactive">Inactive</option>
								</select>
							</div>
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Upload Photo</label> <input type="file" class="form-control-file" en
									id="exampleInputEmail1" aria-describedby="emailHelp"
									required="required" name="bimg">
							</div>
							<button type="submit" class="btn btn-primary">Add</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-top: 227px;">
<%@include file="footer.jsp" %>
</div>
</body>
</html>