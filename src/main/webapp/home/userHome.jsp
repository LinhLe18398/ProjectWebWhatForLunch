<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.io.IOException" %><%--
  Created by IntelliJ IDEA.
  User: lengoclinh
  Date: 23/10/2023
  Time: 15:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>User Home</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<style>
  .div-login-signup {
    float: right;
    padding-top: 10px;
    padding-right: 10px;
  }


</style>
<body>
<input type="text" value="${user.id}" id="idUser" hidden="hidden">
<div class="div-login-signup" id="button-full">
  <a href="/users?action=login">
    <button type="submit" class="btn btn-primary btn-sm">Login</button>
  </a>
  <a href="/users?action=create">
    <button type="submit" class="btn btn-secondary btn-sm">Signup</button>
  </a>
</div>

<c:if test="${sessionScope.isLogin==true}">
  <nav style="float: right" class="nav">
    <div class="container mt-3">
      <div class="dropdown">
        <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown">
          &#9776;
        </button>
        <ul class="dropdown-menu">
          <li><a class="dropdown-item" href="/users?action=edit&id=${user.id}">edit profile</a></li>
          <li><a class="dropdown-item" href="/users?action=merchant">Register Merchant</a></li>
          <li><a class="dropdown-item" href="/users?action=comfirmpassword">switch merchant</a></li>
          <li><a class="dropdown-item" href="/users?action=logout">log out</a></li>
        </ul>
      </div>
    </div>
  </nav>
</c:if>

<div style="text-align: center">
  <h1>Home User</h1>
</div>

<section style="background-color: #eee;">
  <div class="container py-5">
    <div class="row justify-content-center mb-3">
      <div class="col-md-12 col-xl-10">
        <div class="card shadow-0 border rounded-3">
          <div class="card-body">
            <div class="row">
              <c:forEach var="product" items="${pro}">
                <div class="col-md-12 col-lg-3 col-xl-3 mb-4 mb-lg-0">
                  <div class="bg-image hover-zoom ripple rounded ripple-surface">
                    <img src="${product.productImg}"
                         class="w-100" width="100"/>
                    <a href="#!">
                      <div class="hover-overlay">
                        <div class="mask"
                             style="background-color: rgba(253, 253, 253, 0.15);"></div>
                      </div>
                    </a>
                  </div>
                </div>
                <div class="col-md-6 col-lg-6 col-xl-6">
                  <h5>${product.productName}</h5>
                  <div class="mb-1 text-muted small">
                    <span>address: ${user.address}</span>
                  </div>
                  <div class="mb-1 text-muted small">
                    <span>Phí Dịch Vụ: ${product.serviceFee}</span>
                  </div>
                    <%--                                    <div class="mb-1 text-muted small">--%>
                    <%--                                        <span>Mã Giảm Giá: ${product.sale}</span>--%>
                    <%--                                    </div>--%>
                  <div class="mb-1 text-muted small">
                    <span>Giờ Mở Cửa: 8:00</span>
                  </div>
                  <div class="mb-1 text-muted small">
                    <span>Thời Gian Chuẩn Bị: ${product.waitTime}</span>
                  </div>
                </div>
                <div class="col-md-6 col-lg-3 col-xl-3 border-sm-start-none border-start">
                  <div class="d-flex flex-row align-items-center mb-1">
                    <h4 class="mb-1 me-1">${product.price}</h4>
                    <span class="text-danger"><s>${product.sale}</s></span>
                  </div>
                  <h6 class="text-success">Free shipping</h6>
                  <div class="d-flex flex-column mt-4">
                    <c:if test="${sessionScope.isLogin==true}">
                      <button class="btn btn-primary btn-sm" type="button" id="button-full">Buy
                      </button>
                      <button class="btn btn-outline-primary btn-sm mt-2" type="button"
                              id="button-full">
                        Add to cart
                      </button>
                    </c:if>
                  </div>
                </div>
              </c:forEach>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
</body>
</html>
<script>
  let idUser = document.getElementById("idUser").value;
  if (idUser != 0) {
    document.getElementById("button-full").hidden = true;

  } else {
    document.getElementById("button-full").hidden = false;
  }
</script>