<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.dto.MemberDTO" %>
<link href="/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
<link href="/css/tiny-slider.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="https://kit.fontawesome.com/dc88001a08.js" crossorigin="anonymous"></script>
<!-- Start Header/Navigation -->

<style>
    @font-face {
        font-family: 'KIMM_Bold';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2212@1.0/KIMM_Bold.woff2') format('woff2');
        font-weight: 700;
        font-style: normal;
    }

    @font-face {
        font-family: 'MBC1961GulimM';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/MBC1961GulimM.woff2') format('woff2');
        font-weight: normal;
        font-style: normal;
    }
    a.navbar-brand, ul.custom-navbar-nav.navbar-nav.ms-auto.mb-2.mb-md-0 { font-family: 'MBC1961GulimM'; }
    .font-apply {
        font-family: 'KIMM_Bold';
    }
    ::-webkit-scrollbar { width: 16px; }
    ::-webkit-scrollbar-track { background-color: #0c4128; }
    ::-webkit-scrollbar-thumb { background-color: antiquewhite; border-radius: 10px; }
    ::-webkit-scrollbar-thumb:hover { background-color: #20c997; }

    nav { position: fixed; }
</style>
<%
    MemberDTO memberDTO= (MemberDTO) session.getAttribute("loginInfo");
    String sessionEmailId=null;
    String sessionMemberName=null;
    if(memberDTO!=null) {
        sessionEmailId= memberDTO.getEmailId();
        sessionMemberName=memberDTO.getMemberName();
    }

%>

<nav class="custom-navbar navbar navbar navbar-expand-md navbar-dark bg-dark" arial-label="Furni navigation bar">

    <div class="container">
        <a class="navbar-brand" href="../../index.jsp">Mongchi Shop<span>.</span></a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsFurni" aria-controls="navbarsFurni" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <c:set var="sessionEmailId" value="<%=sessionEmailId%>"/>
        <c:set var="sessionMemberName" value="<%=sessionMemberName%>"/>

        <div class="collapse navbar-collapse" id="navbarsFurni">
            <ul class="custom-navbar-nav navbar-nav ms-auto mb-2 mb-md-0">
                <c:choose>

                    <c:when test="${empty sessionEmailId }">
                        <li class="nav-item"><a class="nav-link" href="../../index.jsp">Home</a></li>
                        <li><a class="nav-link" href="/login">LogIn</a></li>
                        <li><a class="nav-link" href="/addMember">Register</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a class="nav-link">[${sessionMemberName}&nbsp;님]</a></li>
                        <li class="nav-item"><a class="nav-link" href="../../index.jsp">Home</a></li>
                        <li><a class="nav-link" href="/logout">LogOut</a></li>
                    </c:otherwise>
                </c:choose>
                <li><a class="nav-link" href="/products">Product</a></li>
            </ul>

            <ul class="custom-navbar-cta navbar-nav mb-2 mb-md-0 ms-5">
                <li><a class="nav-link" href="/myPage"><img src="/images/user.svg"></a></li>
                <li><a class="nav-link" href="/cart/list"><img src="/images/cart.svg"></a></li>
            </ul>
        </div>
    </div>

</nav>

<script src="/js/bootstrap.bundle.min.js"></script>
<script src="/js/tiny-slider.js"></script>
<script src="/js/custom.js"></script>