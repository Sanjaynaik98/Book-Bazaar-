
<%@page import="java.util.List"%>
<%@page import="com.model.MySql"%>
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
	<div class="container mt-4">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
					<h4 class="text-center">Edit Books</h4>
					<%
   	 String bookIdStr = request.getParameter("book_id");
     if(bookIdStr != null) {
        int bid = Integer.parseInt(bookIdStr);
        List viewbook=MySql.editView(bookIdStr);
        for(int i=0; i<viewbook.size(); i++) {
            String[] book = ((String)viewbook.get(i)).split(":");
    %>
						<form action="EditBooks" method="post">
						<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label"></label> <input type="hidden" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									required="required" name="id" value="<%=book[0]%>">
							</div>

							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Book Name*</label> <input type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									required="required" name="bookname" value="<%=book[1]%>">
							</div>
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Author Name*</label> <input type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									required="required" name="author" value="<%=book[2]%>">
							</div>
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Price*</label> <input type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									required="required" name="price" value="<%=book[3]%>">
							</div>

							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Book Status</label>
								<select id="inputState" name="status" class="form-control">
								<option selected="selected">--select--</option>
								<option value="Active">Active</option>
								<option value="Inactive">Inactive</option>
								</select>
							</div>
							<button type="submit" class="btn btn-primary">Update</button>
						</form>
						<%
        }
     }
						%>

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