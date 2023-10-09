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

<div class="center">
    <section class="ftco-section">
        <div class="container">
            <div class="row justify-content-center"></div>
            <div class="row">
                <div class="col-md-12">
                    <h3 class="h5 mb-4 text-center"></h3>



                      <ul>
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
                              <a href="/cart/add?pno=${productDTO.pno}">장바구니 담기</a>
                              <a href="/cart/list">장바구니로 이동</a>
                              <a href="/qnaBoard/add?pno=${productDTO.pno}&productName=${productDTO.productName}">상품 문의 등록</a>
                          </li>
                      </ul>

                </div>
            </div>
        </div>
    </section>

    <script src="/js/bootstrap.bundle.min.js"></script>
    <script src="/js/tiny-slider.js"></script>
    <script src="/js/custom.js"></script>

    <jsp:include page="../inc/footer.jsp"/>
</div>
</body>
</html>
