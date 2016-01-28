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
				<li class="active"><a href="collapsible.html">Home</a></li>
				<li><a href="About.html">About us</a></li>

			</ul>
		</div>
		</nav>
	</div>
	<c:choose>
		<c:when test="${! empty NovelsByLanguage}">
			<table>
				<thead>
					<tr>
						<th>Novel Name</th>
						<th>Author</th>
						<th>Genre</th>
						<th>Rating</th>
					</tr>
				</thead>

				<c:forEach var="temp" items="${NovelsByLanguage}">

					<tbody>
						<tr>
							<td><a href="${temp.link}">${temp.novelName}</a></td>

							<td>${temp.author}</td>
							<td>${temp.genre}</td>
							<td>${temp.rating }</td>
						</tr>
					</tbody>
				</c:forEach>
				</div>
				</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${! empty NovelsByGenre}">
						<table>
							<thead>
								<tr>
									<th>Novel Name</th>
									<th>Author</th>
									<th>Genre</th>
									<th>Rating</th>
								</tr>
							</thead>

							<c:forEach var="temp" items="${NovelsByGenre}">
								<tbody>
									<tr>
										<td><a href="${temp.link}">${temp.novelName}</a></td>
										<td>${temp.author}</td>
										<td>${temp.genre}</td>
										<td>${temp.rating }</td>
									</tr>
								</tbody>
							</c:forEach>
							</div>
							</c:when>
							</c:choose>


							<c:choose>
								<c:when test="${! empty NovelsByRating}">
									<table>
										<thead>
											<tr>
												<th>Novel Name</th>
												<th>Author</th>
												<th>Genre</th>
												<th>Rating</th>
											</tr>
										</thead>

										<c:forEach var="temp" items="${NovelsByRating}">
											<tbody>
												<tr>
													<td><a href="${temp.link}">${temp.novelName}</a></td>
													<td>${temp.author}</td>
													<td>${temp.genre}</td>
													<td>${temp.rating }</td>
												</tr>
											</tbody>
										</c:forEach>
										</div>
										</c:when>
										</c:choose>
										<c:choose>
											<c:when test="${! empty RandomNovel}">
												<table>
													<thead>
														<tr>
															<th>Novel Name</th>
															<th>Author</th>
															<th>Genre</th>
															<th>Rating</th>
														</tr>
													</thead>

														<tbody>
															<tr>
																<td><a href="${temp.link}">${RandomNovel.novelName}</a></td>
																<td>${RandomNovel.author}</td>
																<td>${RandomNovel.genre}</td>
																<td>${RandomNovel.rating }</td>
															</tr>
														</tbody>
												
													</div>
													</c:when>
													</c:choose>
</body>
</html>