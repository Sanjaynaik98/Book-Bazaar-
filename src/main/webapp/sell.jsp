<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EBook: Sell Book</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #d8d9d0;">
	<%@include file="all_component/usernavbar.jsp"%>
	<div class="container mt-3">
	<div class="row">
	<div class="col-md-4 offset-md-4">
	<div class="card">
	<div class="card-body">
	<h5 class="text-center text-primary p-1">Sell Old Book</h5>
	<%
    List uid = MySql.userId();
    int counter = 0; // initialize counter variable
    for (int j = 0; j < uid.size(); j++) {
    	if(counter==1){
    		break;}
        String[] u = ((String) uid.get(j)).split(":");
        counter++;
    %>
	<form action="sell" method="post" enctype="multipart/form-data">
<input type="hidden" value="<%=u[2]%>" name="email">
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
								<label for="exampleInputEmail1" class="form-label">Upload Photo</label> <input type="file" class="form-control-file" en
									id="exampleInputEmail1" aria-describedby="emailHelp"
									required="required" name="bimg">
							</div>
							<button type="submit" class="btn btn-primary">Sell</button>
						</form>
						<% }%>
	</div>
	
	</div>
	</div>
	
	</div>
	
	</div>
</body>
</html>