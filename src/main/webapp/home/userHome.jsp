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
    <title>WhatForLunch</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
            integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
            integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css'>
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.3/owl.carousel.min.css'>
    <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'>


    <link href="https://gofood.in/public/assets/webs/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <link href="https://gofood.in/public/assets/webs/vendor/fontawesome/css/all.min.css" rel="stylesheet">

    <link href="https://gofood.in/public/assets/webs/vendor/icofont/icofont.min.css" rel="stylesheet">

    <link href="https://gofood.in/public/assets/webs/vendor/select2/css/select2.min.css" rel="stylesheet">

    <link href="https://gofood.in/public/assets/webs/css/main.css" rel="stylesheet">

    <link rel="stylesheet" href="https://gofood.in/public/assets/webs/vendor/owl-carousel/owl.carousel.css">

    <link rel="stylesheet" href="https://gofood.in/public/assets/webs/vendor/owl-carousel/owl.theme.css">

    <link rel="stylesheet" href="https://gofood.in/public/assets/css/custom.css?q=12">

    <link rel="stylesheet" href="https://gofood.in/public/assets/css/photoviewer.css">

    <link rel="stylesheet" href="https://gofood.in/public/assets/css/search_box.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
          integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>

    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>


</head>
<style>
    .btn {
        box-shadow: none !important;
    }
    ::placeholder {
        font-size: 16px;
    }

    body {
        max-height: 100%;
    }

    .col-md-3 {
        flex: 0 0 23%;
    }

    @import url("https://fonts.googleapis.com/css2?family=Mulish:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&amp;display=swap");

    .search {
        /*position: relative;*/
        box-shadow: 0 0 40px rgba(51, 51, 51, .1);
    }

    .search input {
        height: 60px;
        /*text-indent: 25px;*/
        border: 2px solid #d6d4d4;
        width: 390px;
    }

    .search button {
        width: 110px;
        background: #FF7F3F;
    }

    .navbar {
        margin-left: 300px;

    }

    .text-content {
        /*margin-top: 40px;*/
        text-align: center;
        margin-top: 28px;
    }

    .search {
        margin-top: 50px;
        padding-bottom: 60px;
    }

    .header {
        background-image: url("https://gofood.in/public/assets/webs/img/bg.png");
        background-repeat: no-repeat;
        background-size: cover;
        position: relative;
        background-color: rgb(255, 255, 255, 0.5) !important;
        height: 700px;
    }

    .listPage {
        padding: 10px;
        text-align: center;
        list-style: none;
    }

    .listPage li {
        background-color: #ffffffBD;
        padding: 20px;
        display: inline-block;
        margin: 0 10px;
        cursor: pointer;
    }

    .header .overlay {
        opacity: 0.5;
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
    }

    .listPage .active {
        background-color: #B192EF;
        color: #fff;
    }

    a {
        cursor: pointer;
        color: #212529;
    }

    .price {
        display: inline-block;
    }

    .card-text {
        font-size: 12px;
        color: #212529;
    }

    #main-footer {
        background-image: url("https://img4.thuthuatphanmem.vn/uploads/2020/07/05/hinh-anh-background-ban-do-the-gioi_034909785.jpg");
    }

    #bot-footer {
        background-image: url("https://img4.thuthuatphanmem.vn/uploads/2020/07/05/hinh-anh-background-ban-do-the-gioi_034909785.jpg");

    }

    .h1-banner {
        margin-top: 30px;
    }

    li {
        list-style-type: none;
    }

