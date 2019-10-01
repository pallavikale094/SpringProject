<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EmpTable</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
</head>
<body>
<!-- Navbar Start -->
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <!-- <a class="navbar-brand" href="#">Brand</a> -->
        <a class="navbar-brand"href="?language=en">English</a><a class="navbar-brand"href="?language=hn">HINDI</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="employeeForm">Employee Info Form <span class="sr-only">(current)</span></a></li>
        <li><a href="viewemp">View Employee Data</a></li>
        <li><a href="viewEmpDataTable">View Employee Data Table</a></li>
        <li><a href="uploadform">File Upload</a></li>
      	<li><a href="displayFile">Display File</a></li>
      </ul>
    
    
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
<!-- Navbar End -->


<h3><spring:message code="lbl.table" /></h3>
<table border="2" width="70%" cellpadding="2">
<tr>
				<th><spring:message code="lbl.Id" /></th>
				<th><spring:message code="lbl.name" /></th>
				<th><spring:message code="lbl.dob" /></th>
				<th><spring:message code="lbl.email" /></th>
				<th><spring:message code="lbl.profile" /></th>
				<th><spring:message code="lbl.technology" /></th>
				<th><spring:message code="lbl.gender" /></th>
				<th>EDIT</th>
				<th>Delete</th>
				
			</tr>
<c:forEach var="e" items="${list}">
<tr>
<td>${e.id}</td>
<td>${e.name}</td>
<td>${e.dob}</td>
<td>${e.email}</td>
<td>${e.job_profile}</td>
<td><c:forEach var="s" items="${e.technology}">
	<c:if test="${s != ''}">
	<li>${s}</li>
		</c:if>

	</c:forEach>
<td>${e.gender}</td>

<td><a href="empedit/${e.id}">Edit</a></td>
<td><a href="deletemp/${e.id}">Delete</a></td>
</tr>
</c:forEach>

</table>
<a href="employeeForm">Add New Employee</a>

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</body>
</html>