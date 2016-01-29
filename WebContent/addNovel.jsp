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
				<a href="#!" class="brand-logo">Translated Novels</a>
				<ul class="right hide-on-med-and-down">
					<li><a href="index.jsp">Home</a></li>
					<li class="active"><a href="addNovel.jsp">Add a Novel</a></li>
					<li><a href="About.html">About us</a></li>

				</ul>
			</div>
		</nav>
	</div>

		<div class="card" id="card-table3">
			<div class="card-content Black-text">
    <form class="col s12" id ="addNovel" action="Novel.do" name ="addNovel" method="POST" >
      <div class="row">
        <div class="input-field col s4">
        
          <input  id="NovelName" type="text" name="novelName" class="validate">
          <label class="active" for="NovelName">Novel Name</label>
        </div>
        <div class="input-field col s4">
          <input id="Author" type="text" name ="author" class="validate">
          <label class="active" for="Author">Author</label>
        </div>
     
        <div class="input-field col s4">
          <input id="language" type="text" name ="language" class="validate">
          <label  class="active" for="Language">Original Language</label>
        </div>
      
      <div class="row">
        <div class="input-field col s12">
          <input id="link" type="text" name ="link" class="validate">
          <label class="active" for="link">link</label>
        </div>
      </div>
      <div class="row">
      <div class="input-field col s4">
          <input id="disabled" name = "Translator" type="text" class="validate">
          <label class="active" for="TranslatedBy">Translated By</label>
        </div>
        <div class="input-field col s4">
          <input id="disabled" name = "translationStatus" type="text" class="validate">
          <label class="active" for="TranslatedStatus">Translated status</label>
        </div>
        <div class="input-field col s4">
          <input id="genre" type="text" name = "genre" class="validate">
          <label class="active" for="genre">Genre</label>
        </div>
      </div>
       <div class="row">
       <div class="input-field col s4">
          <input id="rating" type="number" name ="rating" class="validate">
          <label class="active" for="rating">Your Rating</label>
        </div>
      <div class="input-field col s8">
          <input id="tags" type="text" name = "tags" class="validate">
          <label class="active" for="tags">Tags</label>
        </div>
       
      </div>
        <div class="row">
        <div class="input-field col s12">
          <textarea rows="10" cols="100"  name ="Sypnosis" id ="sypnosis">
   		  
          </textarea>
          <label class="active" for="sypnosis">Sypnosis</label>
        </div>
      </div>
      <button class="btn waves-effect waves-light blue darken-2" value="Get Novels"
								type="submit" name="submitNovel" id ="languageButton">
								Submit <i class="material-icons right">send</i>
    </form>
    </div>
    </div>
    </div>
  </div>	

</body>
</html>