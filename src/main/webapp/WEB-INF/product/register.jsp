<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>상품 등록</title>
</head>
<body>
<form action="/admin/products/register" method="post" enctype="multipart/form-data">
  <div>상품 코드: <input type="text" name="pcode" required></div>
  <div>상품 이름: <input type="text" name="productName" required></div>
  <div>상품 가격: <input type="number" name="unitPrice" required></div>
  <div>상품 설명: <textarea name="description" cols="30" rows="10" required></textarea></div>
  <div>
    상품 종류:
    티셔츠<input type="radio" name="category" value="T_shirt">
    케이스<input type="radio" name="category" value="Case">
    파우치<input type="radio" name="category" value="Pouch">
    에코백<input type="radio" name="category" value="Echo_bag">
  </div>
  <div>상품 재고: <input type="number" name="unitsInstock" required></div>
  <div><input type="file" name="file"></div>
  <div>주문 수량: <input type="number" name="accumulatedOrders" required></div>
  <div>리뷰 수:<input type="number" name="reviewCount" required></div>
  <button type="submit">상품 등록</button>
</form>
</body>
</html>
