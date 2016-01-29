<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no" />
<title>Translated Novels</title>

<!-- CSS  -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link href="css/materialize.css" type="text/css" rel="stylesheet"
	media="screen,projection" />
<link href="css/style.css" type="text/css" rel="stylesheet"
	media="screen,projection" />
<link href="css/animate.css" type="text/css" rel="stylesheet" />
</head>
<body>
	<div class="navbar-fixed">
		<nav>
			<div class="nav-wrapper green darken-3">
				<a href="#!" class="brand-logo">Transalated Novels</a>
				<ul class="right hide-on-med-and-down">
					<li><a href="index.jsp">Home</a></li>
					<li><a href="addNovel.jsp">Add a Novel</a></li>
					<li><a href="About.html">About us</a></li>
					<li class="active"><a href="results3.jsp">Reading list</a></li>

				</ul>
			</div>
		</nav>
	</div>


				<div class="col s4 m2" id="result1.5">
					<div class="card blue lighten-3" id="card-table1">
					<table class="bordered" id="table1">

								<thead>
									<th data-field="id">Novel Name</th>
									
								</thead>

								<c:forEach var="temp" items="${readingList}">
									<tbody>
										<tr>
											<td><a href="${temp.link}">${temp.novelName}</a></td>
											
										</tr>
									</tbody>
								</c:forEach>
					
				</div>
				<div>






</body>
</html>