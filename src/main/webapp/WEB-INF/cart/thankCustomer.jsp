<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>주문 완료</title>
	<link href="/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
	<link href="/css/tiny-slider.css" rel="stylesheet">
	<link href="/css/style.css" rel="stylesheet">
</head>
<body>
	<%
		String orderId = (String) session.getAttribute("orderId");
	%>

		<div class="jumbotron">
			<div class="container">
				<h1 class="display-3">주문 완료</h1>
			</div>
		</div>
		<div class="container">
			<h2 class="alert alert-danger">주문해 주셔서 감사합니다.</h2>
			<p>주문 번호 : <%= orderId %></p>
		</div>
		<div class="container">
			<p><a href="/products" class="btn btn-secondary">상품 목록 >> </a></p>
		</div>
</body>
</html>