</style>
<body>
<div class="header">
    <div class="overlay"></div>
    <input type="text" value="${user.id}" id="idUser" hidden="hidden">
    <div class="div-login-signup" id="button-full" style="float: right; margin:8px 6px 0px 0px">
        <a href="/users?action=login">
            <button type="submit" class="btn btn-primary btn-sm" style="position: relative">Đăng Nhập</button>
        </a>
        <a href="/users?action=create">
            <button type="submit" class="btn btn-secondary btn-sm" style="position: relative">Đăng Kí</button>
        </a>
    </div>
    <div style="clear: both"></div>
    <c:if test="${sessionScope.isLogin==true}">
        <div class="navbar" style="margin-left: 900px">
            <nav class="navbar navbar-expand-lg navbar-light bg-light"
                 style="background-color: rgb(255,255,255,0) !important;">
                <div class="container-fluid">
                    <a class="navbar-brand" href="/users?action=home" style="color: white; font-size: 18px">Trang
                        chủ</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item dropdown" style="margin-left: 20px">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button"
                                   data-bs-toggle="dropdown" aria-expanded="false"
                                   style="color: white; font-size: 18px">
                                    Nhà hàng
                                </a>

                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <c:if test="${sessionScope.isLogin == true}">
                                        <li id="button-hidden">
                                            <a class="dropdown-item" href="/users?action=merchant">Đăng ký nhà hàng</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${sessionScope.isLogin == true}">
                                        <input type="text" hidden="hidden" id="IdMerchant"
                                               value="${merchantId.idMerchant}">
                                        <li id="button-merchant">
                                            <a class="dropdown-item" href="/users?action=comfirmpassword">Chuyển sang
                                                nhà hàng của tôi</a>
                                        </li>
                                    </c:if>
                                </ul>

                            </li>
                            <li class="nav-item dropdown" style="margin-left: 20px">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown2" role="button"
                                   data-bs-toggle="dropdown" aria-expanded="false"
                                   style="color: white; font-size: 18px">
                                        ${user.name}
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <li><a class="dropdown-item" href="/users?action=edit&id=${user.id}">Sửa thông
                                        tin</a></li>
                                    <li><a class="dropdown-item" href="/bill?action=bill-user">Đơn đã đặt</a></li>
                                    <li>
                                        <hr class="dropdown-divider">
                                    </li>

                                    <li><a class="dropdown-item" href="/users?action=logout">Đăng xuất</a></li>

                                </ul>
                            </li>

                            <li class="nav-item dropdown" style="margin-left: 20px">
                                <a class="nav-link" href="/products?action=cart" role="button" aria-expanded="false"
                                   style="color: white; font-size: 18px">
                                    Giỏ hàng
                                </a>

                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
    </c:if>
    <div class="text-content">
        <h1 style="color: white; position: relative">Khám phá những món ăn ngon nhất &</h1>
        <h1 style="color: white; position: relative">Đồ uống ở Hà Nội</h1>
    </div>
    <%--search--%>
    <div class="search">
        <div class="container">
            <div class="row height d-flex justify-content-center align-items-center">
                <div class="col-md-8">
                    <div class="search" style="display: flex ; padding-left: 40px">
                        <div style="margin: 5px">
                            <form id="quick-search" method="get">
                                <input type="hidden" name="action" value="search">
                                <select class="form-select" id="option_tag" name="quick_search"
                                        aria-label="Default select example"
                                        style="height: 60px" onchange="quickSearch()">
                                    <option selected>
                                        <c:choose>
                                            <c:when test="${empty tagSearch}">Tìm nhanh</c:when>
                                            <c:otherwise>${tagSearch}</c:otherwise>
                                        </c:choose>
                                    </option>
                                    <option value="Breakfast">Đồ ăn sáng</option>
                                    <option value="Coffee">Cafe</option>
                                    <option value="Lunch">Đồ ăn trưa</option>
                                    <option value="Dinner">Đồ ăn tối</option>
                                </select>
                            </form>
                        </div>
                        <div style="margin: 5px; display: inline-block">
                            <input type="text" id="search-input" class="form-control"
                                   placeholder="Nhập tên món ăn " value="${nameSearch}">
                        </div>
                        <div style="margin: 5px; display: inline-block">
                            <form id="search-name" action="/bill" method="get">
                                <input type="hidden" name="action" value="search">
                                <input type="hidden" id="hidden_tag_search" name="quick_search" value="">
                                <input type="hidden" id="hidden-name-search" name="name_search" value="">
                                <button type="submit" style="height: 60px; font-size: 16px" class="btn btn-danger"
                                        onclick="searchByName()">Tìm kiếm
                                </button>
                            </form>
                        </div>
                        </form>
                    </div>
                </div>
            </div>


            <div class="container">
                <div class="row d-flex align-items-center py-lg-4">
                    <div class="owl-carousel owl-carousel-category owl-theme owl-loaded owl-drag">
                        <div class="owl-stage-outer">
                            <div class="owl-stage"
                                 style="transform: translate3d(-1460px, 0px, 0px); transition: all 1s ease 0s; width: 2282px;">

                                <c:forEach items="${productBestSale}" var="productBestSale">
                                    <div class="owl-item cloned" style="width: 91.25px;">
                                        <div class="item">
                                            <div class="osahan-category-item" style="height: 120px">

                                                <a href="#">

                                                    <img class="img-fluid" style="height: 65px"
                                                         src="${productBestSale.productImg}">

                                                    <h6>${productBestSale.productName}</h6>

                                                    <p style="color:black;">${productBestSale.price}&#8363</p>
                                                </a>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="owl-item cloned" style="width: 91.25px;">

                                        <div class="item">

                                            <div class="osahan-category-item" style="height: 120px">

                                                <a href="#">

                                                    <img class="img-fluid" style="height: 65px"
                                                         src="${productBestSale.productImg}">

                                                    <h6>${productBestSale.productName}</h6>

                                                    <p style="color: black">${productBestSale.price}&#8363</p>

                                                </a>

                                            </div>

                                        </div>
                                    </div>


                                    <div class="owl-item cloned" style="width: 91.25px;">

                                        <div class="item">

                                            <div class="osahan-category-item" style="height: 120px">

                                                <a href="#">

                                                    <img class="img-fluid" style="height: 65px"
                                                         src="${productBestSale.productImg}">

                                                    <h6>${productBestSale.productName}</h6>

                                                    <p style="color: black">${productBestSale.price}&#8363</p>

                                                </a>

                                            </div>

                                        </div>
                                    </div>
                                </c:forEach>


                            </div>
                        </div>
                        <div class="owl-nav">
                            <button type="button" role="presentation" class="owl-prev"><i
                                    class="fa fa-chevron-left"></i></button>
                            <button type="button" role="presentation" class="owl-next"><i
                                    class="fa fa-chevron-right"></i></button>
                        </div>
                        <div class="owl-dots disabled"></div>
                    </div>

                </div>

            </div>
        </div>


    </div>
