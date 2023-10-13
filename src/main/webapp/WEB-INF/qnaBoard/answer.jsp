<%@ page import="com.example.dto.MemberDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="/css/tiny-slider.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">
</head>
<body>
<%
    int pno=(Integer)request.getAttribute("pno"); // doGet
    MemberDTO memberDTO= (MemberDTO) session.getAttribute("loginInfo");
    String sessionEmailId=null;
    if(memberDTO!=null) {
        sessionEmailId= memberDTO.getEmailId();
    }
%>
<jsp:include page="../inc/menu.jsp"/>

<div class="hero">
    <div class="container">
        <h1 class="font-apply"><span class="d-block">Q&A 답변 등록</span></h1>
    </div>
</div>

<div class="center">
    <section class="ftco-section">
        <div class="container">
            <div class="row justify-content-center"></div>
            <div class="row">
                <div class="col-md-12">
                    <h3 class="h5 mb-4 text-center">질문</h3>
                    <form id="modifyQuestionForm" action="/qnaBoards/modifyQuestion" method="get">
                        <p><input type="hidden" name="qno" value="${qnABoardDTO.qno}" ></p>
                        <input type="hidden" name="pno" value="${qnABoardDTO.pno}" >
                        <p><label>제품명&nbsp;</label><input type="text" name="productName" value="${qnABoardDTO.productName}" readonly></p>
                        <p><label>이메일&nbsp;</label><input type="text" name="emailId" value="<%=sessionEmailId%>" readonly></p>
                        <p><label>내용&nbsp;</label><textarea name="questionContent" readonly>${qnABoardDTO.questionContent}</textarea></p>
                    </form>

                    <hr>

                    <h3 class="h5 mb-4 text-center">답변</h3>

                    <form id="modifyAnswerForm" action="/qnaBoards/modifyAnswer" method="post">
                        <input type="hidden" name="qno" value="${qnABoardDTO.qno}">
                        <input type="hidden" name="pno" value="${qnABoardDTO.pno}" >
                        <textarea name="answerContent"></textarea>
                        <button type="submit">답변 등록</button>
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
