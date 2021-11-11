<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/global.css">
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/admin/register.css">
</head>
<body>
	<div
		class="container d-flex justify-content-center align-content-center">
		<form action="admin-create" class="" method="POST">
			<h2 class="">Create new admin</h2>
			<div class="mb-3">
				<label for="usernameInput" class="form-label">Username</label> <input
					id="usernameInput" type="text" class="form-control" name="username">
			</div>
			<div class="mb-3">
				<label for="passwordInput" class="form-label">Password</label> <input
					id="passwordInput" type="password" class="form-control"
					name="password">
			</div>
			<div class="mb-3">
				<label for="passwordRepeat" class="form-label">Repeat
					password</label> <input id="passwordRepeat" type="password"
					class="form-control" name="reEnter">
			</div>
			<div class="mb-3">
				<label for="firstName" class="form-label">First Name</label> <input
					id="firstName" type="text" class="form-control" name="firstName">
			</div>
			<div class="mb-3">
				<label for="lastName" class="form-label">Last Name</label> <input
					id="lastName" type="text" class="form-control" name="lastName">
			</div>
			<div class="mb-3">
				<label class="form-label" for="typeID">Choose admin type:</label> 
				<select id="typeID" name="TypeID" class="form-control">
					<option value="1">ROOT</option>
					<option value="2">PRODUCT</option>
				</select>
			</div>
			<span style="color: red"><c:out value="${registerMessage}" /></span>
			<button type="submit" class="btn btn-primary">Signin</button>
		</form>
	</div>
</body>
</html>