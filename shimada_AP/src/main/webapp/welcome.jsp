<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
<style>
	body {
		front-family: Arial, sans-serif;
		margin: 20px;
		padding: 20px;
		background-color: #f4f4f4;
	}
	.container {
		max-width: 800px;
		margin: 0 auto;
		background: #fff;
		padding: 20px;
		border-radius: 8px;
		box-shadow: 0 0 10px rgba(0,0,0,0.1);
	}
	h1 {
		color: #333;
	}
	p {
		color: #666;
	}
</style>
</head>
<body>
	<div class="container">
		<h1>Welcome Our Website!</h1>
		<p>Hello,<c:out value="${username}"/>! We are glad to have you here.</p>
		<p>This is a simple welcome page that can be customized to fit your needs.</p>
		<a href="login.jsp">Logout</a>
	</div>
</body>
</html>