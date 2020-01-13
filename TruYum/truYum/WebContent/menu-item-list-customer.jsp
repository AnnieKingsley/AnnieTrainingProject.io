<%@ page language="java" isELIgnored="false"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Menu-item-list-customer</title>
<link rel="stylesheet" type="text/css" href="styles/style.css">
</head>
<body>
	<div class="topnav">
		<div class="home">truYum</div>
		<img src="images/truyum-logo-light.png"> <a href="ShowCart">Cart</a>
		<a href="http://localhost:8082/truYum/ShowMenuItemListCustomer">Menu</a>
	</div>
	<div class="page-title">
		<h1>Menu Item</h1>
	</div>
	<c:if test="${addCartStatus}">
		<h4 id="head1">Item added to cart successfully</h4>
	</c:if>

	<table class="body-content-color">


		<tr style="width: 60%">
			<th id="c1">Name</th>
			<th>Free Delivery</th>
			<th>Price</th>
			<th>Action</th>
		</tr>

		<c:forEach items="${menuItemList}" var="menuItem">
			<tr>
				<td id="c1">${menuItem.name}</td>
				<td><c:if test="${menuItem.freeDelivery}">Yes</c:if> <c:if
						test="${!menuItem.freeDelivery}">No</c:if></td>
				<fmt:setLocale value="en_IN" />
				<td><fmt:formatNumber type="currency" value='${menuItem.price}' /></td>
				<td><a href="AddToCart?id=${menuItem.id}">Add to Cart</a></td>
			</tr>
		</c:forEach>

	</table>

	<div class="footer">
		<h3>Copyright © 2019</h3>

	</div>
</body>
</html>