</div>
</div>
<%--content--%>
<div class="container">
    <%--8 món ăn được gợi ý--%>

    <h2 style="padding-top: 40px">GỢI Ý MÓN ĂN</h2>
    <div class="row mb-2" style="padding-top: 50px;">
        <c:forEach items="${productRecommend}" var="productRecommend">
            <div class="col-md-3 col-6  item"
                 style="border: thin solid lightgray; width:20%; border-radius: 20px 20px 20px 20px;  max-height: 100%; max-width: 100%; margin-right: 15px; margin-bottom: 15px; padding: 0 ">

                <div style="width: 100%; height: 210px">
                    <img class="card-img-top" src="${productRecommend.productImg}" alt="Card image cap"
                         style="border-top-left-radius: 20px;border-top-right-radius: 20px ; box-shadow: rgb(128,128,128); width: 100% ;height: 100%">
                </div>
                <div class="card-body"
                     style="background-color: #f5efe8 ; border-bottom-right-radius: 20px; border-bottom-left-radius:20px; max-width: 200% ;height: 280px; padding: 10px ">

                    <div style="max-width: 100% ;max-height: 100% ; margin: 0">
                        <form method="get" action="/products" id="restaurant${productRecommend.idProduct}"
                              style="cursor: pointer;"
                              onclick="redirectToUsers(this.id)">
                            <input type="hidden" name="action" value="dish-detail"/>
                            <input type="hidden" name="productId" value="${productRecommend.idProduct}"/>
                            <h5 class="card-title"

                                style=" width: 100%; height: 56px;font-weight: bold;font-size: 23px ;margin-top: 10px;overflow: hidden">${productRecommend.productName}
                                - ${productRecommend.restaurantName}
                            </h5>
                            <p class="card-text ">
                                <li class="icon-tag" style="font-size: large; height: 55px;display: flex">
                            <div style="padding-top: 6px"><i class="fa-solid fa-location-dot"
                                                             style="color: #2b3240;"></i></div>
                            <div style="padding-left: 7px">${productRecommend.address}</div>
                            </li>
                            <li class="icon-tag" style="font-size: large"><i
                                    class="fa-solid fa-clock"></i> ${productRecommend.waitTime} phút
                            </li>
                            <li class="icon-tag" style="font-size: large; padding-top: 5px"><i
                                    class="fa-solid fa-sack-dollar"></i>
                                <p style="font-size: large; color: black" class="price">${productRecommend.price}</p>
                                &#8363
                            </li>
                            </p>
                        </form>
                        <c:if test="${sessionScope.isLogin==true}">
                            <a style="width: 60px"
                               href="/products?action=add-product-cart&id=${productRecommend.idProduct}"
                               class="btn btn-primary"><i style="font-size: 20px" class='bx bx-cart'></i> </a>
                        </c:if>
                        </p>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
    <%--8 món ăn được giảm giá nhất --%>


    <h2 style="padding-top: 40px">MÓN ĂN GIẢM GIÁ</h2>
    <div class="row mb-2" style="padding-top: 50px;">
        <c:forEach items="${productBestSale}" var="productBestSale">
            <div class="col-md-3 col-6  item"
                 style="border: thin solid lightgray ;width:20%; border-radius: 20px 20px 20px 20px; max-height: 100%; max-width: 100%; margin-right: 15px; margin-bottom: 15px; padding: 0">
                <div style="width: 100%; height: 210px">
                    <img class="card-img-top" src="${productBestSale.productImg}" alt="Card image cap"
                         style="border-top-left-radius: 20px;border-top-right-radius: 20px ; box-shadow: rgb(128,128,128); width: 100% ;height: 100%">
                </div>
                <div class="card-body"
                     style="background-color: #f5efe8 ; border-bottom-right-radius: 20px; border-bottom-left-radius:20px; max-width: 200% ;height: 280px; padding: 10px ">

                    <div style="max-width: 100% ;max-height: 100% ; margin: 0">
                        <form method="get" action="/products" id="restaurant${productBestSale.idProduct}"
                              style="cursor: pointer;"
                              onclick="redirectToUsers(this.id)">
                            <input type="hidden" name="action" value="dish-detail"/>
                            <input type="hidden" name="productId" value="${productBestSale.idProduct}"/>
                            <h5 class="card-title"

                                style=" width: 100%;height: 56px;font-weight: bold;font-size: 22px; margin-top: 10px;overflow: hidden">${productBestSale.productName}
                                - ${productBestSale.restaurantName}
                            </h5>
                            <p class="card-text ">
                                <li class="icon-tag" style="font-size: large; height: 55px;display: flex">
                            <div style="padding-top: 6px"><i class="fa-solid fa-location-dot"
                                                             style="color: #2b3240;"></i></div>
                            <div style="padding-left: 7px">${productBestSale.address}</div>
                            </li>
                            <li class="icon-tag" style="font-size: large"><i
                                    class="fa-solid fa-clock"></i> ${productBestSale.waitTime} phút
                            </li>
                            <li class="icon-tag" style="font-size: large; padding-top: 5px"><i
                                    class="fa-solid fa-sack-dollar"></i>
                                <p style="font-size: large; color: black" class="price">${productBestSale.price}</p>
                                &#8363
                            </li>
                            </p>
                        </form>
                        <c:if test="${sessionScope.isLogin==true}">
                            <a style="width: 60px"
                               href="/products?action=add-product-cart&id=${productBestSale.idProduct}"
                               class="btn btn-primary"><i style="font-size: 20px" class='bx bx-cart'></i> </a>
                        </c:if>
                        </p>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
    <%--Menu main--%>
    <h2 style="padding-top: 40px">CÓ THỂ BẠN CẦN TÌM</h2>
    <div class="row mb-2 list" style="padding-top: 50px;">
        <c:forEach items="${pro}" var="pro">
            <div class="col-md-3 col-6  item"
                 style="border: thin solid lightgray; width:20%; border-radius: 20px 20px 20px 20px; max-height: 100%; max-width: 100%; margin-right: 15px; margin-bottom: 15px; padding: 0">
                <div style="width: 100%; height: 210px">
                    <img class="card-img-top" src="${pro.productImg}" alt="Card image cap"
                         style="border-top-left-radius: 20px;border-top-right-radius: 20px ; box-shadow: rgb(128,128,128); width: 100% ;height: 100%">
                </div>
                <div class="card-body"
                     style="background-color: #f5efe8 ; border-bottom-right-radius: 20px; border-bottom-left-radius:20px; max-width: 200% ;height: 280px; padding: 10px ">
                    <div style="max-width: 100% ;max-height: 100% ; margin: 0">
                        <form method="get" action="/products" id="restaurant${pro.idProduct}" style="cursor: pointer;"
                              onclick="redirectToUsers(this.id)">
                            <input type="hidden" name="action" value="dish-detail"/>
                            <input type="hidden" name="productId" value="${pro.idProduct}"/>
                            <h5 class="card-title"
                                style="height: 56px;font-weight: bold;font-size: 22px ; width: 100%; margin: 0;overflow: hidden">${pro.productName}
                                - ${pro.restaurantName}
                            </h5>
                            <p class="card-text ">
                                <li class="icon-tag" style="font-size: large; height: 55px;display: flex">
                            <div style="padding-top: 6px"><i class="fa-solid fa-location-dot"
                                                             style="color: #2b3240;"></i></div>
                            <div style="padding-left: 7px">${pro.address}</div>
                            <li class="icon-tag" style="font-size: large"><i
                                    class="fa-solid fa-clock"></i> ${pro.waitTime} phút
                            </li>
                            <li class="icon-tag" style="font-size: large; padding-top: 5px"><i
                                    class="fa-solid fa-sack-dollar"></i>
                                <p style="font-size: large; color: black" class="price">${pro.price}</p> &#8363
                            </li>

                            </p>
                        </form>
                        <p style="margin: 0">
                            <c:if test="${sessionScope.isLogin==true}">
                                <a style="width: 60px" href="/products?action=add-product-cart&id=${pro.idProduct}"
                                   class="btn btn-primary"><i
                                        style="font-size: 20px" class='bx bx-cart'></i></a>
                            </c:if>
                        </p>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
    <ul class="listPage"></ul>
