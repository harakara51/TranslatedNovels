<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				<a href="#!" class="brand-logo">Translated Novels</a>
				<ul class="right hide-on-med-and-down">
					<li class="active"><a href="index.jsp">Home</a></li>
					<li><a href="addNovel.jsp">Add a Novel</a></li>
					<li><a href="results3.jsp">Reading list</a></li>
					<li><a href="masterList.jsp">Master List</a></li>
					 

				</ul>
			</div>
		</nav>
	</div>
	<div class="container">


		<div class="row" id ="row1">
			<div class="col s12" id ="box1">
				<div class="card orange accent-2">
					<div class="card-content Black-text">
						<span class="card-title">Choose by Language</span>
						<form action="GetNovel.do"  method="GET">
						<label>Choose language</label> 
						<select class="browser-default" name ="language" id ="selectLanguage">
								<option value="">Choose your option</option>
								<option value="Chinese">Chinese</option>
								<option value="Korean">Korean</option>
								<option value="Spanish">Spanish</option>
								<option value="Japanese">Japanese</option>
							</select>
						
							<button class="btn waves-effect waves-light blue darken-2" value="Get Novels"
								type="submit" id ="languageButton">
								Submit <i class="material-icons right">send</i>
							</button>
						</form>
					</div>
				</div>
			</div>

</div>
<div class="row" id ="row2">

			<div class="col s4" id ="box1">
				<div class="card  orange accent-2">
					<div class="card-content Black-text">
						<span class="card-title">Choose by Genre</span>
						<form action="GetNovel.do"  method="GET" id="language2">
							<label>Choose genre</label>
								<input type="text" name="genre" />
								<button class="btn waves-effect waves-light blue darken-2" value="Get Novels"
								type="submit" name="action" id ="languageButton">
								Submit <i class="material-icons right">send</i>
							</button>
						</form>
					</div>
				</div>
			</div>
		
			<div class="col s4" id ="box1">
				<div class="card orange accent-2">
					<div class="card-content Black-text">
						<span class="card-title">Choose by rating</span>
						<form action="GetNovel.do" method="GET" id="language">
							<label>Input Minimum Rating</label> 
							
			 <input type="text"	name="rating"/> 
							
							<button class="btn waves-effect waves-light blue darken-2" value="Get Novels"
								type="submit" name="action" id ="languageButton">
								Submit <i class="material-icons right">send</i>
							</button>
						</form>
					</div>
				</div>
			</div>
			<div class="col s4" id ="box1">
				<div class="card orange accent-2">
					<div class="card-content Black-text">
						<span class="card-title">Choose a random novel</span>
						<form action="GetNovel.do"  method="GET" id="language">
							<label>Click to get random novel</label>
								
								<button class="btn waves-effect waves-light blue darken-2" value="Get Novels"
								type="submit" name="random" id ="languageButton">
								Submit <i class="material-icons right">send</i>
							</button>
						</form>
					</div>
				</div>
			</div>
		</div>

</div>

	</div>
</body>
</html>