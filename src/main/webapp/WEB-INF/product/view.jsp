<%@ page import="java.text.DecimalFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>상품 상세</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="/css/tiny-slider.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">
</head>
<body>

<jsp:include page="../inc/menu.jsp"/>

<div class="hero">
    <div class="container">
        <h1 class="font-apply"><span class="d-block">상품 상세</span></h1>
    </div>
</div>

<%
    DecimalFormat formatter=new DecimalFormat("###,###.##");
%>

<ul>
    <form action="#" name="frmProduct" method="post">
        <input type="hidden" name="pno" value="${productDTO.pno}">
        <input type="hidden" name="productName" value="${productDTO.productName}">
        <input type="hidden" name="unitPrice" value="${productDTO.unitPrice}">
        <input type="hidden" name="fileName" value="${productDTO.fileName}">
    </form>
    <li><c:out value="${productDTO.pcode}"/></li>
    <li><c:out value="${productDTO.productName}"/></li>
    <li><c:out value="${productDTO.unitPrice}"/></li>
    <li><c:out value="${productDTO.description}"/></li>
    <li><c:out value="${productDTO.category}"/></li>
    <li><c:out value="${productDTO.unitsInstock}"/></li>
    <li><c:out value="${productDTO.fileName}"/></li>
    <li><c:out value="${productDTO.accumulatedOrders}"/></li>
    <li><c:out value="${productDTO.reviewCount}"/></li>
    <li><c:out value="${productDTO.addDate}"/></li>
    <li>
        <button class="btn-add" type="button">장바구니 담기</button>
        <a href="/cart/list">장바구니로 이동</a>
        <a href="/qnaBoards/add?pno=${productDTO.pno}&productName=${productDTO.productName}">문의 등록</a>
        <a href="/qnaBoards?pno=${productDTO.pno}&productName=${productDTO.productName}">문의 목록</a>
    </li>
</ul>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const frmProduct = document.querySelector('form[name=frmProduct]');
        console.log(frmProduct);
        const btnAdd = document.querySelector('.btn-add');
        console.log(btnAdd);

        btnAdd.addEventListener('click', function () {
            frmProduct.action = '/cart/add';
            frmProduct.submit();
        });
    });
</script>

    <script src="/js/bootstrap.bundle.min.js"></script>
    <script src="/js/tiny-slider.js"></script>
    <script src="/js/custom.js"></script>

    <jsp:include page="../inc/footer.jsp"/>
</div>
</body>
</html>