</div>
<!-- Footer -->

<footer class="text-center text-lg-start bg-light text-muted" id="main-footer">
<%--    <section class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom">--%>
<%--    </section>--%>
    <section class="" style="padding-top: 10px; margin-top: 30px">
        <div class="container text-center text-md-start mt-5">
            <div class="row mt-3">
                <div class=" col-md-3 col-lg-4 col-xl-3 text-left mb-4" style="margin-left: 40px">
                    <h6 class="text-uppercase fw-bold mb-4" style="color:white">
                        <i class="fas fa-gem me-3" style="color: white"></i>CT CNHH 5 thành viên
                    </h6>
                    <p style="color: white">
                        Bạn có thể đặt tất cả đồ ăn ngon của Việt Nam tại đây
                    </p>
                </div>
                <div class=" col-md-2 col-lg-2 col-xl-2 text-left mb-4" style="margin-left: 40px">
                    <h6 class=" text-uppercase fw-bold mb-4" style="color: white">
                        Sản phẩm
                    </h6>
                    <p style="color: white">Thông tin</p>
                    <p style="color: white">Trợ giúp</p>
                </div>

                <div class=" col-md-3 col-lg-2 col-xl-2 text-left mb-4" style="margin-left: 40px">
                    <h6 class=" text-uppercase fw-bold mb-4" style="color: white">
                        Thành viên
                    </h6>
                    <p style="color: white">Ngoc Linh</p>
                    <p style="color: white">Van Tuan</p>
                    <p style="color: white">Cat Hai</p>
                    <p style="color: white">Gia Minh</p>
                    <p style="color: white">Minh Hieu</p>
                </div>
                <div class="col-md-4 col-lg-3 col-xl-3 text-left mb-md-0 mb-4" style="margin-left: 40px">
                    <h6 class=" text-uppercase fw-bold mb-4" style="color: white">
                        Liên hệ
                    </h6>
                    <p style="color: white">Hoài Đức - Hà Nội</p>
                    <p style="color: white">
                        WebWhatForLunch@gmail.com
                    </p>
                    <p style="color: white"> +84 88658023</p>
                    <p style="color: white"> +84 38301773</p>
                </div>
            </div>
        </div>
    </section>
    <div class="text-center p-4" id="bot-footer">
        <p style="color:white;">© 2023 WebWhatForLunch</p>
    </div>
