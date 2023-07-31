<%@page import="com.model.MySql"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Recent Book</title>
<%@ include file="all_component/allCss.jsp"%>
<style type="text/css">
.back-img {
	background: url("img/b.jpg");
	height: 50vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

.crd-ho:hover {
	background-color: #e3dadb;
}
</style>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container">
		<h3 class="text-center">Old Book</h3>
		<div class="row">
			<%
			List oldbook=MySql.oldBook();
			
			 for(int i=0; i<oldbook.size(); i++) {
	        	 String[] obook=((String)oldbook.get(i)).split(":");
			%>
			<div class="col-md-3">
				<div class="card crd-ho mt-3">
					<div class="card-body text-center">
						<img alt="" src="book/<%=obook[6] %>"
							style="width: 100px; height: 150px" class="img-thumblin">
							<p><%=obook[1] %></p>
						<p><%=obook[2] %></p>
						<p>Categories:<%=obook[4] %></p>
						<div class="row">
							<a href="oldviewbook.jsp?book_id=<%=obook[0]%>"
								class="btn btn-success btn-sm ml-5">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=obook[3]%><i
								class="fa-solid fa-indian-rupee-sign fa-2xs"></i></a>
						</div>
					</div>
				</div>
			</div>
			<%
			 }
			%>	
		</div>
	</div>

</body>
</html>