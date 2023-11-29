<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: tuan
  Date: 24/10/2023
  Time: 22:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="/home/merchantHome.css" type="text/css" rel="stylesheet"/>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
            integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
          integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <title>WhatForLunch</title>

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
                <ul class="navbar-nav me-auto mb-2 mb-lg-0" style="padding-left: 590px">

                    <li style="padding-top: 8px">
                        <a href="/products?action=home-merchant" id="a" onclick="listClick(this.id)"
                           style="color: white; font-size: 19px; padding-right: 30px; text-decoration: none">Quản lí sản
                            phẩm</a>
                    </li>
                    <li style="padding-top: 8px">
                        <a href="/bill?action=bill-merchant" id="b" onclick="listClick(this.id)"
                           style="color: white; font-size: 19px; text-decoration: none"> Quản lí đơn</a>
                    </li>

                    <li class="nav-item dropdown" style="margin-left: 20px">
                        <a class="nav-link" href="/bill?action=income-merchant" role="button" aria-expanded="false"
                           style="color: white; font-size: 19px; ">Doanh thu</a>
                    </li>

                    <li style="padding-top: 8px">
                        <a style="color: white; font-size: 19px; padding-right: 30px; text-decoration: none; margin-left: 20px"
                           href="/users?action=home">Đăng xuất</a>
                    </li>
                </ul>
            </div>
            </c:if>
    </div>
    </nav>
</div>
</div>


<div class="item item2" style="margin-left: 140px; margin-top: 45px;">
    <form action="/products?action=search" method="post">
        <div class="ab box search">
            <div style="float: left">
                <p style="margin-right: 17px;padding-left: 144px; font-size: 23px; padding-top: 10px;">Tìm kiếm</p>
            </div>
            <div class="search-box">

                <input type="text" name="keyword" class="search-input " placeholder="Nhập tên món ăn"/>
                <button class="search-btn" type="submit">
                    <i class="fa fa-search"></i>
                </button>
            </div>
        </div>
    </form>
</div>


<div class="item item3">
    <div class="notification-div">
        <hr class="hr"/>
    </div>
</div>
</div>

<div class="clearfix"></div>
<br/>
<div class="clearfix"></div>
<br/>

<div class="container ab box">
    <div class="col-div-12">
        <div class="content-box">
            <p class="list"> Quản lý sản phẩm
                <span>
                            <button class="ip-add" type="submit"><a style="text-decoration: none"
                                                                    href="/products?action=create-product">+Thêm</a></button>
                            <button class="ip-selectAll" type="submit"><a style="text-decoration: none"
                                                                          href="/products?action=home-merchant">Quay lại</a></button>
                    </span>
            </p>
            <br/>
            <table>
                <thead>
                <tr>
                    <th>Món ăn</th>
                    <th style="text-align: center">Ảnh</th>
                    <th style="text-align: center">Giá tiền</th>
                    <th style="text-align: center">Thời gian chờ</th>
                    <th style="text-align: center">Lượt xem</th>
                    <th style="text-align: center">Số đơn</th>
                    <th style="padding-left: 50px">Ghi chú</th>
                    <th style="width: 132px; text-align: center;">Cập nhật/Xoá</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${productList}" var="list">
                    <tr>
                            <%--                        <td style="float: left">${list.productName}</td>--%>
                        <td>${list.productName}</td>
                        <td><img style="width: 162px; height: 100px;" src="${list.productImg}"></td>
                        <td>
                            Giá sản phẩm:&nbsp;<span class="price">${list.price}</span><br>
                            Mức giảm giá:&ensp;<span class="price">${list.sale}</span><br>
                            Phí dịch vụ:&ensp;&emsp;<span class="price">${list.serviceFee}</span>
                        </td>
                        <td style="text-align: center">${list.waitTime}</td>
                        <td style="text-align: center">${list.view}</td>
                        <td style="text-align: center">${list.orders}</td>
                        <td>${list.note}</td>
                        <td style="text-align: center;">
                            <button class="ip-update" type="button"
                                    onclick="location.href='/products?action=update-product&id=${list.idProduct}'">
                                <i class="fa fa-pencil"></i>
                            </button>
                            <button class="ip-delete" type="button"
                                    onclick="location.href='/products?action=delete-product&id=${list.idProduct}'">
                                <i class="fa fa-trash"></i>
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>



</div>
<div class="clearfix"></div>
</div>

<footer class="text-center text-lg-start bg-light text-muted" style="margin-top: 80px">
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
    $(document).ready(function () {
        $(".profile p").click(function () {
            $(".profile-div").toggle();

        });
        $(".noti-icon").click(function () {
            $(".notification-div").toggle();
        });

    });



    let numberElements = document.getElementsByClassName("price");
    for (let i = 0; i < numberElements.length; i++) {
        let numberElement = numberElements[i];
        let number = parseInt(numberElement.textContent);
        let formattedNumber = number.toLocaleString();
        numberElement.textContent = formattedNumber + "₫";
    }


</script>

</html>