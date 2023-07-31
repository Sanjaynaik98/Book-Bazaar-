<%@page import="com.model.MySql"%>
<%@page import="java.util.List"%>
<div class="conteiner-fluid"
	style="height: 10px; background-color: #00897b;"></div>
<%
	int cn=0;
    List us= MySql.userId();
    for (int k = 0; k < us.size(); k++) {
    	if(cn==1){
    		break;
    	}
        String[] us1 = ((String) us.get(k)).split(":");
        cn++;
    %>
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
			<a href="cart.jsp?uid=<%=us1[0]%>" class="btn btn-danger"><i
					class="fa-sharp fa-solid fa-cart-shopping"></i></a>
					
			<a href="" class="btn btn-success"><i class="fa-solid fa-user"></i>
				User</a> <a data-toggle="modal" data-target="#exampleModalLong"
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
				href="allrecentbook.jsp"><i class="fa-solid fa-book"></i> Recent
					Book</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="allnewbook.jsp"><i class="fa-solid fa-book"></i> New Book</a></li>
			<li class="nav-item active"><a class="nav-link disabled"
				href="alloldbook.jsp"><i class="fa-solid fa-book"></i> Old Book</a>
			</li>
		</ul>
		<form class="form-inline my-2 my-lg-0">
			<a href="setting.jsp" class="btn btn-light my-2 my-sm-0 " type="submit">
				<i class="fa fa-thin fa-gears"></i> Setting
			</a>
			<button class="btn btn-light my-2 my-sm-0 ml-1" type="submit">
				<i class="fa-solid fa-headset"></i> Contact us
			</button>
		</form>
	</div>
</nav>
<%} %>