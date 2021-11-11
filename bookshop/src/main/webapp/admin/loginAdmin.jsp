<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Login Page</title>
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/global.css">
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/admin/login.css">
</head>
<body>
	<div class="container d-flex justify-content-center align-content-center">
		<form action="admin-login" class="" method="POST">
			<h2 class="">Please login</h2>
			<div class="mb-3">
				<label for="usernameInput" class="form-label">Username</label> <input
					id="usernameInput" type="text" class="form-control" name="username">
			</div>
			<div class="mb-3">
				<label for="passwordInput" class="form-label">Password</label> <input
					id="passwordInput" type="password" class="form-control"
					name="password">
			</div>
			<span style="color: red"><c:out value="${loginMessage}" /></span>
			<button type="submit" class="btn btn-primary">Login</button>
		</form>
	</div>
</body>
</html>