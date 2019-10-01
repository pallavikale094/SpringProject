<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Employee Data</title>
<style type="text/css">
.error {
	color: red;
}
</style>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">
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
	<!-- <a href="?language=en">English</a>|<a href="?language=hn">HINDI</a> -->



	<h3>
		<spring:message code="lbl.pg1" />
	</h3>
	Current Locale : ${pageContext.response.locale}

	<form:form method="post" action="save" modelAttribute="employee">
		<table>
			<form>
				<div class="form-group">
					<div class="row">
						<div class="col">
							<div class="col-sm-4">
								<spring:message code="lbl.name" />
							</div>
							<div class="col-sm-4">
								<form:input path="name" />
								<form:errors path="name" cssClass="error" />
							</div>
						</div>
					</div>


					<div class="row">
						<div class="col">
							<div class="col-sm-4">
								<spring:message code="lbl.dob" />
							</div>
							<div class="col-sm-4">
								<form:input type="date" path="dob" />
								<form:errors path="dob" cssClass="error" />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col">
							<div class="col-sm-4">
								<spring:message code="lbl.email" />
							</div>
							<div class="col-sm-4">
								<form:input path="email" />
								<form:errors path="email" cssClass="error" />
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col">
							<div class="col-sm-4">
								<spring:message code="lbl.gender"/>
							</div>
							<div class="col-sm-4">
							Male<form:radiobutton path="gender" value="Male" /> 
							Female<form:radiobutton path="gender" value="Female" />
				 			<form:errors path="gender" cssClass="error" />
				 		</div>
						</div>
					</div>
					<div class="row">
						<div class="col">
							<div class="col-sm-4">
								<spring:message code="lbl.profile" />
							</div>
							<div class="col-sm-4">
								<form:select path="job_profile">
									<form:option value="Software Developer"
										label="Software Developer" />
									<form:option value="System Admin" label="System Admin" />
									<form:option value="Software Tester" label="Software Tester" />
									<form:option value="DBA" label="DBA" />
								</form:select>
								<form:errors path="job_profile" cssClass="error" />
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col">
							<div class="col-sm-4">
								<spring:message code="lbl.technology" />
							</div>
							<div class="col-sm-4">
								C
								<form:checkbox path="technology" value="C" />
								C++
								<form:checkbox path="technology" value="C++" />
								Java
								<form:checkbox path="technology" value="Java" />
								<form:errors path="technology" cssClass="error" />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col">
							<div class="col-sm-4"></div>
							<div class="col-sm-4">
								<input type="submit" value="Save" />
							</div>
						</div>
					</div>
				</div>

			</form>
		</table>
	</form:form>
	<!-- Latest compiled and minified JavaScript -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
		integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
		crossorigin="anonymous"></script>
</body>
</html>