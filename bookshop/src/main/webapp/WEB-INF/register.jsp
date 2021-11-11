<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="error.jsp" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>Create New Account</title>
<!-- Global -->
<c:import url="sharedView/global.html"/>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/register.css">
</head>
<body>
	<div class="container d-flex justify-content-center align-content-center">
		<form action="register" class="" method="POST">
			<h2 class="">Create New Account</h2>
			<input type="hidden" name="action" value="REGISTER"> 
			<div class="mb-3">
				<label for="usernameInput" class="form-label">Username</label> <input
					id="usernameInput" type="text" class="form-control" name="username">
			</div>
			<div class="mb-3">
				<label for="emailInput" class="form-label">Email</label> <input
					id="emailInput" type="text" class="form-control" name="email">
			</div>
			<div class="mb-3">
				<label for="passwordInput" class="form-label">Password</label> <input
					id="passwordInput" type="password" class="form-control"
					name="password">
			</div>
			<div class="mb-3">
				<label for="passwordRepeat" class="form-label">Repeat password</label> <input
					id="passwordRepeat" type="password" class="form-control"
					name="reEnter">
			</div>
			<span style="color: red"><c:out value="${registerMessage}" /></span>
			<button type="submit" class="btn btn-primary">Signin</button>
		</form>
	</div>
</body>
</html>