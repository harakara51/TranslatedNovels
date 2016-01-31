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
					<li><a href="masterList.jsp">Master List</a></li>

				</ul>
			</div>
		</nav>
	</div>
	
	<c:choose>
		<c:when test="${! empty NovelsByLanguage}">
			<div class="row" id="row1">
				<div class="col s6 m6" id="result1">
					<div class="card orange accent-2" id="card-table1">
						<div class="card-content Black-text">
							<table id="table1">
								<thead>
									<tr>
										<th data-field="id">Novel Name</th>
										<th data-field="name">Author</th>
										<th data-field="name">Genre</th>
										<th data-field="name">Rating</th>
										<th data-field="name">Add to Reading list</th>
									</tr>
								</thead>
								<c:forEach var="temp" items="${NovelsByLanguage}">
									<tbody>
										<tr>
											<td><a href="${temp.link}">${temp.novelName}</a></td>
											<td>${temp.author}</td>
											<td>${temp.genre}</td>
											<td>${temp.rating }</td>
										
											<td rowspan ="1"> 
											<form id ="readmore" action="GetNovel.do" method="GET">
											<button class="btn-floating btn-large waves-effect waves-light red" value="${temp.novelName}"
								type="submit" name ="addtoReadingList" id ="addtoRL">
								+ <i class="material-icons right">send</i>
											
											<%-- <a  type ="submit" class="btn-floating btn-large waves-effect waves-light red" name ="addtoReadingList" value = "${temp.novelName}">
											<i class="material-icons">add</i></a> --%>
											</form>
											</td>
											
										</tr>
										<tr id ="readMore"> 
										<td colspan="3"> 
										<form id ="readmore" action="GetNovel.do" name ="readmore"  value="${temp.novelName}" method="GET">
										<button class="btn waves-effect waves-light blue darken-2" value="${temp.novelName}"
								type="submit" name ="ReadMORE" id ="languageButton">
								Read More <i class="material-icons right">send</i>
										<%-- 	    <button class="btn waves-effect waves-light blue darken-2" value="${temp.novelName}"
											type="submit" id ="ReadMOREButton">
								 --%>
								 </button>
								</form>
											</td>
									
									<td colspan="2"> 
										<form id ="readmore" action="GetNovel.do"   value="${temp.novelName}" method="GET">
										<button class="btn waves-effect waves-light red" value="${temp.novelName}"
								type="submit" name ="deleteNovel" id ="languageButton">
								<i class="material-icons right">delete</i>
										<%-- 	    <button class="btn waves-effect waves-light blue darken-2" value="${temp.novelName}"
											type="submit" id ="ReadMOREButton">
								 --%>
								 </button>
								</form>
											</td>
									
										</tr> 
									</tbody>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
				
				
		
	<div class="col s6 m6" id="result2">
		<div class="card orange accent-2" id="card-table5">
			<table class="bordered" id="table1">

				<thead>
					<th data-field="id" colspan="3">My reading list</th>

				</thead>

				<c:forEach var="temp" items="${readingList}">
					<tbody>
						<tr>
							<td><a href="${temp.link}">${temp.novelName}</a></td>
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
value =	"${temp.novelName}" type="submit btn-small" name="removeFromMasterList">
									 <i class="material-icons right">delete</i>

									</button>
								</form>
							</td>
					</tbody>
				</c:forEach>

				
				</table>
	
	</div>
	</div>
	<!-- 		End of reading list logic	
		end of Language logic -->		
				
				
			</div>
		</c:when>
	</c:choose>
