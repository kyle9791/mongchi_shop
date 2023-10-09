<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.dto.CartDTO" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    List<CartDTO> cartDTOList = (List<CartDTO>) session.getAttribute("cartDTOList");
%>
<html>
<head>
    <title>장바구니</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="/css/tiny-slider.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">
</head>
<body>
<jsp:include page="../inc/menu.jsp"/>

<div class="hero">
    <div class="container">
        <h1 class="font-apply"><span class="d-block">장바구니</span></h1>
    </div>
</div>


<div class="center">
    <section class="ftco-section">
        <div class="container">
            <div class="row justify-content-center"></div>
            <div class="row">
                <div class="col-md-12">
                    <h3 class="h5 mb-4 text-center"></h3>

                        <ul>
                            <button><a href="#" class="btn-selected text-white">선택 삭제</a></button>
                            <button><a href="#" class="btn-order text-white">주문</a></button>
                            <form action="#" name="frmCart" method="get">
                                <c:forEach var="cart" items="<%= cartDTOList %>">
                                    <li>
                                        <span><input type="checkbox" name="check" value="${cart.cno}"></span>
                                        <span>${cart}</span>
                                    </li>
                                </c:forEach>
                            </form>
                        </ul>

                </div>
            </div>
        </div>
    </section>
</div>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const frmCart = document.querySelector("form[name=frmCart]");

            // 선택삭제
            const btnRemoveSelected = document.querySelector(".btn-selected");
            btnRemoveSelected.addEventListener("click", function () {
                if (confirm("정말 삭제하시겠습니까?")) {
                    frmCart.action = "/cart/remove";
                    frmCart.submit();
                }
            });

            const btnOrder = document.querySelector(".btn-order");
            btnOrder.addEventListener("click", function () {
                frmCart.action = "/shippingInfo";
                frmCart.submit();
            });

        });
    </script>
</body>
</html>
