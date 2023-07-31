<%@page import="java.util.List"%>
<%@page import="com.model.MySql"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart-Page</title>
<%@ include file="all_component/allCss.jsp"%>
</head>
<body>
	<div class="conteiner-fluid"
		style="height: 10px; background-color: #00897b;"></div>

	<div class="container-fluid p-3 bg-light">
		<div class="row">
			<div class="col-md-3 text-danger">
				<h3>
					<i class="fa-solid fa-book"></i> Ebooks
				</h3>
			</div>
			<div class="col-md-6">
				<form class="form-inline my-2 my-lg-0">
					<input class="form-control mr-sm-2" type="search"
						placeholder="Search" aria-label="Search">
					<button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
				</form>
			</div>
			<div class="col-md-3">
				<a href="cart.jsp" class="btn btn-danger"><i
					class="fa-sharp fa-solid fa-cart-shopping"></i></a> <a href=""
					class="btn btn-success"><i class="fa-solid fa-user"></i> User</a> <a
					data-toggle="modal" data-target="#exampleModalLong"
					class="btn btn-primary text-white"><i
					class="fa-solid fa-right-from-bracket"></i> Logout</a>
			</div>
		</div>
	</div>
	<div class="modal fade" id="exampleModalLong" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLongTitle"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle"></h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="text-center">
						<h4>Do You Want To Logout</h4>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<a href="login.jsp" type="button"
							class="btn btn-primary text-white">Logout</a>
					</div>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>
	<nav class="navbar navbar-expand-lg navbar-dark bg-custom"
		style="background-color: #00897b">
		<a class="navbar-brand" href="#"><i
			class="fa-solid fa-house-chimney"></i></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="home.jsp">Home
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="allrecentbook.jsp"><i class="fa-solid fa-book"></i>
						Recent Book</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="allnewbook.jsp"><i class="fa-solid fa-book"></i> New Book</a></li>
				<li class="nav-item active"><a class="nav-link disabled"
					href="alloldbook.jsp"><i class="fa-solid fa-book"></i> Old Book</a>
				</li>
			</ul>
			<form class="form-inline my-2 my-lg-0">
				<button class="btn btn-light my-2 my-sm-0 " type="submit">
					<i class="fa fa-thin fa-gears"></i> Setting
				</button>
				<button class="btn btn-light my-2 my-sm-0 ml-1" type="submit">
					<i class="fa-solid fa-headset"></i> Contact us
				</button>
			</form>
		</div>
	</nav>
	<div class="container">
		<div class="row p-2">
			<div class="col-md-6">

				<div class="card bg-white">
					<h3 class="text-center text-success">Your Selected Items</h3>
					<div class="card-body">

						<table class="table">
							<thead>
								<tr>
									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								String bookIdStr = request.getParameter("uid");
								if (bookIdStr != null) {
									int bid = Integer.parseInt(bookIdStr);
									List<String> books = MySql.bookCarts(bookIdStr);
									double totalPrice = 0;
									for (int l = 0; l < books.size(); l++) {
										String[] mc = books.get(l).split(":");
										totalPrice += Double.parseDouble(mc[5]);
								%>
								<tr>
									<th scope="row"><%=mc[3]%></th>
									<td><%=mc[4]%></td>
									<td><%=mc[5]%></td>
									<td><a href="CartDelete?bid=<%=mc[1]%>"
										class="btn btn-sm btn-danger">Remove</a></td>
								</tr>
								<%
								}
								%>
								<tr>
									<td>Total Price</td>
									<td></td>
									<td></td>
									<td><%=totalPrice%></td>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>

					</div>
				</div>
			</div>

			<div class="col-md-6">
				
				<div class="card">
					<div class="card-body">
						<h3 class="text-center text-success">Your Details for Order</h3>

						<form class="row g-3">
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Name</label> <input
									type="text" class="form-control" id="inputEmail4"
									>

							</div>
							<div class="col-md-6">
								<label for="inputPassword4" class="form-label">Email</label> <input
									type="email" class="form-control" id="inputPassword4"
									>

							</div>
							<div class="col-md-6">
								<label for="inputPassword4" class="form-label">Phone
									Number</label> <input type="number" class="form-control"
									id="inputPassword4">

							</div>
							<div class="col-md-6">
								<label for="inputPassword4" class="form-label">Address</label> <input
									type="text" class="form-control" id="inputPassword4">

							</div>
							<div class="col-md-6">
								<label for="inputPassword4" class="form-label">Landmark</label>
								<input type="text" class="form-control" id="inputPassword4">

							</div>
							<div class="col-md-6">
								<label for="inputPassword4" class="form-label">City</label> <input
									type="text" class="form-control" id="inputPassword4">

							</div>
							<div class="col-md-6">
								<label for="inputPassword4" class="form-label">State</label> <input
									type="text" class="form-control" id="inputPassword4">

							</div>
							<div class="col-md-6">
								<label for="inputPassword4" class="form-label">Pincode</label> <input
									type="text" class="form-control" id="inputPassword4">

							</div>
							<div class="col-md-6">
								<label for="inputPassword4" class="form-label">Payment
									Mode</label> <select class="form-control" style="width: 490px;">
									<option>--select--</option>
									<option>Cash On Delivery</option>
								</select>
							</div>


							<div style="margin: 2rem auto 0; width: fit-content;">
								<button class="btn btn-warning">Order Now</button>
								<a href="home.jsp" class="btn btn-success">Continue Shopping</a>
							</div>



						</form>
						

					</div>

				</div>
				
			</div>
		

		</div>
	</div>

	<%@include file="all_component/footer.jsp"%>
</body>
</html>