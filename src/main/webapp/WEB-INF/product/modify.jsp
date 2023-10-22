<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>상품 등록</title>
</head>
<body>
<form action="/admin/products/modify" method="post" enctype="multipart/form-data">
  <input type="hidden" name="pno" value="${productDTO.pno}">
  <div>상품 코드: <input type="text" name="pcode" value="${productDTO.pcode}" required></div>
  <div>상품 이름: <input type="text" name="productName" value="${productDTO.productName}" required></div>
  <div>상품 가격: <input type="number" name="unitPrice" value="${productDTO.unitPrice}" required></div>
  <div>상품 설명: <textarea name="description" cols="30" rows="10" required>${productDTO.description}</textarea></div>
  <div>
    상품 종류:
    티셔츠<input type="radio" name="category" value="T_shirt" ${productDTO.category.equals("T_shirt") ? "checked" : ""}>
    케이스<input type="radio" name="category" value="Case" ${productDTO.category.equals("Case") ? "checked" : ""}>
    파우치<input type="radio" name="category" value="Pouch" ${productDTO.category.equals("Pouch") ? "checked" : ""}>
    에코백<input type="radio" name="category" value="Echo_bag" ${productDTO.category.equals("Echo_bag") ? "checked" : ""}>
  </div>
  <div>상품 재고: <input type="number" name="unitsInstock" value="${productDTO.unitsInstock}" required></div>
  <div>
    상품 이미지
    <img src="/${productDTO.fileName}" alt="상품이미지">
    <input type="file" name="file">
  </div>
  <div>주문 수량: <input type="number" name="accumulatedOrders" value="${productDTO.accumulatedOrders}" required></div>
  <div>리뷰 수:<input type="number" name="reviewCount" value="${productDTO.reviewCount}" required></div>
  <button type="submit">등록</button>
</form>
</body>
</html>
