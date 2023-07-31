<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EBook: Edit Address</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #d8d9d0;">
	<%@include file="all_component/usernavbar.jsp"%>
	<div class="container mt-3">
  <div class="row justify-content-center">
    <div class="col-md-6">
      <div class="card">
        <div class="card-body">
          <h5 class="text-center text-primary p-1">Edit Address</h5>

          <form action="">
            <div class="row mb-3">
              <div class="col-md-6">
                <label for="addressInput" class="form-label">Address</label>
                <input type="text" class="form-control" id="addressInput">
              </div>
              <div class="col-md-6">
                <label for="landmarkInput" class="form-label">Landmark</label>
                <input type="text" class="form-control" id="landmarkInput">
              </div>
            </div>

            <div class="row mb-3">
              <div class="col-md-4">
                <label for="cityInput" class="form-label">City</label>
                <input type="text" class="form-control" id="cityInput">
              </div>
              <div class="col-md-4">
                <label for="stateInput" class="form-label">State</label>
                <input type="text" class="form-control" id="stateInput">
              </div>
              <div class="col-md-4">
                <label for="pinInput" class="form-label">Pin</label>
                <input type="text" class="form-control" id="pinInput">
              </div>
            </div>
				<div class="text-center">
				<button class="btn btn-warning text-white">Add Address</button>
				</div>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>

</body>
</html>