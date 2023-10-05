<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table class="fold-table">
    <thead>
    <tr>
        <th>답변 여부</th>
        <th>아이디</th>
        <th>제목</th>
        <th>작성일</th>
        <th>내용</th>
    </tr>
    </thead>

    <c:forEach var="qnaDto" items="${qnABoardDTOList}">
    <tbody>
    <tr class="view">
        <td>${qnaDto.isAnswered() ? "답변 완료" : "미답변"}</td>
        <td>${qnaDto.getEmailId()}</td>
        <c:if test="${qnaDto.secreted == true}">
            <c:choose>
                <c:when test="${qnaDto.emailId eq 'a'}">
                    <td><a href="/qnaBoard/view?pcode=${qnaDto.pcode}&qno=${qnaDto.qno}">${qnaDto.questionSubject}</a></td>
                </c:when>
                <c:otherwise>
                    <td><i class="fa-solid fa-lock"></i>&nbsp;비밀글입니다</td>
                </c:otherwise>
            </c:choose>
        </c:if>
        <td>${qnaDto.getQuestionDate()}</td>
        <td>${qnaDto.getQuestionContent()}</td>
    </tr>
    </c:forEach>

    <tr class="fold">
        <td colspan="7">
            <c:forEach var="qnaDto" items="${qnABoardDTOList}">
            <div class="fold-content">
                <c:if test="${qnaDto.secreted == true || qnaDto.answered == true}">
                    <c:choose>
                        <c:when test="${qnaDto.emailId eq 'a'}">
                            <p><a href="/qnaBoard/view?pcode=${qnaDto.pcode}&qno=${qnaDto.qno}">${qnaDto.questionSubject}</a></p>
                            <p>${qnaDto.questionContent}</p>
                            <p>${qnaDto.answerContent}</p>
                            <p>${qnaDto.answerDate}</p>
                        </c:when>
                        <c:otherwise>
                            <td><i class="fa-solid fa-lock"></i>&nbsp;비밀글입니다</td>
                        </c:otherwise>
                    </c:choose>
                </c:if>
                </div>
                </c:forEach>
        </td>
    </tr>


    </tbody>
</table>



<a href="/qnaBoard/qnaList?pcode=p126&beginRow=1&rowPerPage=10">pcode=126의 qnaBoard 이동 >></a>
<a href="/qnaBoard/qnaList?pcode=p126">qnaBoard 이동 >></a>
<a href="/qnaBoard/view?pcode=p125&qno=3">view >></a>
<a href="/qnaBoard/modifyQuestion?pcode=p125&qno=3">질문 수정 >></a>
<a href="/qnaBoard/modifyAnswer?pcode=p125&qno=3">답변 업데이트 >></a>
</body>
</html>
