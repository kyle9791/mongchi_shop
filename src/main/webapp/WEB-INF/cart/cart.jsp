<%@ page import="com.example.dto.CartDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.dto.ProductDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    List<CartDTO> cartDTOList = (List<CartDTO>) session.getAttribute("cartDTOList");
%>
<html>
<head>
    <!-- Bootstrap CSS -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="/css/tiny-slider.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">
    <title>장바구니</title>
</head>
<body>

<jsp:include page="../inc/menu.jsp"/>
<!-- Start Hero Section -->
<div class="hero">
    <div class="container">
        <div class="row justify-content-between">
            <div class="col-lg-5">
                <div class="intro-excerpt">
                    <h1 class="font-apply">Cart</h1>
                </div>
            </div>
            <div class="col-lg-7">

            </div>
        </div>
    </div>
</div>
<!-- End Hero Section -->

<div class="untree_co-section before-footer-section">
    <div class="container">
        <div class="row mb-5">
            <form class="col-md-12" name="frmCart" method="get">
                <div class="site-blocks-table">
                    <table class="table">
                        <thead>
                        <tr>
                            <th class="product-all-check">
                                <input class="form-check-input" type="checkbox" style="width: 25px; height: 25px;">
                            </th>
                            <th class="product-thumbnail">Image</th>
                            <th class="product-name">Product</th>
                            <th class="product-price">Price</th>
                            <th class="product-quantity">Quantity</th>
                            <th class="product-total">Total</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            int total = 0; // 총 주문금액
                            for (CartDTO cart : cartDTOList) {
                                int price = cart.getUnitPrice() * cart.getCnt();
                                total += price;
                        %>
                        <tr>
                            <td class="product-check">
                                <input class="form-check-input" type="checkbox" name="checks" value="<%= cart.getCno() %>" style="width: 25px; height: 25px;">
                            </td>
                            <td class="product-thumbnail">
                                <img src="<%= cart.getFileName() %>" alt="Image" class="img-fluid">
                            </td>
                            <td class="product-name">
                                <h2 class="h5 text-black"><%= cart.getProductName() %></h2>
                            </td>
                            <td><%= cart.getUnitPrice() %>원</td>
                            <td>
                                <div class="input-group mb-3 d-flex align-items-center quantity-container" style="max-width: 120px;">
                                    <div class="input-group-prepend">
                                        <button data-amount="decrease" class="btn btn-outline-black amount" type="button">&minus;</button>
                                    </div>
                                    <input type="hidden" name="cno" value="<%= cart.getCno() %>">
                                    <input type="text" class="form-control text-center cnt" value="<%= cart.getCnt() %>" aria-label="Example text with button addon" aria-describedby="button-addon1">
                                    <div class="input-group-append">
                                        <button data-amount="increase" class="btn btn-outline-black amount" type="button">&plus;</button>
                                    </div>
                                </div>
                            </td>
                            <td><%= cart.getUnitPrice() * cart.getCnt() %>원</td>
                        </tr>
                        <%
                            }
                        %>
                        </tbody>
                    </table>
                </div>
            </form>
        </div>

        <div class="row">
            <div class="col-md-6">
                <div class="row mb-5">
                    <div class="col-md-6 mb-3 mb-md-0">
                        <button id="btn-selected" class="btn btn-black btn-sm btn-block">선택 삭제</button>
                    </div>
                    <div class="col-md-6">
                        <button id="btn-products" class="btn btn-outline-black btn-sm btn-block">쇼핑 목록</button>
                    </div>
                </div>
            </div>
            <div class="col-md-6 pl-5">
                <div class="row justify-content-end">
                    <div class="col-md-7">
                        <div class="row">
                            <div class="col-md-12 text-right border-bottom mb-5">
                                <h3 class="text-black h4 text-uppercase">Cart Totals</h3>
                            </div>
                        </div>

                        <div class="row mb-5">
                            <div class="col-md-6">
                                <span class="text-black">Total</span>
                            </div>
                            <div class="col-md-6 text-right">
                                <strong class="text-black"><%= total %>원</strong>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <button id="btn-order" class="btn btn-black btn-lg py-3 btn-block">주문하기</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../inc/footer.jsp"/>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    // AJAX 장바구니 수량변경
    $('.amount').click(function () {
        const amount = $(this).data("amount");
        const cno = $(this).parent().siblings("input[name=cno]").val();
        let cnt = $(this).parent().siblings(".cnt");
        console.log('cno: ' + cno, 'cnt: ' + cnt.val(), 'amount: ' + amount);

        // AJAX 요청 보내기
        $.ajax({
            url: "/cart/modify",
            method: "POST",
            data: {
                cno: cno,
                cnt: cnt.val(),
                amount: amount
            },
            success: function (response) {
                // 업데이트 성공
                cnt.val(amount === "increase" ? parseInt(cnt.val()) + 1 : parseInt(cnt.val()) - 1);
                console.log("수량 업데이트 성공: " + response.message);
            },
            error: function (xhr, status, error) {
                console.error("수량 업데이트 실패: " + error);
            }
        });
    })
</script>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const frmCart = document.querySelector("form[name=frmCart]");

        // 전체선택
        const btnAllCheck = document.querySelector(".product-all-check");
        btnAllCheck.addEventListener("change", function (event) {
            const checks = document.querySelectorAll("input[name=checks]");
            checks.forEach(check => {
                check.checked = event.target.checked;
            });
        });

        // 선택삭제
        const btnRemoveSelected = document.querySelector("#btn-selected");
        btnRemoveSelected.addEventListener("click", function () {
            if (confirm("정말 삭제하시겠습니까?")) {
                frmCart.action = "/cart/remove";
                frmCart.submit();
            }
        });

        // 주문
        const btnOrder = document.querySelector("#btn-order");
        btnOrder.addEventListener("click", function () {
            frmCart.action = "/shippingInfo";
            frmCart.submit();
        });

        // 쇼핑목록
        const btnProducts = document.querySelector("#btn-products");
        btnProducts.addEventListener("click", function () {
            frmCart.action = "/products";
            frmCart.submit();
        });
    });
</script>
</body>
</html>
