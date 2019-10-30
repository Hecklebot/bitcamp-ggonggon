<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<html>
<head>
  <title>주문 폼</title>
  <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T' crossorigin='anonymous'>
  <link rel="stylesheet" href="/css/member/style_contact.css">
  <link rel="stylesheet" href="/css/member/style_footer.css">
  
</head>
<body>
  <jsp:include page="../header.jsp"/>
  <form action="add" method="post">
    <h2>${product.title}</h2><br>
    <h5><span id="totalPrice">${product.price * quantity * (100-product.discount)/100}</span>원</h5><br>
    <h5>수량: ${quantity}</h5>
    <h5>할인률: ${product.discount}%</h5>
    
    회원 번호<br><input type="text" name="memberNo" value="${loginUser.memberNo}"><br>
    이름<br><input type="text" name="nickname" value="${loginUser.nickname}"><br>
    이메일<br><input type="text" name="email" value="${loginUser.email}"><br>
    연락처<br><input type="text" name="tel" value="${loginUser.tel}"><br>
    우편번호<br><input type="text" name="postNo" value="${loginUser.postNo}"><br>
    기본주소<br><input type="text" name="baseAddress" value="${loginUser.baseAddress}"><br>
    상세주소<br><input type="text" name="detailAddress" value="${loginUser.detailAddress}"><br>
    결제수단<br><input type="text" name="paymentMethod" value="${order.paymentMethod}"><br><hr>
    관리자<br><br>
    입금일<br><input type="date" name="paymentDate" value="${order.paymentDate}"><br>
    주문상태<br><input type="text" name="shipDate" value="${order.shipDate}"><br>
    상품번호<br><input type="text" name="no" value="${product.productNo}"><br>
    할인률<br><input type="text" name="discount" value="${product.discount}"><br>
    <button>주문</button>
  </form>
  <jsp:include page="../footer.jsp"/>
  <script>
    var totalPrice = document.querySelector('#totalPrice');
    var resultPrice = parseInt(totalPrice.innerHTML);
    totalPrice.innerHTML = resultPrice;
  </script>
</body>
</html>