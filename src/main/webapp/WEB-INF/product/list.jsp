<%@ page import="java.util.List" %>
<%@ page import="com.example.dto.ProductDTO" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    List<ProductDTO> productDTOList = (List<ProductDTO>) request.getAttribute("productDTOList");
    int currentPage = (int) request.getAttribute("currentPage");
    int totalPage = (int) request.getAttribute("totalPage");
    int pagePerBlock = 5;
    int totalBlock = totalPage % pagePerBlock == 0 ? totalPage/ pagePerBlock : totalPage /pagePerBlock + 1;
    int currentBlock = ((currentPage - 1) / pagePerBlock) + 1;
    int firstPage = ((currentBlock - 1) * pagePerBlock) + 1;
    int lastPage = currentBlock * pagePerBlock;
    lastPage = (lastPage > totalPage) ? totalPage : lastPage;
%>
<html>
<head>
    <title>상품 목록</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="/css/tiny-slider.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">

</head>

<body>

<jsp:include page="../inc/menu.jsp"/>

<div class="hero">
    <div class="container">
        <h1 class="font-apply"><span class="d-block">상품 목록</span></h1>
    </div>
</div>

<%
    DecimalFormat formatter=new DecimalFormat("###,###.##");
    for (int j = 0; j < productDTOList.size(); j++) {
        ProductDTO product = productDTOList.get(j);
%>

<div class="untree_co-section product-section before-footer-section">
        <div class="container">
            <div class="row">

                <div class="col-12 col-md-4 col-lg-3 mb-5">
                    <a class="product-item col-col" href="/products/product?pno=<%= product.getPno() %>">
                        <img src="<%= product.getFileName() %>" alt="상품이미지" class="img-fluid product-thumbnail">
                        <h3 class="product-title"><%= product.getProductName() %></h3>
                        <strong class="product-price"><%= formatter.format(Integer.parseInt(String.valueOf(product.getReviewCount()))) %></strong>
                        <p><label>리뷰&nbsp;</label><label><%= formatter.format(Integer.parseInt(String.valueOf(product.getUnitPrice()))) %>개</p>

                        <span class="icon-cross">
                        <img src="images/cross.svg" class="img-fluid">
                        </span>
                    </a>
                </div>
<%
    }
%>

                <%-- 페이지 번호 --%>
                <div style="text-align: center">
                    <c:set var="currentPage" value="<%= currentPage %>" />
                    <a href="/products?currentPage=1">처음</a>
                    <c:if test="<%= currentBlock > 1 %>">
                        <a href="/products?currentPage=<%= firstPage - 1 %>">이전</a>
                    </c:if>

                    <c:forEach var="i" begin="<%= firstPage %>" end="<%= lastPage %>">
                        <a href="/products?currentPage=${i}">
                            <c:choose>
                                <c:when test="${currentPage == i}">
                                    <span style="color: #4C5317;"><b>[${i}]</b></span>
                                </c:when>
                                <c:otherwise>
                                    <span style="color: #4C5317;">[${i}]</span>
                                </c:otherwise>
                            </c:choose>
                        </a>
                    </c:forEach>

                    <c:if test="<%= currentBlock < totalBlock %>">
                        <a href="/products?currentPage=<%= lastPage + 1 %>">다음</a>
                    </c:if>
                    <a href="/products?currentPage=${totalPage}">마지막</a>
                </div>


<script src="/js/bootstrap.bundle.min.js"></script>
<script src="/js/tiny-slider.js"></script>
<script src="/js/custom.js"></script>

<jsp:include page="../inc/footer.jsp"/>

</body>
</html>
