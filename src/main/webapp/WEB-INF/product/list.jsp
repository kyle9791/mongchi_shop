<%@ page import="java.util.List" %>
<%@ page import="com.example.dto.ProductDTO" %>
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

<div class="center">
    <section class="ftco-section">
        <div class="container">
            <div class="row justify-content-center"></div>
            <div class="row">
                <div class="col-md-12">
                    <h3 class="h5 mb-4 text-center"></h3>

                        <%
                            for (int j = 0; j < productDTOList.size(); j++) {
                                ProductDTO product = productDTOList.get(j);
                        %>

                            <ul style="list-style: none;">
                    <%--            <li><%= product.getPno() %></li>--%>
                    <%--            <li><%= product.getPcode() %></li>--%>
                                <li><a href="/products/product?pno=<%= product.getPno() %>"><%= product.getProductName() %></a></li>
                                <li><%= product.getUnitPrice() %></li>
                                <li><%= product.getDescription() %></li>
                                <li><%= product.getCategory() %></li>
                                <li><%= product.getUnitsInstock() %></li>
                                <li><img src="<%= product.getFileName() %>" alt="상품이미지" style="width: 100px"></li>
                                <li><%= product.getAccumulatedOrders() %></li>
                                <li><%= product.getReviewCount() %></li>
                                <li><%= product.getAddDate() %></li>
                            </ul>
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

                </div>
            </div>
        </div>
    </section>
</div>

<script src="/js/bootstrap.bundle.min.js"></script>
<script src="/js/tiny-slider.js"></script>
<script src="/js/custom.js"></script>

<jsp:include page="../inc/footer.jsp"/>

</body>
</html>
