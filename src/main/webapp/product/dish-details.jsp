<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>WhatForLunch</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>


<style>
    .header {
        /*display: flex;*/
        background-image: url("https://gofood.in/public/assets/webs/img/bg.png");
        background-repeat: no-repeat;
        background-size: cover;
        position: relative;
        background-color: rgb(255, 255, 255, 0.5) !important;
        padding-top: 11px;
        height: 95px;
    }


    .overlay {
        position: absolute;
        top: 0;
        right: 0;
        bottom: 0;
        left: 0;
        background-color: rgba(0, 0, 0, 0.3);
        pointer-events: none;
    }

    .price {
        margin-bottom: 0;
    }

    li {
        list-style-type: none;
    }
</style>
</head>
<body>

<div class="header container">
    <div class="overlay"></div>
    <div class="navbar" style="margin-left: 20px">
        <nav class="navbar navbar-expand-lg navbar-light bg-light"
             style="background-color: rgb(255,255,255,0) !important;">
            <div class="container-fluid">
                <a class="navbar-brand" href="/users?action=home" style="color: white; font-size: 20px">Trang
                    chủ</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <c:if test="${sessionScope.isLogin==true}">
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0" style="padding-left: 700px">
                            <li class="nav-item dropdown" style="margin-left: 20px">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button"
                                   data-bs-toggle="dropdown" aria-expanded="false"
                                   style="color: white; font-size: 20px">Nhà hàng</a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <li><a class="dropdown-item" href="/users?action=comfirmpassword">Chuyển sang
                                        nhà hàng của tôi</a></li>
                                </ul>
                            </li>


                            <li class="nav-item dropdown" style="margin-left: 20px">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown2" role="button"
                                   data-bs-toggle="dropdown" aria-expanded="false"
                                   style="color: white; font-size: 20px">
                                        ${user.name}
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <li><a class="dropdown-item" href="/users?action=edit&id=${user.id}">Sửa thông
                                        tin</a></li>
                                    <li><a class="dropdown-item" href="/users?action=merchant">Đăng ký quán</a>
                                    </li>
                                    <li><a class="dropdown-item" href="/display/billUser.jsp">Đơn đã đặt</a></li>
                                    <li>
                                        <hr class="dropdown-divider">
                                    </li>

                                    <li><a class="dropdown-item" href="/users?action=logout">Đăng xuất</a></li>

                                </ul>
                            </li>

                            <li class="nav-item dropdown" style="margin-left: 20px">
                                <a class="nav-link" href="/products?action=cart" role="button" aria-expanded="false"
                                   style="color: white; font-size: 19px">
                                    Giỏ hàng
                                </a>
                            </li>
                        </ul>
                    </div>
                </c:if>
            </div>
        </nav>
    </div>
</div>


<div class="container" style=" margin-top: 50px">
    <div class="left-content" style="float: left">
        <img style="height: 321px; width: 516px; "
             src="${product.productImg}">

    </div>

    <div class="right-content" style="float: left">

        <p style="margin-left: 100px; font-size: 40px;margin-top: -12px ; font-weight: bold">${product.productName} </p>

        <p style="margin-left: 100px; font-size: 20px;"><i class="fa-solid fa-eye" style="color: #ff4501;"></i> Lượt
            xem: ${product.view}  </p>
        <p style="margin-left: 100px; font-size: 20px"><i class="fa-solid fa-truck" style="color: #ff4501;"></i> Số lượt
            đã đặt: ${product.orders}</p>
        <p style="margin-left: 100px; font-size: 20px"><i class="fa-solid fa-book" style="color: #ff4501;"></i> Ghi
            chú: ${product.note}</p>
        <p style="margin-left: 100px; font-size: 20px"><i class="fa-solid fa-clock" style="color: #ff4501;"></i> Thời
            gian chế biến: ${product.waitTime} phút</p>
        <p style="margin-left: 100px; font-size: 20px"><i class="fa-solid fa-sack-dollar" style="color: #ff4501;"></i>
            Giá tiền: ${product.price} &#8363</p>
        <p>
            <c:if test="${sessionScope.isLogin==true}">
                <a style="margin-left: 98px; background-color: orangered; height: 38px "
                   href="/products?action=add-product-cart&id=${product.idProduct}"
                   class="btn btn-primary"> Thêm vào giỏ hàng </a>
            </c:if>
        </p>

        <p>
        <form method="get" action="/users" id="restaurant${product.idMerchant}" style="cursor: pointer;">
            <%--              onclick="redirectToUsers(this.id)">--%>
            <%--    <input type="hidden" value="/users?action=restaurant">--%>
            <%--&lt;%&ndash;            <a style="margin-left: 650px; color: orangered; font-size: 16px" href="/users?action=restaurant">Chi tiết nhà hàng</a>&ndash;%&gt;--%>

            <%--        <input type="hidden" name="idMerchant" value="${product.idMerchant}">--%>


            <input type="hidden" name="action" value="restaurant"/>
            <input type="hidden" name="idMerchant" value="${product.idMerchant}"/>
            <input type="submit" style="margin-left: 610px; background-color: white; border: none; color: orangered"
                   value="Chi tiết nhà hàng >">
        </form>
        </p>
    </div>
</div>


<hr class="container" style="color: black; margin-top: 380px">

<div class="container">
    <h2 style="padding-top: 40px">GỢI Ý MÓN ĂN</h2>
    <div class="row mb-2" style="padding-top: 50px;">
        <c:forEach items="${productRecommend}" var="productRecommend">
            <div class="card" style="width: 500px;height: 162px;margin-right: 50px;margin-bottom: 20px">
                <div class="row no-gutters">
                    <div class="col-sm-5" style="padding: 0;height: 139px">
                        <img class="card-img" src="${productRecommend.productImg}" alt="Suresh Dasari Card"
                             style="height: 160px">
                    </div>
                    <div class="col-sm-7" style="float: right">
                        <form method="get" action="/products" id="restaurant${productRecommend.idProduct}"
                              style="cursor: pointer;"
                              onclick="redirectToUsers(this.id)">
                            <input type="hidden" name="action" value="dish-detail"/>
                            <input type="hidden" name="productId" value="${productRecommend.idProduct}"/>
                            <div class="card-body">
                                <h5 class="card-title" style="padding-bottom: 5px">${productRecommend.productName}</h5>
                                <p class="card-text"><i class="fa-solid fa-sack-dollar" style="color: #ff4501"></i> ${productRecommend.price}
                                    &#8363</p>
                                <c:if test="${sessionScope.isLogin==true}">
                                    <a style="width: 60px;border: orangered;background: orangered"
                                       href="/products?action=add-product-cart&id=${productRecommend.idProduct}"
                                       class="btn btn-primary"><i style="font-size: 20px" class='bx bx-cart'></i> </a>
                                </c:if>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>


<footer class="text-center text-lg-start bg-light text-muted">
    <section class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom">
    </section>
    <section class="">
        <div class="container text-center text-md-start mt-5">
            <div class="row mt-3">
                <div class="col-md-3 col-lg-4 col-xl-3 text-left mb-4" style="margin-left: 104px">
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
                    <h6 class=" text-uppercase fw-bold mb-4">
                        Liên hệ
                    </h6>
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
    function redirectToUsers(id) {
        document.getElementById(id).submit();
    }
</script>
</html>