<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
		<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit-movies</title>
<link rel="stylesheet" type="text/css" href="style/style.css">
<script src="js/script.js"></script>
</head>
<body>
<div class="topnav">
		<div class="home">Movie Cruiser</div>
		<img src="images/movie-logo-png.png"> <a
			href="ShowMoviesListAdmin">Movies</a>
	</div>

	<h1>Edit Movies</h1>
	<div class="body-content-colour">
		<form action="EditMovies" onsubmit="return validateMoviesform()"
			name="editMovie" method="post">
			<div>
				<input type="hidden" name="id" value="${movies.id}">
			</div>
			<div class="form-field-spacing">
				<label for="title">Title</label> <input type="text"
					class="text-box text-box-title" name="title" id="title"
					value="${movies.title}">
			</div>
			<div>
				<div class="form-field-spacing">
					<label for="gross">Gross($)</label>
					<div>
						<input type="text" class="text-box" name="gross" id="gross"
							value="${movies.gross}">
					</div>
				</div>
				<div class="form-field-spacing">
					<label for="active">Active</label>
					<div>
						Yes <input class="radio" type="radio" name="active" value="yes"
							<c:if test="${movies.active eq 'true'}" >checked</c:if>>
						No <input class="radio" type="radio" name="active" value="no"
							<c:if test="${movies.active eq 'false'}" >checked</c:if>>
					</div>
				</div>
				<div class="form-field-spacing">
					<label for="dateOfLaunch">Date of Launch</label>
					<div>
						<input type="text" class="text-box" name="dateOfLaunch"
							value="<fmt:formatDate type='date' pattern='dd/MM/yyyy' value='${movies.dateOfLaunch}'/>">
					</div>
				</div>
				<div class="form-field-spacing">
					<label for="">Genre</label>
					<div>
						<select name="genre" class="dropdown">
							<option value="${movies.genre}">${movies.genre}</option>
							<option value="science fiction">Science Fiction</option>
							<option value="superhero">Super hero</option>
							<option value="romance">Romance</option>
							<option value="comedy">Comedy</option>
							<option value="adventure">Adventure</option>
							<option value="thriller">Thriller</option>
						</select>
					</div>
				</div>
			</div>
			<div class="form-field-spacing">
				<input type="checkbox" name="hasTeaser"
					<c:if test="${movies.hasTeaser eq 'true'}" >checked</c:if>>
				<label for="hasTeaser">Has Teaser</label>
			</div>

			<div>
				<input type="submit" class="button success-button" value="Save">
			</div>

		</form>
	</div>
	<div class="footer">
		<h3>Copyright � 2019</h3>
	</div>


</body>
</html>