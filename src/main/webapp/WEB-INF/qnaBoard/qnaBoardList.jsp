<%@ page import="java.util.List" %>
<%@ page import="com.example.dto.MemberDTO" %>
<%@ page import="com.example.dto.QnABoardDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
  List<QnABoardDTO> qnABoardDTOList=(List<QnABoardDTO>) request.getAttribute("qnABoardDTOList");
  int currentPage=(Integer) request.getAttribute("currentPage");
  int totalPage=(Integer) request.getAttribute("totalPage");
  int pno=(Integer)request.getAttribute("pno"); // doGet
//  String productName=request.getParameter("productName");

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

  System.out.println(qnABoardDTOList);

  String productName=null;
  QnABoardDTO qnABoardDTO=null;
  if(qnABoardDTOList.size()>0) {
    qnABoardDTO = qnABoardDTOList.get(0);
    System.out.println("qnaBoardList productName: "+qnABoardDTO.getProductName());
    productName=qnABoardDTO.getProductName();
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
<style>
  li { list-style: none; }

  .list { width: 1000px; margin: 0 auto; }

  .notice ul {
    width: 100%;
  }

  .answer {
    width: 100px;
    text-align: center;
  }

  .email {
    width: 150px;
    text-align: center;
  }


  .questionContent {
    width: 700px;
    text-align: center;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
  }

  .paging {
    text-align: center;
  }
  .questionDate {
    width: 120px;
    text-align: center;
  }

  .list > ul { position: relative; display: flex; margin-bottom: 0;}
  div ul li { position: relative; }

  .answerToggle {
    flex-direction: column;
  }
  .answerToggle li { width: 100%; text-align: center;}
  .toggle li { padding-top: 10px; }
  .toggle:hover {
    background: rgb(220 226 224);
  }
  .a_href {
    text-decoration: none; color: gray; font-size: 10px;
  }

</style>

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

        <div class="list">
          <ul style="font-weight: bold; border-bottom: 2px solid black;" class="text-black">
            <li class="answer">답변 여부</li>
            <li class="questionContent">내용</li>
            <li class="email">작성자</li>
            <li class="questionDate">작성일</li>
          </ul>

          <c:forEach var="qnaDto" items="${qnABoardDTOList}">
            <c:if test="${not empty qnABoardDTOList}">
            <%--            <c:if test="${fn:length(qnABoardDTOList) > 0}">--%>

              <c:set var="sessionEmailId" value="<%=sessionEmailId%>"/>
              <c:set var="emailId" value="${qnaDto.emailId}"/>
              <c:set var="emailIdSplit" value="${fn:substringBefore(emailId,'@')}"/>
              <c:set var="questionDate" value="${qnaDto.questionDate}"/>
              <c:set var="questionDateSplit" value="${fn:substringBefore(questionDate,' ')}"/>
              <c:set var="answerDate" value="${qnaDto.answerDate}"/>
              <c:set var="answerDateSplit" value="${fn:substringBefore(answerDate,' ')}"/>
            <ul class="toggle">
                <li class="answer">${qnaDto.isAnswered() ? "답변 완료" : "미답변"}</li>

                <c:if test="${qnaDto.secreted == true}">
                  <c:choose>
                    <c:when test="${qnaDto.emailId eq sessionEmailId}">
                      <li class="questionContent">${qnaDto.questionContent}</li>
                    </c:when>
                    <c:otherwise>
                      <li class="questionContent"><i class="fa-solid fa-lock"></i>&nbsp;비밀글입니다.</li>
                    </c:otherwise>
                  </c:choose>
                </c:if>
                <c:if test="${qnaDto.secreted == false}">
                  <li class="questionContent">${qnaDto.questionContent}</li>
                </c:if>
              <li class="email">${emailIdSplit}</li>
              <li class="questionDate">${questionDateSplit}</li>
              </ul>

              <ul class="answerToggle" style="background:rgb(220 226 224); color: black; padding: 10px">
                <li class="answer"></li>

                <c:if test="${qnaDto.secreted==false}">
                  <li class="questionContent">
                      ${qnaDto.questionContent}
                        <c:if test="${qnaDto.emailId eq sessionEmailId}">
                          <c:if test="${qnaDto.answered==false}">
                            <a href="/qnaBoards/modifyQuestion?pno=<%=pno%>&qno=${qnaDto.qno}" class="a_href">|&nbsp;수정</a>
                            <a href="/qnaBoards/modifyAnswer?pno=<%=pno%>&qno=${qnaDto.qno}" class="a_href">|&nbsp;답변 등록</a>
                          </c:if>
                          <a href="/qnaBoards/remove?pno=<%=pno%>&qno=${qnaDto.qno}" class="a_href">|&nbsp;삭제&nbsp;</a>
                        </c:if>
                  </li>
                  <li class="email"></li>

                  <c:if test="${qnaDto.answered==true}">
                    <hr>
                    <li>
                      <i class="fa-regular fa-comment fa-flip-horizontal"></i>
                      ${qnaDto.answerContent} <span style="color: gray">${answerDateSplit}</span>
                    </li>
                  </c:if>
                </c:if>

                <c:if test="${qnaDto.secreted==true}">
                  <c:if test="${qnaDto.emailId eq sessionEmailId}">
                    <li>
                        ${qnaDto.questionContent}
                          <c:if test="${qnaDto.answered==false}">
                            <a href="/qnaBoards/modifyQuestion?pno=<%=pno%>&qno=${qnaDto.qno}" class="a_href">|&nbsp;수정</a>
                          </c:if>
                          <a href="/qnaBoards/remove?pno=<%=pno%>&qno=${qnaDto.qno}" class="a_href">|&nbsp;삭제&nbsp;</a>
                    </li>
                    <c:if test="${qnaDto.answered==true}">
                      <hr>
                      <li>
                        <i class="fa-regular fa-comment fa-flip-horizontal"></i>
                          ${qnaDto.answerContent} <span>${qnaDto.answerDate}</span>
                      </li>
                    </c:if>
                  </c:if>
              </c:if>

              </ul>
            </c:if>
      </c:forEach>
          <hr>
          <button class="btn btn-primary-hover-outline" style="background: #3b5d50 !important; padding: 10px 20px !important;"><a style="text-decoration: none" class="text-white" href="/qnaBoards/add?pno=<%=pno%>&productName=<%=productName%>">문의 등록</a></button>
          <button class="btn btn-primary-hover-outline" style="padding: 10px 20px !important;"><a href="/products/product?pno=<%=pno%>" style="text-decoration: none;" class="text-white">뒤로 가기</a></button>

        </div>
        </div>
      </div>
  </div>
</section>
<h3 class="h5 mb-4 text-center"></h3>



<!-- 페이지 -->
<div class="paging">
  <c:set var="currentPage" value="<%=currentPage%>"/>

  <a href="/qnaBoards?pno=<%=pno%>&currentPage=1" style="text-decoration: none"/><span>처음</span></a>
  <c:if test="${thisBlock>1}">
    <a href="/qnaBoards?pno=<%=pno%>&currentPage=${firstPage-1}" style="text-decoration: none"/><span>이전</span></a>
  </c:if>
  <c:forEach var="i" begin="<%=firstPage%>" end="<%=lastPage%>">
    <a href="/qnaBoards?pno=<%=pno%>&currentPage=${i}" style="text-decoration: none">
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
    <a href="/qnaBoards?pno=<%=pno%>&currentPage=${lastPage+1}" style="text-decoration: none"/><span>다음</span></a>
  </c:if>
  <a href="/qnaBoards?pno=<%=pno%>&currentPage=${totalPage}" style="text-decoration: none"/><span>마지막</span></a>

  <script src="/js/bootstrap.bundle.min.js"></script>
  <script src="/js/tiny-slider.js"></script>
  <script src="/js/custom.js"></script>
  <jsp:include page="../inc/footer.jsp"/>

  <style>
    .paging a:hover {
      color: seagreen;
      font-weight: bold;
    }
  </style>
</div>

<script>

</script>

</body>
</html>
