<%@ page import="java.util.List" %>
<%@ page import="com.example.dto.MemberDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <link href="/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
  <link href="/css/tiny-slider.css" rel="stylesheet">
  <link href="/css/style.css" rel="stylesheet">
  <script src="https://kit.fontawesome.com/dc88001a08.js" crossorigin="anonymous"></script>
    <title>qna</title>
</head>
<body>
<%
  List qnABoardDTOList=(List) request.getAttribute("qnABoardDTOList");
  int currentPage=(Integer) request.getAttribute("currentPage");
  int totalPage=(Integer) request.getAttribute("totalPage");
  int pno=(Integer)request.getAttribute("pno");

  int pagePerBlock=5; // 페이지 출력 시 나올 범위
  int totalBlock=totalPage%pagePerBlock==0 ? totalPage / pagePerBlock : totalPage / pagePerBlock+1; // 전체 블럭 수
  int thisBlock=((currentPage-1)/pagePerBlock)+1; // 현재 블럭
  int firstPage=((thisBlock-1)*pagePerBlock)+1; // 블럭의 첫 페이지
  int lastPage=thisBlock*pagePerBlock; // 블럭의 마지막 페이지
  lastPage=(lastPage>totalPage)?totalPage:lastPage;

  MemberDTO memberDTO= (MemberDTO) session.getAttribute("loginInfo");
  String sessionEmailId=null;
  if(memberDTO!=null) {
    sessionEmailId= memberDTO.getEmailId();
  }
%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
  $(function() {
    $(".answerToggle").hide();

    $(".toggle").on("click", function() {
      $(this).next(".answerToggle").slideToggle();

    });

  });
</script>

<jsp:include page="../inc/menu.jsp"/>

<!-- 제목 영역 시작 -->
<div class="hero">
  <div class="container">
    <h1 class="font-apply"><span class="d-block">QnA 목록</span></h1>
  </div>
</div>
<!-- 제목 영역 끝 -->

<section class="ftco-section">
  <div class="container">
    <div class="row justify-content-center"></div>
    <div class="row">
      <div class="col-md-12">
        <h3 class="h5 mb-4 text-center"></h3>

        <div>
          <table class="table myaccordion table-hover" id="accordion">
            <thead>
            <tr>
              <th>답변 여부</th>
              <th>아이디</th>
              <th>내용</th>
              <th>작성일</th>
              <th>비고</th>
            </tr>
            </thead>


            <tbody>
            <c:forEach var="qnaDto" items="${qnABoardDTOList}">
              <c:set var="sessionEmailId" value="<%=sessionEmailId%>"/>
              <tr class="toggle">
                <td>${qnaDto.isAnswered() ? "답변 완료" : "미답변"}</td>
                <td>${qnaDto.getEmailId()}</td>
                <c:if test="${qnaDto.secreted == true}">
                  <c:choose>
                    <c:when test="${qnaDto.emailId eq sessionEmailId}">
                      <td>${qnaDto.questionContent}</td>
                    </c:when>
                    <c:otherwise>
                      <td><i class="fa-solid fa-lock"></i>&nbsp;비밀글입니다</td>
                    </c:otherwise>
                  </c:choose>
                </c:if>
                <c:if test="${qnaDto.secreted == false}">
                  <td>${qnaDto.questionContent}</td>
                </c:if>
                  <td>${qnaDto.getQuestionDate()}</td>

                <c:if test="${qnaDto.answered == false && (qnaDto.emailId eq sessionEmailId)}">
                  <td><button><a href="/qnaBoard/modifyQuestion?pno=${qnaDto.pno}&qno=${qnaDto.qno}" class="text-white">수정</a></button></td>
                </c:if>
                <c:if test="${qnaDto.emailId eq sessionEmailId}">
                  <td><a href="/qnaBoard/remove?qno=${qnaDto.qno}">x</a></td>
                </c:if>
              </tr>

              <tr class="answerToggle" style="word-break:break-all;">
                <c:if test="${qnaDto.secreted == true && qnaDto.answered == true}">
                  <c:choose>
                    <c:when test="${qnaDto.emailId eq sessionEmailId}">
                      <td>&nbsp;</td>
                      <td style="word-break:break-all;">${qnaDto.questionContent}</td>
                      <br>
                      <td>${qnaDto.answerContent}</td>
                      <td>${qnaDto.answerDate}</td>
                    </c:when>
                  </c:choose>
                </c:if>
                <c:if test="${qnaDto.secreted == false && qnaDto.answered == true}">
                  <td>&nbsp;</td>

                  <td>${qnaDto.questionContent}</td>
                  <td>${qnaDto.answerContent}</td>
                  <td>${qnaDto.answerDate}</td>
                </c:if>
              </tr>

            </c:forEach>

            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</section>


<!-- 페이지 -->
<div style="text-align: center">
  <c:set var="currentPage" value="<%=currentPage%>"/>

  <a href="/qnaBoard/qnaList?pno=<%=pno%>&currentPage=1"/><span>처음</span></a>
  <c:if test="${thisBlock>1}">
    <a href="/qnaBoard/qnaList?pno=<%=pno%>&currentPage=${firstPage-1}"/><span>이전</span></a>
  </c:if>
  <c:forEach var="i" begin="<%=firstPage%>" end="<%=lastPage%>">
    <a href="/qnaBoard/qnaList?pno=<%=pno%>&currentPage=${i}">
        <%--                    <a href="./boardList.do?pageNum=${i}&items=<%=items%>&text=<%=text%>">--%>
      <c:choose>
        <c:when test="${currentPage==i}">
          <font color="#2f4f4f"><b>[${i}]</b></font>
        </c:when>
        <c:otherwise>
          <font color="#696969">[${i}]</font>
        </c:otherwise>
      </c:choose>
    </a>
  </c:forEach>

  <c:if test="${thisBlock<totalBlock}">
    <a href="/qnaBoard/qnaList?pno=<%=pno%>&currentPage=${lastPage+1}"/><span>다음</span></a>
  </c:if>
  <a href="/qnaBoard/qnaList?pno=<%=pno%>&currentPage=${totalPage}"/><span>마지막</span></a>

  <script src="/js/bootstrap.bundle.min.js"></script>
  <script src="/js/tiny-slider.js"></script>
  <script src="/js/custom.js"></script>
  <jsp:include page="../inc/footer.jsp"/>
</div>

<script>

</script>

</body>
</html>
