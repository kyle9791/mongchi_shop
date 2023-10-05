<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>qnaBoard Add</title>
</head>
<body>
    <form action="/qnaBoard/add" method="post">
        <p>질문 제목: <input type="text" name="questionSubject"></p>
        <p>이메일 아이디: <input type="text" name="emailId"></p>
        <p>질문 내용: <textarea name="questionContent"></textarea></p>
        <p>상품 코드: <input type="text" name="pcode"></p>
        <input type="checkbox" name="secreted"><label>비밀글 설정</label>
        <button type="submit">전송</button>
    </form>

</body>
</html>