<!-- 
Start of Novels By Genre -->	
	
	<c:choose>

		<c:when test="${! empty NovelsByGenre}">
			<div class="row" id="row1">
				<div class="col s12 m6" id="result1">
					<div class="card orange accent-2" id="card-table1">
						<div class="card-content Black-text">
							<table class="bordered" id="table1">

								<thead>
									<th data-field="id">Novel Name</th>
									<th data-field="name">Author</th>
									<th data-field="name">Genre</th>
									<th data-field="name">Rating</th>
								</thead>

								<c:forEach var="temp" items="${NovelsByGenre}">
									<tbody>
										<tr>
											<td><a href="${temp.link}">${temp.novelName}</a></td>
											<td>${temp.author}</td>
											<td>${temp.genre}</td>
											<td>${temp.rating }</td>
											<!-- 
							adding buttons to each row -->				
											<td rowspan ="1"> 
											<form id ="readmore" action="GetNovel.do" method="GET">
											<button class="btn-floating btn-large waves-effect waves-light red" value="${temp.novelName}"
								type="submit" name ="addtoReadingList" id ="addtoRL">
								+ <i class="material-icons right">send</i>
											
											<%-- <a  type ="submit" class="btn-floating btn-large waves-effect waves-light red" name ="addtoReadingList" value = "${temp.novelName}">
											<i class="material-icons">add</i></a> --%>
											</form>
											</td>
											
										</tr>
										<tr id ="readMore"> 
										<td colspan="3"> 
										<form id ="readmore" action="GetNovel.do" name ="readmore"  value="${temp.novelName}" method="GET">
										<button class="btn waves-effect waves-light blue darken-2" value="${temp.novelName}"
								type="submit" name ="ReadMORE" id ="languageButton">
								Read More <i class="material-icons right">send</i>
										<%-- 	    <button class="btn waves-effect waves-light blue darken-2" value="${temp.novelName}"
											type="submit" id ="ReadMOREButton">
								 --%>
								 </button>
								</form>
											</td>
									
									<td colspan="2"> 
										<form id ="readmore" action="GetNovel.do"   value="${temp.novelName}" method="GET">
										<button class="btn waves-effect waves-light red" value="${temp.novelName}"
								type="submit" name ="deleteNovel" id ="languageButton">
								<i class="material-icons right">delete</i>
										<%-- 	    <button class="btn waves-effect waves-light blue darken-2" value="${temp.novelName}"
											type="submit" id ="ReadMOREButton">
								 --%>
								 </button>
								</form>
											</td>
									
											
										</tr>
									</tbody>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
				<!-- 
				Starting reading List logic -->
						
	<div class="col s6 m6" id="result2">
		<div class="card orange accent-2" id="card-table5">
			<table class="bordered" id="table1">

				<thead>
					<th data-field="id" colspan="3">My reading list</th>

				</thead>

				<c:forEach var="temp" items="${readingList}">
					<tbody>
						<tr>
							<td><a href="${temp.link}">${temp.novelName}</a></td>
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
value =	"${temp.novelName}" type="submit btn-small" name="removeFromMasterList">
									 <i class="material-icons right">delete</i>

									</button>
								</form>
							</td>
					</tbody>
				</c:forEach>

				
				</table>
	
	</div>
	</div>
				<!-- 
				
		end of readlist logic -->		
				
			</div>
	</c:when>
	</c:choose>
	
	<!-- 
