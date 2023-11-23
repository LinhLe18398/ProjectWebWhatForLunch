<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: tuan
  Date: 06/11/2023
  Time: 16:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>WhatForLunch</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body>

<header class="container"
        style="box-shadow: 0px 2px 2px rgba(0,0,0,0.5); position: fixed; top: 0 ;left: 0;right: 0;background-color: white">
    <div style="float: left">
        <h1>&#8962; | Merchant</h1>
    </div>
    <input type="text" value="${user.id}" id="idUser" hidden="hidden">
    <div class="div-login-signup" id="button-full" style="float: right">
        <a href="/users?action=login">
            <button type="submit" class="btn btn-primary btn-sm">Đăng Nhập</button>
        </a>
        <a href="/users?action=create">
            <button type="submit" class="btn btn-secondary btn-sm">Đăng Kí</button>
        </a>
    </div>
</header>
<form action="/users?action=restaurant">
    <main class="container" style="padding-top: 100px">

        <div style="padding-bottom: 50px">
            <h1>${merchants.restaurantName}</h1>
            <div style="display: flex">
                <p style="padding-right: 30px">&#9734; 4,3</p>
                <p>&#8855; 40 phút &#8226; 2,6km</p>
            </div>
            <div style="display: flex">
                <p style="padding-right: 30px">Địa Chỉ</p>
                <p>${merchants.address}</p>
            </div>
        </div>


        <hr>

        <h2>Menu</h2>
        <c:forEach items="${products}" var="products">
            <div class="card mb-6" style="width: 328px; display: inline-block">
                <div class="row g-0 mb-6">
                    <div class="col-md-4" style="max-height: 154px ; max-width: 100%">
                        <img src="${products.productImg}"
                             width="100" class="img-fluid rounded-start" alt="..."
                             style="max-width: 100%;height: 108px">
                    </div>
                    <div class="col-md-8">
                        <div class="card-body" style="padding: 10px; max-width: 100%;height: 155px">
                            <h5 class="card-title">${products.productName}</h5>
                            <p class="card-text">${products.price}</p>
                            <c:if test="${sessionScope.isLogin==true}">
                                <a href="#" class="btn btn-primary">Thêm vào giỏ</a>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
        <div style="padding-top: 20px">
            <td class="container">
                <a href="/users?action=home" style="color:#FF7F3F "><i class="fa fa-angle-left"></i>Home</a>
            </td>
        </div>
    </main>

</form>

<footer class="text-center text-lg-start bg-light text-muted">
    <section class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom">
    </section>
    <section class="">
        <div class="container text-center text-md-start mt-5">
            <div class="row mt-3">
                <div class="col-md-3 col-lg-4 col-xl-3 text-left mb-4">
                    <h6 class="text-uppercase fw-bold mb-4">
                        <i class="fas fa-gem me-3"></i>CT CNHH 5 thành viên
                    </h6>
                    <p>
                        Here you can order all delicious Vietnamese dishes.
                    </p>
                </div>
                <div class="col-md-2 col-lg-2 col-xl-2 text-left mb-4">
                    <h6 class="text-uppercase fw-bold mb-4">
                        Sản phẩm
                    </h6>
                    <p>Thông tin</p>
                    <p>Trợ giúp</p>
                </div>
                <div class="col-md-3 col-lg-2 col-xl-2 text-left mb-4">
                    <h6 class="text-uppercase fw-bold mb-4">
                        Thành viên
                    </h6>
                    <p>Ngoc Linh</p>
                    <p>Van Tuan</p>
                    <p>Cat Hai</p>
                    <p>Gia Minh</p>
                    <p>Minh Hieu</p>
                </div>
                <div class="col-md-4 col-lg-3 col-xl-3 text-left mb-md-0 mb-4">
                    <p>Hoài Đức - Hà Nội</p>
                    <p>
                        WebWhatForLunch@gmail.com
                    </p>
                    <p> +84 88658023</p>
                    <p> +84 38301773</p>
                </div>
            </div>
        </div>
    </section>
    <div class="text-center p-4" style="background-color: lightgray;">
        © 2023 WebWhatForLunch
    </div>
</footer>
</body>
<script>
    let idUser = document.getElementById("idUser").value;
    if (idUser != 0) {
        document.getElementById("button-full").hidden = true;
    } else {
        document.getElementById("button-full").hidden = false;
    }
</script>
</html>
