<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Favorites</title>
<link rel="stylesheet" type="text/css" href="style/style.css">
</head>
<body>
	<div class="topnav">
		<div class="home">Movie Cruiser</div>
		<img src="images/movie-logo-png.png"> <a href="ShowFavorites">Favorites</a>
		<a href="ShowMoviesListCustomer">Movies</a>
	</div>
	<h1>Favorites</h1>
	<div class="page-title"></div>
	<c:if test="${deleteFavoritesStatus}">
		<div class="success-message">Movies removed from favorites
			successfully</div>
	</c:if>


	<table class="body-content-color">


		<tr style="width: 60%">
			<th id="left-align">Title</th>
			<th>Has Teaser</th>
			<th>Box Office</th>
			<th>Genre</th>
			<th>Action</th>
		</tr>

		<c:forEach items="${favorites.moviesList}" var="movies">
			<tr>
				<td id="c1">${movies.title}</td>
				<td><c:if test="${movies.hasTeaser}">Yes</c:if> <c:if
						test="${!movies.hasTeaser}">No</c:if> <fmt:setLocale value="en_US" />
				<td><fmt:formatNumber type="currency" value='${movies.gross}' /></td>
				<td>${movies.genre}</td>
				<td><a href="RemoveFavorites?id=${movies.id}">Delete</a></td>
			</tr>
		</c:forEach>
		<tr>
			<td></td>
			<td>No. of Favorites</td>
			<td>${favorites.total}</td>
			<td></td>
	</table>
	<div class="footer">
		<h3>Copyright � 2019</h3>
	</div>
</body>
</html>