</footer>





</body>
</html>
<script>
    let numberElements = document.getElementsByClassName("price");
    for (let i = 0; i < numberElements.length; i++) {
        let numberElement = numberElements[i];
        let number = parseInt(numberElement.textContent);
        let formattedNumber = number.toLocaleString();
        numberElement.textContent = formattedNumber;
    }

    function redirectToUsers(id) {
        document.getElementById(id).submit();
    }

    function quickSearch() {
        document.getElementById("quick-search").submit();
        document.getElementById("name-search").value = "";
    }

    function searchByName() {
        let search = document.getElementById("search-input");
        let optionTag = document.getElementById("option_tag");

        document.getElementById("hidden-name-search").value = search.value;
        document.getElementById("quick_search").value = optionTag.value;
        document.getElementById("search-name").submit();
    }

    let idUser = document.getElementById("idUser").value;
    if (idUser != 0) {
        document.getElementById("button-full").hidden = true;
    } else {
        document.getElementById("button-full").hidden = false;
    }


    var idMerchant = document.getElementById("IdMerchant").value;
    if (idMerchant !== "") {
        document.getElementById("button-merchant").style.display = "block";
    } else {
        document.getElementById("button-merchant").style.display = "none";
    }
    var idMerchant = document.getElementById("IdMerchant").value;
    if (idMerchant !== "") {
        document.getElementById("button-hidden").style.display = "none";
    } else {
        document.getElementById("button-hidden").style.display = "block";
    }


    let thisPage = 1;
    let limit = 8;
    let list = document.querySelectorAll('.list .item');

    function loadItem() {
        let beginGet = limit * (thisPage - 1);
        let endGet = limit * thisPage - 1;
        list.forEach((item, key) => {
            if (key >= beginGet && key <= endGet) {
                item.style.display = 'block';
            } else {
                item.style.display = 'none';
            }
        })
        listPage();
    }

    loadItem();

    function listPage() {
        let count = Math.ceil(list.length / limit);
        document.querySelector('.listPage').innerHTML = '';

        if (thisPage != 1) {
            let prev = document.createElement('li');
            prev.innerText = 'Trở về';
            prev.setAttribute('onclick', "changePage(" + (thisPage - 1) + ")");
            document.querySelector('.listPage').appendChild(prev);
        }

        for (i = 1; i <= count; i++) {
            let newPage = document.createElement('li');
            newPage.innerText = i;
            if (i == thisPage) {
                newPage.classList.add('active');
            }
            newPage.setAttribute('onclick', "changePage(" + i + ")");
            document.querySelector('.listPage').appendChild(newPage);
        }

        if (thisPage != count) {
            let next = document.createElement('li');
            next.innerText = 'Tiếp';
            next.setAttribute('onclick', "changePage(" + (thisPage + 1) + ")");
            document.querySelector('.listPage').appendChild(next);
        }
    }

    function changePage(i) {
        thisPage = i;
        loadItem();
    }


    $(document).ready(function () {

        $('#select-location-modal2').modal({show: true});

        $('#select-location-modal2 button').click(function () {
            $('.navbar-toggler').click();
            $('#hd_cl_form #location_input').focus();
        });

        $('#select-location-modal').modal({show: true});
        $('#select-location-modal button').click(function () {
            $('.navbar-toggler').click();
            $('#hd_cl_form #location_input').focus();
        });
    });

</script>


<script src="https://gofood.in/public/assets/webs/bootstrap.bundle.min.js" type="text/javascript"></script>

<script src="https://gofood.in/public/assets/webs/owl.carousel.js" type="text/javascript"></script>

<script src="https://gofood.in/public/assets/js/classes.js?12" type="text/javascript"></script>

<script src="https://gofood.in/public/assets/js/custom.js?12" type="text/javascript"></script>

<script src="https://gofood.in/public/assets/js/rest_controllers.js?12" type="text/javascript"></script>

<script src="https://gofood.in/public/assets/js/web.js?12" type="text/javascript"></script>

<script src="https://gofood.in/public/assets/js/photoviewer.js" type="text/javascript"></script>

<script src="https://gofood.in/public/assets/js/search_box.js?12123" type="text/javascript"></script>

<script src="https://gofood.in/public/assets/js/orders_controller.js?12" type="text/javascript"></script>