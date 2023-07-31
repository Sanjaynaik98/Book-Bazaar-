<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ include file="all_component/allCss.jsp"%>
<style type="text/css">
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
}
</style>
</head>
<body style="background-color: #d8d9d0;">
	<%@include file="all_component/usernavbar.jsp"%>
	<div class="container">
		<h3 class="text-center">Hello Sanjay</h3>
		<div class="row p-5">
			<div class="col-md-6">
				<a href="sell.jsp">
					<div class="card ">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fa-solid fa-book fa-3x"></i>
							</div>
							<h3>Sell Old Book</h3>
						</div>
					</div>
				</a>

			</div>
			<div class="col-md-6">
				<a href="editprofile.jsp">
					<div class="card ">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fa-solid fa-pen-to-square fa-3x"></i>
							</div>
							<h3>Login & Security (Edit Profile)</h3>
						</div>
					</div>
				</a>

			</div>
			
			<div class="col-md-4 mt-3">
				<a href="useraddress.jsp">
					<div class="card ">
						<div class="card-body text-center">
							<div class="text-warning">
								<i class='fa-solid fa-location-dot fa-3x'></i> 
							</div>
							<h3>Your Address</h3>
							<p>Edit Address</p>
						</div>
					</div>
				</a>

			</div>
			<div class="col-md-4 mt-3">
				<a href="order.jsp">
					<div class="card ">
						<div class="card-body text-center">
							<div class="text-danger">
								<i class='fas fa-box-open fa-3x'></i>
							</div>
							<h3>My Order</h3>
							<p>Track your Order</p>
						</div>
					</div>
				</a>

			</div>
			<div class="col-md-4 mt-3">
				<a href="helpline.jsp">
					<div class="card ">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class='fas fa-user-circle fa-3x'></i>
							</div>
							<h3>Help Center</h3>
							<p>24*7 Service</p>
						</div>
					</div>
				</a>

			</div>
			
		</div>
	</div>
	<div style="position: fixed; bottom: 0; width: 100%;">
    <%@include file="all_component/footer.jsp"%>
</div>
	
</body>
</html>