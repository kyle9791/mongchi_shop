<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>로그인</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="/css/tiny-slider.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">
</head>
<body>

<jsp:include page="../inc/menu.jsp"/>

<div class="hero">
    <div class="container">
        <h1 class="font-apply"><span class="d-block">로그인</span></h1>
    </div>
</div>

<div class="center">
    <section class="ftco-section">
        <div class="container">
            <div class="row justify-content-center"></div>
            <div class="row">
                <div class="col-md-12">
                    <h3 class="h5 mb-4 text-center"></h3>

                        <c:if test="${param.result == 'error'}">
                            <h1 style="color: red" alert>아이디와 비밀번호를 확인해 주세요</h1>
                        </c:if>
                        <form action="/login" method="post">
                            <p><label>이메일&nbsp;</label><input type="email" name="emailId"></p>
                            <p><label>비밀번호&nbsp;</label><input type="password" name="password"></p>
                            <input type="checkbox" name="auto"><label>&nbsp;자동 로그인</label>
                            &nbsp;<button type="submit">로그인</button>
                            &nbsp;<button><a href="/addMember" class="text-white">회원 가입</a></button>
                        </form>

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


