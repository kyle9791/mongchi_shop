<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>상품 등록</title>
  <link href="/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
  <link href="/css/tiny-slider.css" rel="stylesheet">
  <link href="/css/style.css" rel="stylesheet">
</head>
<body>

<jsp:include page="../inc/menu.jsp"/>

<div class="hero">
  <div class="container">
    <h1 class="font-apply"><span class="d-block">상품 등록</span></h1>
  </div>
</div>

<div class="center">
  <section class="ftco-section">
    <div class="container">
      <div class="row justify-content-center"></div>
      <div class="row">
        <div class="col-md-12">
          <h3 class="h5 mb-4 text-center"></h3>

              <form action="/admin/products/register" method="post" enctype="multipart/form-data">
                  <p><label>상품 코드&nbsp;</label> <input type="text" name="pcode" required></p>
                  <p><label>상품 이름&nbsp;</label> <input type="text" name="productName" required></p>
                  <p><label>상품 가격&nbsp;</label> <input type="text" name="unitPrice" required></p>
                  <p><label>상품 설명&nbsp;</label> <textarea name="description" cols="30" rows="10" required></textarea></p>
                  <p><label>상품 종류&nbsp;</label>
                    <input type="radio" name="category" value="티셔츠">&nbsp;티셔츠&nbsp;
                    <input type="radio" name="category" value="케이스">케이스&nbsp;
                    <input type="radio" name="category" value="파우치">파우치&nbsp;
                    <input type="radio" name="category" value="에코백">에코백
                  </p>
                  <p><label>상품 재고&nbsp;</label> <input type="number" name="unitsInstock" required></p>
                  <p><label>상품 이미지&nbsp;</label><input type="file" name="file"></p>
                  <button type="submit">상품 등록</button>
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
