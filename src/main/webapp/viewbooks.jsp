<%@page import="java.util.List"%>
<%@page import="com.model.MySql"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>viewbook</title>
<%@ include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #d8d9d0">
	<%@include file="all_component/navbar.jsp"%>
	<%
   	 String bookIdStr = request.getParameter("book_id");
     if(bookIdStr != null) {
        int bid = Integer.parseInt(bookIdStr);
        List viewbook = MySql.viewBook(bookIdStr);
        for(int i=0; i<viewbook.size(); i++) {
            String[] vbook = ((String)viewbook.get(i)).split(":");
    %>
    <div class="container p-3">
        <div class="row">
            <div class="col-md-6 text-center p-5 border bg-white">
                <img alt="" src="book/<%=vbook[6]%>" style="height: 200px; width: 150px;"><br>
                <h4 class="mt-3">Book Name : <span class="text-success"><%=vbook[1] %></span> </h4>
                <h4>Author Name : <span class="text-success"><%=vbook[2] %></span></h4>
                <h4>Category : <span class="text-success"><%=vbook[4] %></span></h4>
            </div>
            <div class="col-md-6 text-center p-5 border bg-white">
                <h2><%=vbook[1] %></h2>
                <div class="row justify-content-center mt-2">
                    <div class="text-danger text-center p-4 d-inline-block">
                        <i class="fa-solid fa-money-bill-wave fa-3x"></i>
                        <p>Cash On Delivery</p>
                    </div>
                    <div class="text-danger text-center p-4 d-inline-block">
                        <i class="fa-solid fa-rotate-left fa-3x"></i>
                        <p>Return Available</p>
                    </div>
                    <div class="text-danger text-center p-4 d-inline-block">
                        <i class="fa-sharp fa-solid fa-truck fa-3x"></i>
                        <p>Free Shipping</p>
                    </div>
                </div>
                <div class="text-center p-3" style="align-items: center; ">
                    <a href="" class="btn btn-primary"><i class="fa-solid fa-cart-plus"></i>Add Cart</a>
                    <a href="" class="btn btn-danger"><%=vbook[3] %><i class="fa-solid fa-indian-rupee-sign"></i></a>
                </div>  
            </div>
        </div>
    </div>
    <% 
        }
    } 
    %>
</body>

</html>