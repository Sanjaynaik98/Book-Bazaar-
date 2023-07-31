<%@page import="java.util.List"%>
<%@page import="com.model.MySql"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ebook: Index</title>
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
<body style="background-color: #d8d9d0;">
	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid back-img">
		<h2 class="text-center text-white">E-Book Management System</h2>
	</div>

	<!-- Start Recent Book -->
	
	<div class="container">
    <h3 class="text-center">Recent Book</h3>
    <%
    List uid = MySql.userId();
    int counter = 0; // initialize counter variable
    for (int j = 0; j < uid.size(); j++) {
        String[] u = ((String) uid.get(j)).split(":");
    %>
    <div class="row">
        <%
        List newbook = MySql.recentBook();

        for (int i = 0; i < newbook.size(); i++) {
            if (counter == 4) { // break out of loop after four iterations
                break;
            }
            String[] nbook = ((String) newbook.get(i)).split(":");
            counter++; // increment counter after each iteration
        %>

        <div class="col-md-3">

            <div class="card crd-ho mt-3">

                <div class="card-body text-center">
                    <img alt="" src="book/<%=nbook[6]%>"
                        style="width: 150px; height: 200px" class="img-thumblin">
                    <p><%=nbook[1]%></p>
                    <p><%=nbook[2]%></p>
                    <p>
                        Categories:
                        <%=nbook[4]%></p>
                    <div class="row">

                        <%
                        if (request.getSession().getAttribute("loggedIn") != null
                                && (boolean) request.getSession().getAttribute("loggedIn") == true
                                && request.getSession().getAttribute("userId") != null) {
                            long userId = 0;
                            try {
                                userId = Long.parseLong(request.getSession().getAttribute("userId").toString());
                            } catch (NumberFormatException ex) {
                                // handle the exception
                            }
                        %>
                        <a href="cartServlet?bid=<%=nbook[0]%>&id=<%=u[0]%>&book_name=<%=nbook[1] %>&author=<%=nbook[2]%>&price=<%=nbook[3] %>&total_price=<%=nbook[3] %>"
                            class="btn btn-danger btn-sm ml-2"> <i
                            class="fa fa-thin fa-cart-plus"></i>Add Cart
                        </a>
                        <%
                        }
                        else {
                        %>
                        <a href="login.jsp" class="btn btn-danger btn-sm ml-2"> <i
                            class="fa fa-thin fa-cart-plus"></i>Add Cart
                        </a>
                        <%
                        }
                        %>



                        <a href="viewbooks.jsp?book_id=<%=nbook[0]%>"
                            class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
                            class="btn btn-danger btn-sm ml-1"><%=nbook[3]%><i
                            class="fa-solid fa-indian-rupee-sign fa-2xs"></i></a>
                    </div>
                </div>
            </div>

        </div>

        <%
        }
        %>

    </div>

    
    <%
    }
    %>
    <div class="text-center mt-1">
        <a href="allrecentbook.jsp" class="btn btn-danger btn-sm">View All</a>
    </div>
</div>

	<!-- end Recent Book -->
	<hr>


	<div class="container">
    <h3 class="text-center">New Book</h3>
    <%
    List uid1 = MySql.userId();
    int counter1 = 0; // initialize counter variable
    for (int j = 0; j < uid1.size(); j++) {
        String[] u = ((String) uid1.get(j)).split(":");
    %>
    <div class="row">
        <%
        List newbook = MySql.newBook();

        for (int i = 0; i < newbook.size(); i++) {
            if (counter1 == 4) { // break out of loop after four iterations
                break;
            }
            String[] nbook = ((String) newbook.get(i)).split(":");
            counter1++; // increment counter after each iteration
        %>

        <div class="col-md-3">

            <div class="card crd-ho mt-3">

                <div class="card-body text-center">
                    <img alt="" src="book/<%=nbook[6]%>"
                        style="width: 150px; height: 200px" class="img-thumblin">
                    <p><%=nbook[1]%></p>
                    <p><%=nbook[2]%></p>
                    <p>
                        Categories:
                        <%=nbook[4]%></p>
                    <div class="row">

                        <%
                        if (request.getSession().getAttribute("loggedIn") != null
                                && (boolean) request.getSession().getAttribute("loggedIn") == true
                                && request.getSession().getAttribute("userId") != null) {
                            long userId = 0;
                            try {
                                userId = Long.parseLong(request.getSession().getAttribute("userId").toString());
                            } catch (NumberFormatException ex) {
                                // handle the exception
                            }
                        %>
                        <a href="cartServlet?bid=<%=nbook[0]%>&id=<%=u[0]%>&book_name=<%=nbook[1] %>&author=<%=nbook[2]%>&price=<%=nbook[3] %>&total_price=<%=nbook[3] %>"
                            class="btn btn-danger btn-sm ml-2"> <i
                            class="fa fa-thin fa-cart-plus"></i>Add Cart
                        </a>
                        <%
                        }
                        else {
                        %>
                        <a href="login.jsp" class="btn btn-danger btn-sm ml-2"> <i
                            class="fa fa-thin fa-cart-plus"></i>Add Cart
                        </a>
                        <%
                        }
                        %>



                        <a href="viewbooks.jsp?book_id=<%=nbook[0]%>"
                            class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
                            class="btn btn-danger btn-sm ml-1"><%=nbook[3]%><i
                            class="fa-solid fa-indian-rupee-sign fa-2xs"></i></a>
                    </div>
                </div>
            </div>

        </div>

        <%
        }
        %>

    </div>

    
    <%
    }
    %>
    <div class="text-center mt-1">
        <a href="allnewbook.jsp" class="btn btn-danger btn-sm">View All</a>
    </div>
</div>




	<!-- end new Book -->
	<hr>
	<!-- Start old Book -->
	<div class="container">
		<h3 class="text-center">Old Book</h3>
		<div class="row">
			<%
			List oldbook = MySql.oldBook();

			int counterss = 0; // initialize counter variable
			for (int i = 0; i < oldbook.size(); i++) {
				if (counterss == 4) { // break out of loop after four iterations
					break;
				}
				String[] obook = ((String) oldbook.get(i)).split(":");
				counterss++; // increment counter after each iteration
			%>
			<div class="col-md-3">
				<div class="card crd-ho mt-3">
					<div class="card-body text-center">
						<img alt="" src="book/<%=obook[6]%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=obook[1]%></p>
						<p><%=obook[2]%></p>
						<p>
							Categories:<%=obook[4]%></p>
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
		<div class="text-center mt-1">
			<a href="alloldbook.jsp" class="btn btn-danger btn-sm">View All</a>
		</div>
	</div>

	<!-- end old Book -->
	<%@include file="all_component/footer.jsp"%>

</body>
</html>