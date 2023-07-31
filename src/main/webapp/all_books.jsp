<%@page import="com.model.MySql"%>
<%@page import="java.util.List"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin:All Books</title>
<%@include file="allCss.jsp" %> 
</head>
<body><%@include file="navbar.jsp" %>
<%
List bookDetails=MySql.bookDetails();
%>
<h1 class="text-center">Hello Admin</h1>
<table class="table table-striped">
  <thead class="bg-primary text-white">
    <tr>
      <th scope="col">Id</th>
      <th scope="col">Image</th>
      <th scope="col">Book Name</th>
      <th scope="col">Author</th>
      <th scope="col">Price</th>
      <th scope="col">Categories</th>
      <th scope="col">Status</th>
      <th scope="col">Admin</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
			<%		          for(int i=0; i<bookDetails.size(); i++) {
				        	 String[] custArr=((String)bookDetails.get(i)).split(":");    	 
				    %>
				    <tr>
			<td><%=custArr[0] %></td>	    
      <td><img src="book/<%=custArr[6]%>" style="width: 50px;height: 50px;"></td>
      <td><%=custArr[1] %></td>
      <td><%=custArr[2] %></td>
      <td><%=custArr[3] %></td>
      <td><%=custArr[4] %></td>
      <td><%=custArr[5] %></td>
      <td><%=custArr[7] %></td>
      <td>
      <a href="editbooks.jsp?book_id=<%=custArr[0]%>" class="btn btn-sm btn-primary"><i class="fa-solid fa-pen-to-square"></i>Edit</a>
      <a href="delete?id=<%=custArr[0]%>" class="btn btn-sm btn-danger"><i class="fa-solid fa-trash-can"></i>Delete</a>
      </td>
    </tr>
				    <%
				    }
				    %>


		</tbody>
</table>
</body>
<div style="margin-top: 227px;">
<%@include file="footer.jsp" %>
</div>
</html>