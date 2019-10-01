
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page session="false"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Display File</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu"
	crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css"
	integrity="sha384-6pzBo3FDv/PJ8r2KRkGHifhEocL+1X2rVCTTkUfGk7/0pbek5mMa1upzvWbrUbOZ"
	crossorigin="anonymous">
<style type="text/css">
.error {
	color: red;
}
</style>
</head>
<body>
		<!-- Navbar Start -->
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<!--  <a class="navbar-brand" href="#">Brand</a>-->
				<a class="navbar-brand" href="?language=en">English</a><a
					class="navbar-brand" href="?language=hn">HINDI</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="active"><a href="employeeForm">Employee Info
							Form <span class="sr-only">(current)</span>
					</a></li>
					<li><a href="viewemp">View Employee Data</a></li>
					<li><a href="viewEmpDataTable">View Employee Data Table</a></li>
					<li><a href="uploadform">File Upload</a></li>
					<li><a href="displayFile">Display File</a></li>

				</ul>


			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	<!-- Navbar End -->
	
	<table>
		<tr>
			<th>File Name</th>
			<th>File Preview</th>
			<th>Download</th>
		</tr>
		<c:forEach var="fileName" items="${fileList}">
			<tr>
				<td>${fileName}</td>
				<td><img 
					src="<spring:url value='/upload_images/${fileName}'/>" height="100"
					width="100"></td>
				<td><a href='downloadFile/${fileName}'>Click Here</a></td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>