Start of filer by rating
 -->
	<c:choose>
		<c:when test="${! empty NovelsByRating}">
			<div class="row" id="row1">
				<div class="col s12 m6" id="result1">
					<div class="card orange accent-2" id="card-table1">
						<div class="card-content Black-text">
							<table class="bordered" id="table1">

								<thead>
									<th data-field="id">Novel Name</th>
									<th data-field="name">Author</th>
									<th data-field="name">Genre</th>
									<th data-field="name">Rating</th>
								</thead>

								<c:forEach var="temp" items="${NovelsByRating}">
									<tbody>
										<tr>
											<td><a href="${temp.link}">${temp.novelName}</a></td>
											<td>${temp.author}</td>
											<td>${temp.genre}</td>
											<td>${temp.rating }</td>
									<!-- 
				addig button to each row -->					
											
											<td rowspan ="1"> 
											<form id ="readmore" action="GetNovel.do" method="GET">
											<button class="btn-floating btn-large waves-effect waves-light red" value="${temp.novelName}"
								type="submit" name ="addtoReadingList" id ="addtoRL">
								+ <i class="material-icons right">send</i>
											
											<%-- <a  type ="submit" class="btn-floating btn-large waves-effect waves-light red" name ="addtoReadingList" value = "${temp.novelName}">
											<i class="material-icons">add</i></a> --%>
											</form>
											</td>
											
										</tr>
										<tr id ="readMore"> 
										<td colspan="3"> 
										<form id ="readmore" action="GetNovel.do" name ="readmore"  value="${temp.novelName}" method="GET">
										<button class="btn waves-effect waves-light blue darken-2" value="${temp.novelName}"
								type="submit" name ="ReadMORE" id ="languageButton">
								Read More <i class="material-icons right">send</i>
										<%-- 	    <button class="btn waves-effect waves-light blue darken-2" value="${temp.novelName}"
											type="submit" id ="ReadMOREButton">
								 --%>
								 </button>
								</form>
											</td>
									
									<td colspan="2"> 
										<form id ="readmore" action="GetNovel.do"   value="${temp.novelName}" method="GET">
										<button class="btn waves-effect waves-light red" value="${temp.novelName}"
								type="submit" name ="deleteNovel" id ="languageButton">
								<i class="material-icons right">delete</i>
										<%-- 	    <button class="btn waves-effect waves-light blue darken-2" value="${temp.novelName}"
											type="submit" id ="ReadMOREButton">
								 --%>
								 </button>
								</form>
											</td>
									
										</tr>
									</tbody>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
				<!-- 
				starting of readlist list cart logic -->
						
	<div class="col s6 m6" id="result2">
		<div class="card orange accent-2" id="card-table5">
			<table class="bordered" id="table1">

				<thead>
					<th data-field="id" colspan="3">My reading list</th>

				</thead>

				<c:forEach var="temp" items="${readingList}">
					<tbody>
						<tr>
							<td><a href="${temp.link}">${temp.novelName}</a></td>
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
value =	"${temp.novelName}" type="submit btn-small" name="removeFromMasterList">
									 <i class="material-icons right">delete</i>

									</button>
								</form>
							</td>
					</tbody>
				</c:forEach>

				
				</table>
	
	</div>
	</div>
	<!-- 
	end of reading list logic -->			
			</div>

		</c:when>
	</c:choose>
	<c:choose>
		<c:when test="${! empty RandomNovel}">

			<div class="row" id="row1">
				<div class="col s12 m6" id="result1">
					<div class="card orange accent-2" id="card-table1">
						<div class="card-content Black-text">
							<table class="bordered" id="table1">
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
											
											
											<td rowspan ="1"> 
											<form id ="readmore" action="GetNovel.do" method="GET">
											<button class="btn-floating btn-large waves-effect waves-light red" value="${temp.novelName}"
								type="submit" name ="addtoReadingList" id ="addtoRL">
								+ <i class="material-icons right">send</i>
											
											<%-- <a  type ="submit" class="btn-floating btn-large waves-effect waves-light red" name ="addtoReadingList" value = "${temp.novelName}">
											<i class="material-icons">add</i></a> --%>
											</form>
											</td>
											
										</tr>
										<tr id ="readMore"> 
										<td colspan="3"> 
										<form id ="readmore" action="GetNovel.do" name ="readmore"  value="${temp.novelName}" method="GET">
										<button class="btn waves-effect waves-light blue darken-2" value="${temp.novelName}"
								type="submit" name ="ReadMORE" id ="languageButton">
								Read More <i class="material-icons right">send</i>
										<%-- 	    <button class="btn waves-effect waves-light blue darken-2" value="${temp.novelName}"
											type="submit" id ="ReadMOREButton">
								 --%>
								 </button>
								</form>
											</td>
									
									<td colspan="2"> 
										<form id ="readmore" action="GetNovel.do"   value="${temp.novelName}" method="GET">
										<button class="btn waves-effect waves-light red" value="${temp.novelName}"
								type="submit" name ="deleteNovel" id ="languageButton">
								<i class="material-icons right">delete</i>
										<%-- 	    <button class="btn waves-effect waves-light blue darken-2" value="${temp.novelName}"
											type="submit" id ="ReadMOREButton">
								 --%>
								 </button>
								</form>
											</td>
									
											
										</tr>
									</tbody>
								</table>
								</div>
								</div>
								</div>
								<!-- 
								Starts reading list cart logic -->
								
		<div class="col s6 m6" id="result2">
		<div class="card orange accent-2" id="card-table5">
			<table class="bordered" id="table1">

				<thead>
					<th data-field="id" colspan="3">My reading list</th>

				</thead>

				<c:forEach var="temp" items="${readingList}">
					<tbody>
						<tr>
							<td><a href="${temp.link}">${temp.novelName}</a></td>
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
value =	"${temp.novelName}" type="submit btn-small" name="removeFromMasterList">
									 <i class="material-icons right">delete</i>

									</button>
								</form>
							</td>
					</tbody>
				</c:forEach>

				
				</table>
	
	</div>
	</div>							
								
								
								
								
								<!-- 
		end of reading list cart logic -->						
								</div>
								</c:when>
								</c:choose>
</body>
</html>