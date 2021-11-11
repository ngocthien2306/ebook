<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="error.jsp" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>Verify your code</title>
<!-- Global -->
<c:import url="sharedView/global.html"/>
<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
	<div class="container d-flex justify-content-center align-content-center">
		<form action="verify" class="" method="POST">
			<h2 class="">Verify your code</h2>
			<input type="hidden" name="action" value="VERIFY"> 
			<div class="mb-3">
				<label for="codeInput" class="form-label">Your code from email</label> <input
					id="codeInput" type="text" class="form-control" name="code">
			</div>
			<span style="color: red"><c:out value="${verifyMessage}" /></span>
			<button type="submit" class="btn btn-primary">Verify</button>
		</form>
	</div>
</body>
</html>