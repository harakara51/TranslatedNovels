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
					<li><a href="results3.jsp">Reading list</a></li>
					<li><a href="About.html">About us</a></li>

				</ul>
			</div>
		</nav>
	</div>
	<c:choose>
		<c:when test="${! empty Novel}">
			<div class="row" id="row1">
			<div class="col s12 blue lighten-3" id="result3">
			</div>
			
				<div class="col s12 blue lighten-3" id="result3">
					
							<table class="bordered" id="table3">
								<thead>
									<tr>
										<th data-field="id">Novel Name</th>
										<th data-field="name">Author</th>
										<th data-field="name">Translated by</th>
										<th data-field="name">Chapter Translated</th>
										<th data-field="name">Translation Status</th>
										<th data-field="name">Language</th>
										<th data-field="name">Genre</th>
										<th data-field="name">Tags</th>
										<th data-field="name">Rating</th>
										
									</tr>
								</thead>
								
									<tbody>
										<tr>
											<td placehoder value = "${Novel.novelName}"></td>
											<td>${Novel.author}</td>
											<td>${Novel.translator}</td>
											<td>${Novel.translationProgress}</td>
											<td>${Novel.translationStatus}</td>
											<td>${Novel.language}</td>
											<td>${Novel.genre}</td>
											<td>${Novel.sypnosis}</td>
											
											<td>${Novel.rating }</td>
									</tr>
									<tr>
									<td colspan = "2"> <h5 >Sypnosis: </h5> </td>
									<td colspan ="7">${Novel.tags}</td>
									
									</tr>	
									<tr>
									<td colspan ="5">Edit </td>
									<td colspan ="3">Rate</td>
									
									</tr>	
									</tbody>
						
							</table>
						</div>
				
			</div>
		</c:when>
	</c:choose>