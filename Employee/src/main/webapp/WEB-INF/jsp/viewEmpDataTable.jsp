<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"
	xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="utf-8" />
<title>Spring Boot + JPA + Datatables</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css">
<script
	src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
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


<!-- <a href="?language=en">English</a>|<a href="?language=hn">HINDI</a> -->
	<h3><spring:message code="lbl.table" /></h3>
	
	<table id="emptable" class="display">

		<!-- Header Table -->
		<thead>
			<tr>
				<th><spring:message code="lbl.Id" /></th>
				<th><spring:message code="lbl.name" /></th>
				<th><spring:message code="lbl.dob" /></th>
				<th><spring:message code="lbl.email" /></th>
				<th><spring:message code="lbl.profile" /></th>
				<th><spring:message code="lbl.technology" /></th>
				<th><spring:message code="lbl.gender" /></th>
				
			</tr>
		</thead>
		<!-- BODY -->
		
		
		<!-- Footer Table -->
		<tfoot>
			<tr>
				<th><spring:message code="lbl.Id" /></th>
				<th><spring:message code="lbl.name" /></th>
				<th><spring:message code="lbl.dob" /></th>
				<th><spring:message code="lbl.email" /></th>
				<th><spring:message code="lbl.profile" /></th>
				<th><spring:message code="lbl.technology" /></th>
				<th><spring:message code="lbl.gender" /></th>
			</tr>
		</tfoot>
	</table>
	<br/>
<strong><a href=employeeForm>Employee Info Form</a></strong>
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

</body>
</html>
<script type="text/javascript">
$(document).ready(function(){
	var data =eval('${emplist}');
	var table = $('#emptable').DataTable( {
		  "aaData": data,
		  "aoColumns": [
			    { "mData": "id"},
			    { "mData": "name"},
			    { "mData": "dob"},
			  	{ "mData": "email"},
			    { "mData": "job_profile"},
			    { "mData": "technology"},
			    { "mData": "gender"}
			    
		  ],
		  "paging":true
		});
});
</script>
