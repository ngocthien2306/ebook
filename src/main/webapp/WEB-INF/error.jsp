<%@page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" isErrorPage="true" isELIgnored="false"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Insert title here</title>
  </head>
  <body>
    <h1>Something goes wrong :&#60;</h1>
    <h2>Error message: <%=exception.getMessage()%></h2>
    <c:if test="${exception}">
      <h2><c:out value="${exception}" /></h2>
    </c:if>
  </body>
</html>
