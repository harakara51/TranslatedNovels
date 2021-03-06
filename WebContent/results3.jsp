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
					<li><a href="masterList.jsp">Master List</a></li>
					<li class="active"><a href="results3.jsp">Reading list</a></li>

				</ul>
			</div>
		</nav>
	</div>


		<div class="card orange accent-2" id="card-table5">
		<table class="bordered" id="table1">

				<thead>
					<th data-field="id">My reading list</th>

				</thead>

				<c:forEach var="temp" items="${readingList}">
					<tbody>
						<tr>
							<td id = "tablerow1"><a href="${temp.link}">${temp.novelName}</a></td>
							<td>
								<form id="readmore" action="GetNovel.do" name="readmore"
									value="${temp.novelName}" method="GET">
									<button class="btn waves-effect waves-light blue darken-2"
										value="${temp.novelName}" type="submit" name="ReadMORE"
										id="languageButton">
										Read More <i class="material-icons right">send</i>
										<%-- 	    <button class="btn waves-effect waves-light blue darken-2" value="${temp.novelName}"
											type="submit" id ="ReadMOREButton">
								 --%>
									</button>
								</form>
							</td>
							<td>
								<form id="readmore" action="GetNovel.do" method="GET">
									<button class="btn waves-effect waves-light red value="
value =	"${temp.novelName}" type="submit" name="removeFromReadingList">
										Remove <i class="material-icons right">delete</i>

									</button>
								</form>
							</td>
							

					</tbody>
				</c:forEach>
											<tr>
							
								<form id="Email" action="GetNovel.do" method="GET">
	<td colspan="2">
  							E-mail:
  						<input type="email" name="email">
	</td>
	<td>
									<button class="btn waves-effect waves-light blue darken-2"
										value="${temp.novelName}" type="submit" name="Email"
										id="languageButton">
										Send Email <i class="material-icons right">send</i>
										<%-- 	    <button class="btn waves-effect waves-light blue darken-2" value="${temp.novelName}"
											type="submit" id ="ReadMOREButton">
								 --%>
									</button>
							</td>		
								</form>
							
							</tr>
						</table>	
					</div>
				<div>





</body>
</html>