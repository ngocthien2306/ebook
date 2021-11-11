<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="error.jsp" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<!-- Global -->
<c:import url="sharedView/global.html"/>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/login.css">
</head>
<body>
	<div class="container d-flex justify-content-center align-content-center">
		<form action="login" class="" method="POST">
			<h2 class="">Please login</h2>
			<input type="hidden" name="action" value="LOGIN">  
			<div class="mb-3">
				<label for="usernameInput" class="form-label">Username</label> <input
					id="usernameInput" type="text" class="form-control" name="username">
			</div>
			<div class="mb-3">
				<label for="passwordInput" class="form-label">Password</label> <input
					id="passwordInput" type="password" class="form-control"
					name="password">
			</div>
			<div class="mb-3 form-check">
				<input type="checkbox" class="form-check-input" id="remeberMe">
				<label class="form-check-label" for="remeberMe">Remember me</label>
				<a class="signinLink" href="">signin </a>
			</div>
			<span style="color: red"><c:out value="${loginMessage}" /></span>
			<button type="submit" class="btn btn-primary">Login</button>
		</form>
	</div>
</body>
</html>